plugins {
    kotlin("jvm") version "1.9.21"
    id("com.github.johnrengelman.shadow").version("8.1.1") // (2)
}

group = "com.fluidcrypto"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation("org.jetbrains.kotlin:kotlin-test")
    implementation(kotlin("stdlib-jdk8")) // (3)
    implementation("com.amazonaws:aws-lambda-java-core:1.2.1")
    implementation("com.amazonaws:aws-lambda-java-events:3.11.0")
}

tasks.test {
    useJUnitPlatform()
}
kotlin {
    jvmToolchain(17)
}