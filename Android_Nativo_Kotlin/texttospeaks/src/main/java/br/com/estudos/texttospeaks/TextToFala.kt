package br.com.estudos.texttospeaks

import android.content.Context
import android.speech.tts.TextToSpeech
import android.speech.tts.Voice
import android.util.Log
import java.util.*

class TextToFala private constructor() {
    companion object {
        private const val TAG = "TextToFala"
        private var context: Context? = null
        private var _instance: TextToFala? = null
        var _UserLocale: Locale? = null

        fun getInstance(c: Context): TextToFala {
            if (_instance == null) {
                _instance = TextToFala()
                context = c
            }
            return _instance!!
        }
    }

    private var speech: TextToSpeech? = null

    fun init(context: Context) {
        _UserLocale = LanguageSettings.getCurrentLocale(context)
        if (speech == null) {
            speech = TextToSpeech(context) { status ->
                if (status == TextToSpeech.SUCCESS) {
                    val userLocale = LanguageSettings.getCurrentLocale(context)
                    val result = speech?.setLanguage(userLocale)
                    if (result != TextToSpeech.LANG_COUNTRY_AVAILABLE &&
                        result != TextToSpeech.LANG_AVAILABLE
                    ) {
                        Log.e(TAG, "don't support that language")
                    }
                }
            }
        }
    }

    fun speechText(text: String) {
        val speakRet = speech?.speak(text, TextToSpeech.QUEUE_ADD, null)
        Log.d(TAG, "speechText() speakRet == $speakRet")
    }

    fun getAvailableLanguages(): Set<Locale> {
        return speech?.availableLanguages ?: emptySet()
    }

    fun getVoice(): Set<Voice> {
        return speech?.voices ?: emptySet()
    }

    fun getVoices(): Set<Voice> {
        return getVoice()
    }

    fun stop(): Int {
        return speech?.stop() ?: TextToSpeech.ERROR
    }

    fun isSpeaking(): Boolean {
        return speech?.isSpeaking ?: false
    }
}
