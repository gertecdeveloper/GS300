package br.com.estudos.msitef

data class RetornoMSitef(
    var CODRESP: String,
    var COMP_DADOS_CONF: String,
    var CODTRANS: String,
    var VLTROCO: String,
    var REDE_AUT: String,
    var BANDEIRA: String,
    var NSU_SITEF: String,
    var NSU_HOST: String,
    var COD_AUTORIZACAO: String,
    var TIPO_PARC: String,
    var NUM_PARC: String,
    var VIA_ESTABELECIMENTO: String,
    var VIA_CLIENTE: String
) {
    fun getNSUHOST() = NSU_HOST

    fun getSitefTipoParcela() = TIPO_PARC

    fun getNSUSitef() = NSU_SITEF

    fun getCodTrans() = CODTRANS

    fun setCodTrans(_cODTRANS: String) {
        this.CODTRANS = _cODTRANS
    }

    fun getNameTransCod() = when (TIPO_PARC) {
        "00" -> "A vista"
        "01" -> "Pré-Datado"
        "02" -> "Parcelado Loja"
        "03" -> "Parcelado Adm"
        else -> "Valor invalido"
    }

    fun getvlTroco() = VLTROCO

    fun getParcelas() = NUM_PARC ?: ""

    fun getCodAutorizacao() = COD_AUTORIZACAO

    fun textoImpressoEstabelecimento() = VIA_ESTABELECIMENTO

    fun textoImpressoCliente() = VIA_CLIENTE

    fun getCompDadosConf() = COMP_DADOS_CONF

    fun getCodResp() = CODRESP

    fun getRedeAut() = REDE_AUT

    fun getBandeira() = BANDEIRA
}
