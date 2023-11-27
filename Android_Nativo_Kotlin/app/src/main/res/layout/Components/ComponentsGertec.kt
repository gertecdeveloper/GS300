package com.example.gs300_2023.components

import android.app.AlertDialog
import android.content.Context

object ComponentsGerte {

    fun dialogoRetorno(s: String, context: Context) {
        var alerta: AlertDialog? = null
        //TODO Fazer algo com a String que foi retornada do sat.
        try {
            // Inicia o Alert
            val builder = AlertDialog.Builder(context)
            // Define o título
            builder.setTitle("Retorno")
            // Define a mensagem
            builder.setMessage(s)
            // Define um botão OK
            builder.setPositiveButton("OK") { _, _ -> }
            // Cria o AlertDialog
            alerta = builder.create()
            // Exibe
            alerta?.show()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
