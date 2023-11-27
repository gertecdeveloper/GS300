package br.com.estudos.texttospeaks

import android.content.Context
import android.content.SharedPreferences
import android.content.res.Configuration
import android.os.Build
import android.os.LocaleList
import android.util.DisplayMetrics
import android.util.Log
import androidx.annotation.RequiresApi
import com.google.gson.Gson

import java.util.*

object LanguageSettings {

    private const val TAG = "LanguageSettings"
    private const val LOCALE_FILE = "LOCALE_FILE"
    private const val LOCALE_KEY = "LOCALE_KEY"

    fun getUserLocale(context: Context): Locale {
        val spLocale = context.getSharedPreferences(LOCALE_FILE, Context.MODE_PRIVATE)
        val localeJson = spLocale.getString(LOCALE_KEY, "") ?: ""
        return jsonToLocale(localeJson)
    }

    fun getCurrentLocale(context: Context): Locale {
        val locale: Locale
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            locale = context.resources.configuration.locales[0]
        } else {
            locale = context.resources.configuration.locale
        }
        return locale
    }

    fun saveUserLocale(context: Context, userLocale: Locale) {
        val spLocal = context.getSharedPreferences(LOCALE_FILE, Context.MODE_PRIVATE)
        val edit = spLocal.edit()
        val localeJson = localeToJson(userLocale)
        edit.putString(LOCALE_KEY, localeJson)
        edit.apply()
    }

    private fun localeToJson(userLocale: Locale): String {
        val gson = Gson()
        return gson.toJson(userLocale)
    }

    private fun jsonToLocale(localeJson: String): Locale {
        val gson = Gson()
        return gson.fromJson(localeJson, Locale::class.java)
    }

    @Suppress("DEPRECATION")
    @RequiresApi(Build.VERSION_CODES.N)
    fun updateLocale(context: Context, newUserLocale: Locale) {
        if (needUpdateLocale(context, newUserLocale)) {
            val configuration = context.resources.configuration
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                configuration.setLocale(newUserLocale)
            } else {
                configuration.locale = newUserLocale
            }
            val displayMetrics = context.resources.displayMetrics
            context.resources.updateConfiguration(configuration, displayMetrics)
            saveUserLocale(context, newUserLocale)
        }
    }

    fun needUpdateLocale(context: Context, newUserLocale: Locale): Boolean {
        return newUserLocale != null && !getCurrentLocale(context).equals(newUserLocale)
    }

    @RequiresApi(Build.VERSION_CODES.N)
    fun setSystemLanguage(locale: Locale) {
        Log.d(TAG, locale.language)
        changeSystemLanguage(LocaleList(locale))
    }

    @RequiresApi(Build.VERSION_CODES.N)
    fun changeSystemLanguage(locale: LocaleList) {
        if (locale != null) {
            try {
                val classActivityManagerNative = Class.forName("android.app.ActivityManagerNative")
                val getDefault = classActivityManagerNative.getDeclaredMethod("getDefault")
                val objIActivityManager = getDefault.invoke(classActivityManagerNative)
                val classIActivityManager = Class.forName("android.app.IActivityManager")
                val getConfiguration = classIActivityManager.getDeclaredMethod("getConfiguration")
                val config = getConfiguration.invoke(objIActivityManager) as Configuration
                Log.d(TAG, "changeSystemLanguage()  LocaleList: " + Gson().toJson(locale))
                config.setLocales(locale)
                val clzParams = arrayOf<Class<*>>(Configuration::class.java)
                val updateConfiguration = classIActivityManager.getDeclaredMethod("updatePersistentConfiguration", *clzParams)
                updateConfiguration.invoke(objIActivityManager, config)
            } catch (e: Exception) {
                Log.d(TAG, "changeSystemLanguage()  Exception: " + e.localizedMessage)
                e.printStackTrace()
            }
        }
    }
}
