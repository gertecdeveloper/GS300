package br.estudos.satfuncoes


import android.content.Context
import android.os.Build
import androidx.annotation.RequiresApi
import com.phi.gertec.sat.satger.SatGerLib
import java.io.BufferedReader
import java.io.BufferedWriter
import java.io.File
import java.io.FileReader
import java.io.FileWriter
import java.io.IOException
import java.io.InputStreamReader
import java.nio.charset.Charset

class SatFunctions(context: Context?) {
    var myContext: Context? = context
    var serialComms: SatGerLib? = SatGerLib(context, dataReceivedListener)





    private val arquivoXmlVendas =
        "arq_venda_modificado_corrigido" // Armazena o nome do arquivo que se encontra no diretorio res/raw

    private val arquivoXmlCancelamento =
        "arq_cancelamento" // AArmazena o nome do arquivo que se encontra no diretorio res/raw



    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @Throws(IOException::class)
    fun enviarConfRede(random: Int, dadosXml: Array<String>, codigoAtivacao: String): String {
        val caminhoXML = "data/data/com.gertec.exemplosgertec/configRede.xml"
        val file = File(caminhoXML)
        if (!file.exists()) {
            file.createNewFile()
        }
        val fw = FileWriter(file.absoluteFile)
        val bw = BufferedWriter(fw)
        bw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
        bw.newLine()
        bw.write("<config>")
        bw.newLine()
        bw.write("<tipoInter>ETHE</tipoInter>")
        bw.newLine()
        dadosXml.forEach { dadoXml ->
            if (dadoXml != "") {
                bw.write(dadoXml)
                bw.newLine()
            }
        }
        bw.write("</config>")
        bw.flush()
        bw.close()

        return try {
            val br = BufferedReader(FileReader(caminhoXML))
            val sb = StringBuilder()
            var line = br.readLine()

            while (line != null) {
                sb.append(line)
                sb.append(System.lineSeparator())
                line = br.readLine()
            }
            val configData = sb.toString()
            retornoDaFuncaoSat(
                serialComms!!.ConfigurarInterfaceDeRede(
                    random,
                    codigoAtivacao,
                    configData
                )
            )
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun versao(): String {
        return try {
            retornoDaFuncaoSat(serialComms!!.VersaoDllGerSAT())
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    fun atualizarSoftware(codAtivacao: String, random: Int): String {
        return try {
            retornoDaFuncaoSat(serialComms!!.AtualizarSAT(random, codAtivacao))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun extrairLog(codAtivacao: String, random: Int): String {
        return try {
            retornoDaFuncaoSat(serialComms!!.ExtrairLogs(random, codAtivacao))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun desbloquearSat(codAtivacao: String, random: Int): String {
        return try {
            retornoDaFuncaoSat(serialComms!!.DesbloquearSAT(random, codAtivacao))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun bloquearSat(codAtivacao: String, random: Int): String {
        return try {
            retornoDaFuncaoSat(serialComms!!.BloquearSAT(random, codAtivacao))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun trocarCodAtivacao(codAtual: String, opt: Int, codNovo: String, random: Int): String {
        return try {
            retornoDaFuncaoSat(
                serialComms!!.TrocarCodigoDeAtivacao(
                    random,
                    codAtual,
                    opt,
                    codNovo,
                    codNovo
                )
            )
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun consultarNumeroSessao(codAtivacao: String, cNumeroDeSessao: Int, random: Int): String {
        return try {
            retornoDaFuncaoSat(
                serialComms!!.ConsultarNumeroSessao(
                    random,
                    codAtivacao,
                    cNumeroDeSessao
                )
            )
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    fun cancelarUltimaVenda(codAtivacao: String, chave: String, random: Int): String {
        return try {
            val ins = myContext!!.resources.openRawResource(
                myContext!!.resources.getIdentifier(
                    arquivoXmlCancelamento,
                    "raw",
                    myContext!!.packageName
                )
            )
            val br = BufferedReader(InputStreamReader(ins))
            val sb = StringBuilder()
            var line = br.readLine()

            while (line != null) {
                sb.append(line)
                sb.append(System.lineSeparator())
                line = br.readLine()
            }
            var vendaData = sb.toString()
            vendaData = vendaData.replace("trocarCfe", chave)

            retornoDaFuncaoSat(
                serialComms!!.CancelarUltimaVenda(
                    random,
                    codAtivacao,
                    chave,
                    vendaData
                )
            )
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    fun enviarTesteVendas(codAtivacao: String, random: Int): String {
        return try {
            val ins = myContext!!.resources.openRawResource(
                myContext!!.resources.getIdentifier(
                    arquivoXmlVendas,
                    "raw",
                    myContext!!.packageName
                )
            )
            val br = BufferedReader(InputStreamReader(ins))
            val sb = StringBuilder()
            var line = br.readLine()

            while (line != null) {
                sb.append(line)
                sb.append(System.lineSeparator())
                line = br.readLine()
            }

            val vendaData = sb.toString()

            retornoDaFuncaoSat(serialComms!!.EnviarDadosVenda(random, codAtivacao, vendaData))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    fun enviarTesteFim(codAtivacao: String, random: Int): String {
        return try {
            val ins = myContext!!.resources.openRawResource(
                myContext!!.resources.getIdentifier(
                    arquivoXmlVendas,
                    "raw",
                    myContext!!.packageName
                )
            )
            val br = BufferedReader(InputStreamReader(ins))
            val sb = StringBuilder()
            var line = br.readLine()

            while (line != null) {
                sb.append(line)
                sb.append(System.lineSeparator())
                line = br.readLine()
            }

            val vendaData = sb.toString()

            retornoDaFuncaoSat(serialComms!!.TesteFimAFim(random, codAtivacao, vendaData))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun consultarStatusOperacional(random: Int, codAtivacao: String): String {
        return try {
            retornoDaFuncaoSat(serialComms!!.ConsultarStatusOperacional(random, codAtivacao))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun consultarSat(random: Int): String {
        return try {
            retornoDaFuncaoSat(serialComms!!.ConsultarSAT(random))
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun associarSat(
        cnpj: String,
        cnpjSW: String,
        codAtivacao: String,
        assinatura: String,
        random: Int
    ): String {
        return try {
            retornoDaFuncaoSat(
                serialComms!!.AssociarAssinatura(
                    random,
                    codAtivacao,
                    "$cnpjSW$cnpj",
                    assinatura
                )
            )
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun ativarSat(codAtivacao: String, cnpj: String, random: Int): String {
        return try {
            val resposta =
                retornoDaFuncaoSat(serialComms!!.AtivarSAT(random, 1, codAtivacao, cnpj, 35))
            println(resposta)
            resposta
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

    fun retornoDaFuncaoSat(s: String): String {
        return try {
            s
        } catch (e: Exception) {
            e.message ?: ""
        }
    }

//   var dataReceivedListener: SatGerLib.OnDataReceived = object : SatGerLib.OnDataReceived {
//        override fun onError(e: java.lang.Exception) {
//            println(e.message)
//        }



    }
private var dataReceivedListener: SatGerLib.OnDataReceived = object : SatGerLib.OnDataReceived {
    override fun onError(e: java.lang.Exception) {
        println(e.message)
    }

    override fun onReceivedDataUpdate(s: String) {
        //TODO Fazer algo com a String que foi retornada do sat.
        try {
            // Trata o retorno da função
            val respostaSplited: Array<String>
            respostaSplited =
                s.split("\\|".toRegex()).dropLastWhile { it.isEmpty() }.toTypedArray()
            val ptext = respostaSplited[2].toByteArray()
            val value = String(ptext, Charset.forName("UTF-8"))
        } catch (e: java.lang.Exception) {
        }
    }
}

