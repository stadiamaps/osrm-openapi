plugins {
    kotlin("jvm") version "2.0.20" apply false
}

gradle.beforeProject {
    extensions.extraProperties["libraryVersion"] = "0.0.10"
}

rootProject.name = "osrm-kotlin"
include("android")
