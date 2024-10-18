import com.vanniktech.maven.publish.JavadocJar
import com.vanniktech.maven.publish.KotlinJvm
import com.vanniktech.maven.publish.SonatypeHost
import org.hidetake.gradle.swagger.generator.GenerateSwaggerCode

plugins {
    kotlin("jvm")
    alias(libs.plugins.swagger.codegen)
    alias(libs.plugins.maven.publish)
}

repositories {
    mavenCentral()
}

dependencies {
    swaggerCodegen(libs.openapi.generator)

    // Dependencies of the generated code. Check out `build.gradle` in your build folder later if you're curious.
    implementation(libs.moshi.kotlin)
    implementation(libs.moshi.adapters)

    testImplementation(kotlin("test"))
}

kotlin {
    jvmToolchain(17)
}

java {
    withSourcesJar()
}

tasks.test {
    useJUnitPlatform()
}

swaggerSources {
  register("osrm") {
      val openApiFile = file("../openapi.yaml")
      require(openApiFile.exists()) { "OpenAPI spec file not found: $openApiFile" }

      setInputFile(openApiFile)
      code(delegateClosureOf<GenerateSwaggerCode> {
          language = "kotlin"
          components = listOf("models")
          additionalProperties = mapOf(
              "groupId" to "com.osrm",
              "packageName" to "com.osrm.api"
          )
          rawOptions = listOf(
              "--skip-validate-spec"
          )
      })
  }
}

// Comment this out if you do NOT want the code gen to run every time you build.
// There is an HTTP cache by default, so it won't necessarily make a request every single build.
tasks.compileKotlin.configure {
    dependsOn(tasks.generateSwaggerCode)
}

// This is a dependency for mavenPublishing.
tasks.named("sourcesJar") {
    dependsOn(tasks.generateSwaggerCode)
}

sourceSets {
    val main by getting
    val osrm by swaggerSources.getting
    main.kotlin.srcDir("${osrm.code.outputDir}/src/main/kotlin")
}

val libraryVersion: String by extra

mavenPublishing {
    publishToMavenCentral(SonatypeHost.CENTRAL_PORTAL)
    signAllPublications()

    if (libraryVersion == "unspecified") {
        throw GradleException("libraryVersion must be specified in settings.gradle.kts")
    }

    coordinates("com.stadiamaps", "osrm-openapi", libraryVersion)

    // TODO: Convert to Dokka?
    configure(KotlinJvm(sourcesJar = true, javadocJar = JavadocJar.Javadoc()))

    pom {
        name.set("OSRM API Models")
        description.set("Serializable objects to build OSRM's API models.")
        url.set("https://github.com/stadiamaps/osrm-openapi")

        licenses {
            license {
                name = "BSD-3-Clause"
                url = "https://spdx.org/licenses/BSD-3-Clause.html"
            }
        }
        developers {
            developer {
                name = "Jacob Fielding"
                organization = "Rallista"
                organizationUrl = "https://rallista.app/"
            }
            developer {
                name = "Ian Wagner"
                organization = "Stadia Maps"
                organizationUrl = "https://stadiamaps.com/"
            }
        }
        scm {
            connection = "scm:git:https://github.com/stadiamaps/osrm-openapi.git"
            developerConnection = "scm:git:ssh://github.com/stadiamaps/osrm-openapi.git"
            url = "http://github.com/stadiamaps/osrm-openapi"
        }
    }
}