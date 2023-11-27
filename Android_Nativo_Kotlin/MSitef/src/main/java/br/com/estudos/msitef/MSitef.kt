package br.com.estudos.msitef

import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import com.google.gson.Gson
import org.json.JSONException
import org.json.JSONObject

class MSitef(private val activity: Activity) {

    companion object {
        const val REQ_CODE_MSITEF = 4321
    }

    private val gson = Gson()


    @Throws(Exception::class)
    fun ExecutaTEF(bundle: Bundle) {
        try {
            val intentSitef = Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF")
            intentSitef.putExtras(bundle)
            activity.startActivityForResult(intentSitef, REQ_CODE_MSITEF)
        } catch (e: Exception) {
            throw Exception(e.message)
        }
    }

    @Throws(JSONException::class)
    fun traduzRetornoMSitef(data: Intent): RetornoMSitef {
        val retornoSitef = gson.fromJson(respSitefToJson(data), RetornoMSitef::class.java)
        return retornoSitef
    }

    @Throws(JSONException::class)
    fun respSitefToJson(data: Intent): String {
        val json = JSONObject()
        json.put("CODRESP", data.getStringExtra("CODRESP"))
        json.put("COMP_DADOS_CONF", data.getStringExtra("COMP_DADOS_CONF"))
        json.put("CODTRANS", data.getStringExtra("CODTRANS"))
        json.put("VLTROCO", data.getStringExtra("VLTROCO"))
        json.put("REDE_AUT", data.getStringExtra("REDE_AUT"))
        json.put("BANDEIRA", data.getStringExtra("BANDEIRA"))
        json.put("NSU_SITEF", data.getStringExtra("NSU_SITEF"))
        json.put("NSU_HOST", data.getStringExtra("NSU_HOST"))
        json.put("COD_AUTORIZACAO", data.getStringExtra("COD_AUTORIZACAO"))
        json.put("NUM_PARC", data.getStringExtra("NUM_PARC"))
        json.put("TIPO_PARC", data.getStringExtra("TIPO_PARC"))
        json.put("VIA_ESTABELECIMENTO", data.getStringExtra("VIA_ESTABELECIMENTO"))
        json.put("VIA_CLIENTE", data.getStringExtra("VIA_CLIENTE"))
        return json.toString()
    }

    fun dialodTransacaoAprovadaMsitef(retornoMsiTef: RetornoMSitef) {
        val cupom = StringBuilder()
        cupom.append("CODRESP: " + retornoMsiTef.getCodResp() + "\n")
        cupom.append("COMP_DADOS_CONF: " + retornoMsiTef.getCompDadosConf() + "\n")
        cupom.append("CODTRANS: " + retornoMsiTef.getCodTrans() + "\n")
        cupom.append("CODTRANS (Name): " + retornoMsiTef.getNameTransCod() + "\n")
        cupom.append("VLTROCO: " + retornoMsiTef.getvlTroco() + "\n")
        cupom.append("REDE_AUT: " + retornoMsiTef.getRedeAut() + "\n")
        cupom.append("BANDEIRA: " + retornoMsiTef.getBandeira() + "\n")
        cupom.append("NSU_SITEF: " + retornoMsiTef.getNSUSitef() + "\n")
        cupom.append("NSU_HOST: " + retornoMsiTef.getNSUHOST() + "\n")
        cupom.append("COD_AUTORIZACAO: " + retornoMsiTef.getCodAutorizacao() + "\n")
        cupom.append("NUM_PARC: " + retornoMsiTef.getParcelas() + "\n")

        val alertDialog = AlertDialog.Builder(activity).create()
        alertDialog.setTitle("Ação executada com sucesso")
        alertDialog.setMessage(cupom.toString())

        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK") { _, _ -> }

        alertDialog.show()
    }
    fun dialodTransacaoNegadaMsitef(retornoMsiTef: RetornoMSitef) {
        val cupom = StringBuilder()
        cupom.append("CODRESP: " + retornoMsiTef.getCodResp())

        val alertDialog = AlertDialog.Builder(activity).create()
        alertDialog.setTitle("Ocorreu um erro durante a realização da ação")
        alertDialog.setMessage(cupom.toString())

        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK") { _, _ -> }

        alertDialog.show()
    }

}
