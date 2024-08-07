import org.hidetake.gradle.swagger.generator.GenerateSwaggerCode

plugins {
    kotlin("jvm")
    id("org.hidetake.swagger.generator") version "2.19.2"
    `maven-publish`
}

repositories {
    mavenCentral()
}

dependencies {
    swaggerCodegen("org.openapitools:openapi-generator-cli:7.5.0")

    // Dependencies of the generated code. Check out `build.gradle` in your build folder later if you're curious.
    val moshiVersion = "1.15.1"
    implementation("com.squareup.moshi:moshi-kotlin:$moshiVersion")
    implementation("com.squareup.moshi:moshi-adapters:$moshiVersion")

    testImplementation(kotlin("test"))
}

kotlin {
    jvmToolchain(17)
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

sourceSets {
    val main by getting
    val osrm by swaggerSources.getting
    main.kotlin.srcDir("${osrm.code.outputDir}/src/main/kotlin")
}

publishing {
    repositories {
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/stadiamaps/osrm-openapi")
            credentials {
                username = System.getenv("GITHUB_ACTOR")
                password = System.getenv("GITHUB_TOKEN")
            }
        }
    }

    publications {
        register<MavenPublication>("gpr") {
            from(components["java"])

            groupId = "com.osrm"
            artifactId = "api"
            version = "0.0.9"
        }
    }
}
