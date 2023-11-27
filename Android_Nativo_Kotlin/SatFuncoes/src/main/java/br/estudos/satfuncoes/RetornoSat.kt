package br.estudos.satfuncoes

import android.annotation.SuppressLint

class RetornoSat(val operacao: String, retornopipe: String) {
    private val retornoPipe: Array<String> = retornopipe.split("\\|".toRegex()).toTypedArray()
    private val retornoDiferente: Boolean
    private val retornoPipeCompleto: String = retornopipe

    val resultadoCompleto: String
        get() = retornoPipeCompleto

    val erroSat: String
        get() {
            if (retornoPipe.size <= 1) {
                return if (retornoPipe[0] == "Failed to find SAT device.") {
                    "Dispositivo SAT não localizado"
                } else {
                    retornoPipe[0]
                }
            }
            if (mensagem == "Codigo de ativação inválido" || mensagem == "Codigo ativação inválido") {
                return mensagem
            }
            return ""
        }

    val numeroSessao: String
        get() = try {
            retornoPipe[0]
        } catch (e: Exception) {
            ""
        }

    val numeroEEEE: String
        get() = try {
            retornoPipe[1]
        } catch (e: Exception) {
            ""
        }

    val mensagem: String
        get() = try {
            if (retornoDiferente) retornoPipe[3] else retornoPipe[2]
        } catch (e: Exception) {
            ""
        }

    val numeroCCCC: String
        get() = try {
            if (retornoDiferente) retornoPipe[2] else ""
        } catch (e: Exception) {
            ""
        }

    val numeroCod: String
        get() = try {
            if (retornoDiferente) retornoPipe[4] else retornoPipe[3]
        } catch (e: Exception) {
            ""
        }

    val mensagemSefaz: String
        get() = try {
            if (retornoDiferente) retornoPipe[5] else retornoPipe[4]
        } catch (e: Exception) {
            ""
        }

    val codigoCSR: String
        get() = try {
            if (operacao == "AtivarSAT") retornoPipe[5] else ""
        } catch (e: Exception) {
            ""
        }

    init {
        retornoDiferente = operacao == "AssociarSAT" || operacao == "EnviarTesteVendas" || operacao == "CancelarUltimaVenda"
    }
    val logBase64: String
        get() = try {
            if (operacao == "ExtrairLog") retornoPipe[5] else ""
        } catch (e: Exception) {
            ""
        }

    val arquivoCFeBase64: String
        get() = try {
            when (operacao) {
                "EnviarTesteVendas", "CancelarUltimaVenda" -> retornoPipe[6]
                "EnviarTesteFim" -> retornoPipe[5]
                else -> ""
            }
        } catch (e: Exception) {
            ""
        }

    val timeStamp: String
        get() = try {
            when (operacao) {
                "EnviarTesteVendas", "CancelarUltimaVenda" -> retornoPipe[7]
                "EnviarTesteFim" -> retornoPipe[6]
                else -> ""
            }
        } catch (e: Exception) {
            ""
        }

    val numDocFiscal: String
        get() = try {
            if (operacao == "EnviarTesteFim") retornoPipe[7] else ""
        } catch (e: Exception) {
            ""
        }

    val chaveConsulta: String
        get() = try {
            if (operacao == "EnviarTesteVendas" || operacao == "CancelarUltimaVenda" || operacao == "EnviarTesteFim") retornoPipe[8] else ""
        } catch (e: Exception) {
            ""
        }

    val valorTotalCFe: String
        get() = try {
            if (operacao == "EnviarTesteVendas" || operacao == "CancelarUltimaVenda") retornoPipe[9] else ""
        } catch (e: Exception) {
            ""
        }

    val cPFCNPJValue: String
        get() = try {
            if (operacao == "EnviarTesteVendas" || operacao == "CancelarUltimaVenda") retornoPipe[10] else ""
        } catch (e: Exception) {
            ""
        }

    val assinaturaQRCODE: String
        get() = try {
            if (operacao == "EnviarTesteVendas" || operacao == "CancelarUltimaVenda") retornoPipe[11] else ""
        } catch (e: Exception) {
            ""
        }
    val estadoDeOperacao: String
        get() = try {
            when (retornoPipe[27]) {
                "0" -> "DESBLOQUEADO"
                "1" -> "BLOQUEADO SEFAZ"
                "2" -> "BLOQUEIO CONTRIBUINTE"
                "3" -> "BLOQUEIO AUTÔNOMO"
                "4" -> "BLOQUEIO PARA DESATIVAÇÃO"
                else -> ""
            }
        } catch (e: Exception) {
            ""
        }

    val numeroSerieSat: String
        get() = try {
            "${retornoPipe[5]}\n"
        } catch (e: Exception) {
            ""
        }

    val tipoLan: String
        get() = "${retornoPipe[6]}\n"

    val ipSat: String
        get() = "${retornoPipe[7]}\n"

    val macSat: String
        get() = "${retornoPipe[8]}\n"

    val mascara: String
        get() = "${retornoPipe[9]}\n"

    val gateway: String
        get() = "${retornoPipe[10]}\n"

    val dns1: String
        get() = "${retornoPipe[11]}\n"

    val dns2: String
        get() = "${retornoPipe[12]}\n"

    val statusRede: String
        get() = "${retornoPipe[13]}\n"

    val nivelBateria: String
        get() = "${retornoPipe[14]}\n"

    val memoriaDeTrabalhoTotal: String
        get() = "${retornoPipe[15]}\n"

    val memoriaDeTrabalhoUsada: String
        get() = "${retornoPipe[16]}\n"

    val dataHora: String
        get() {
            val dataHoraRetorno = retornoPipe[17]
            return "${dataHoraRetorno.substring(6, 8)}/${dataHoraRetorno.substring(4, 6)}/${dataHoraRetorno.substring(0, 4)} ${dataHoraRetorno.substring(8, 10)}:${dataHoraRetorno.substring(10, 12)}:${dataHoraRetorno.substring(12, 14)}\n"
        }

    val versao: String
        get() = "${retornoPipe[18]}\n"

    val versaoLeiaute: String
        get() = "${retornoPipe[19]}\n"

    val ultimoCfeEmitido: String
        get() = "${retornoPipe[20]}\n"

    val primeiroCfeMemoria: String
        get() = "${retornoPipe[21]}\n"

    val ultimoCfeMemoria: String
        get() = "${retornoPipe[22]}\n"

    val ultimaTransmissaoSefazDataHora: String
        get() {
            val dataHoraRetorno = retornoPipe[23]
            return "${dataHoraRetorno.substring(6, 8)}/${dataHoraRetorno.substring(4, 6)}/${dataHoraRetorno.substring(0, 4)} ${dataHoraRetorno.substring(8, 10)}:${dataHoraRetorno.substring(10, 12)}:${dataHoraRetorno.substring(12, 14)}\n"
        }

    val ultimaComunicacaoSefazData: String
        get() {
            val dataHoraRetorno = retornoPipe[24]
            return "${dataHoraRetorno.substring(6, 8)}/${dataHoraRetorno.substring(4, 6)}/${dataHoraRetorno.substring(0, 4)} ${dataHoraRetorno.substring(8, 10)}:${dataHoraRetorno.substring(10, 12)}:${dataHoraRetorno.substring(12, 14)}\n"
        }

}
