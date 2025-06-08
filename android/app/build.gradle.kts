plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.friend_and_foster"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.example.friend_and_foster"
        minSdk = 21
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    // Ensure both Java & Kotlin use Java 11
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    kotlinOptions {
        jvmTarget = "11"
    }

    // (Optional) Use the Gradle JVM toolchain for Kotlin
    kotlin {
      jvmToolchain(11)
    }

    ndkVersion = "27.0.12077973"

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
