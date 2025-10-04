plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.doctor_appointment"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    defaultConfig {
        applicationId = "com.example.doctor_appointment"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "default"

    productFlavors {
        create("development") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Doctor Appointment (Dev)"
            )
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
        }

        create("production") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Doctor Appointment"
            )
            // مفيش applicationIdSuffix هنا عشان تبقى النسخة الرسمية
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Using debug signing for now
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
}

flutter {
    source = "../.."
}
