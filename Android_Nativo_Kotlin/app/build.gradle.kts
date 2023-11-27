plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")

}


android {
    namespace = "com.example.gs300_2023"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.gs300_2023"
        minSdk = 22
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
}

dependencies {
    implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar"))))
    implementation("androidx.core:core-ktx:1.9.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.9.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
    implementation(project(mapOf("path" to ":texttospeaks")))
    implementation(project(mapOf("path" to ":MSitef")))
    implementation(project(mapOf("path" to ":MSitef")))
    implementation(project(mapOf("path" to ":SatFuncoes")))
    implementation(project(mapOf("path" to ":SatFuncoes")))
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")

    // Lib para o TEF
    implementation ("com.google.code.gson:gson:2.9.1")
    implementation("pl.droidsonroids.gif:android-gif-drawable:1.2.27")
}