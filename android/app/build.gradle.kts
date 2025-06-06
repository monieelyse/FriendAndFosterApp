plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
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

    ndkVersion = "27.0.12077973"

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
}

flutter {
    source = "../.."
}
