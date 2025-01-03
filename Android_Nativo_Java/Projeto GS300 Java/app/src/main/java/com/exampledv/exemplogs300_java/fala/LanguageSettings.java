package com.exampledv.exemplogs300_java.fala;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Build;
import android.os.LocaleList;
import android.util.DisplayMetrics;
import android.util.Log;

import androidx.annotation.RequiresApi;

import com.google.gson.Gson;

import java.lang.reflect.Method;
import java.util.Locale;

public class LanguageSettings {

    private static final String TAG = LanguageSettings.class.getName();
    private static final String LOCALE_FILE = "LOCALE_FILE";
    private static final String LOCALE_KEY = "LOCALE_KEY";

    /**
     * Obtém o idioma preferido do usuário salvo nas preferências.
     */
    public static Locale getUserLocale(Context context) {
        SharedPreferences preferences = context.getSharedPreferences(LOCALE_FILE, Context.MODE_PRIVATE);
        String localeJson = preferences.getString(LOCALE_KEY, "");
        return jsonToLocale(localeJson);
    }

    /**
     * Obtém o idioma atual do sistema.
     */
    public static Locale getCurrentLocale(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            return context.getResources().getConfiguration().getLocales().get(0);
        } else {
            return context.getResources().getConfiguration().locale;
        }
    }

    /**
     * Salva o idioma preferido do usuário nas preferências.
     */
    public static void saveUserLocale(Context context, Locale userLocale) {
        SharedPreferences preferences = context.getSharedPreferences(LOCALE_FILE, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();
        String localeJson = localeToJson(userLocale);
        editor.putString(LOCALE_KEY, localeJson);
        editor.apply();
    }

    /**
     * Atualiza o idioma no nível do aplicativo.
     */
    public static void updateLocale(Context context, Locale newUserLocale) {
        if (needUpdateLocale(context, newUserLocale)) {
            Configuration configuration = context.getResources().getConfiguration();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                configuration.setLocale(newUserLocale);
            } else {
                configuration.locale = newUserLocale;
            }
            DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
            context.getResources().updateConfiguration(configuration, displayMetrics);
            saveUserLocale(context, newUserLocale);
        }
    }

    /**
     * Verifica se é necessário atualizar o idioma.
     */
    public static boolean needUpdateLocale(Context context, Locale newUserLocale) {
        return newUserLocale != null && !getCurrentLocale(context).equals(newUserLocale);
    }

    /**
     * Serializa um objeto Locale para JSON.
     */
    private static String localeToJson(Locale userLocale) {
        if (userLocale == null) return "";
        Gson gson = new Gson();
        return gson.toJson(userLocale);
    }

    /**
     * Desserializa um JSON para um objeto Locale.
     */
    private static Locale jsonToLocale(String localeJson) {
        if (localeJson == null || localeJson.isEmpty()) return Locale.getDefault();
        Gson gson = new Gson();
        return gson.fromJson(localeJson, Locale.class);
    }

    /**
     * Altera o idioma do sistema (Requer permissões especiais).
     */
    @RequiresApi(api = Build.VERSION_CODES.N)
    public static void setSystemLanguage(Locale locale) {
        if (locale == null) return;
        try {
            LocaleList localeList = new LocaleList(locale);
            changeSystemLanguage(localeList);
        } catch (Exception e) {
            Log.e(TAG, "Erro ao alterar o idioma do sistema: " + e.getMessage(), e);
        }
    }

    /**
     * Método interno para alterar o idioma do sistema (API interna).
     */
    @RequiresApi(api = Build.VERSION_CODES.N)
    private static void changeSystemLanguage(LocaleList localeList) {
        try {
            Class<?> activityManagerNativeClass = Class.forName("android.app.ActivityManagerNative");
            Method getDefault = activityManagerNativeClass.getDeclaredMethod("getDefault");
            Object iActivityManager = getDefault.invoke(activityManagerNativeClass);

            Class<?> iActivityManagerClass = Class.forName("android.app.IActivityManager");
            Method getConfiguration = iActivityManagerClass.getDeclaredMethod("getConfiguration");
            Configuration config = (Configuration) getConfiguration.invoke(iActivityManager);

            config.setLocales(localeList);
            Method updateConfiguration = iActivityManagerClass.getDeclaredMethod("updatePersistentConfiguration", Configuration.class);
            updateConfiguration.invoke(iActivityManager, config);
        } catch (Exception e) {
            Log.e(TAG, "Erro ao alterar idioma do sistema: " + e.getMessage(), e);
        }
    }
}
