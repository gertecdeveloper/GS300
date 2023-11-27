package br.estudos.satfuncoes

import android.util.Base64
import java.io.UnsupportedEncodingException
import java.nio.charset.Charset


object OperacaoSat {

    fun invocarOperacaoSat(operacao: String?, respostaSat: String?): RetornoSat? {
        return RetornoSat(operacao!!, respostaSat!!)
    }
    // Função que retorna uma String formatada para ser posta no dialogo Sat, com todas as informações do retorno da operação realizada
    // Em caso de erro retorna o erro
    // *Existem operações que vão ter como resultado informações semelhantes
    fun formataRetornoSat(retornoSat: RetornoSat): String {
        var retornoFormatado: String? = ""
        // Verifica se existe um erro no retorno
        if (retornoSat.erroSat.equals("") === false) {
            // Retorna o erro caso exista
            return "Mensagem: " + retornoSat.erroSat
        } else {
            //* Estas informações são padrões a todos os retornos(sempre vão aparecer no Dialogo Sat)
            //* Para mais informações consulte o arquivo retornosSat.txt. É possivel visualizar nele a posição e informação de cada Retorno do Sat.
            retornoFormatado = if (retornoSat.numeroCCCC.equals("") === false) {
                // Se tiver Código CCCC adiciona ele a string formatada
                retornoSat.numeroEEEE + "|" + retornoSat.numeroCCCC + "-"
            } else {
                // Caso não tenha o código CCCC adicionada somente o EEEE
                retornoSat.numeroEEEE + "-"
            }
            retornoFormatado += retornoSat.mensagem
            retornoFormatado += "\n" // Pula linha

            // Verifica se adiciona o Código e Mensagem Sefaz na mensagem, caso não estejam vazios
            if (retornoSat.numeroCod.equals("") === false && retornoSat.mensagemSefaz
                    .equals("") === false
            ) {
                retornoFormatado += "Cod/Mens Sefaz: \n" + retornoSat.numeroCod + "-" + retornoSat.mensagemSefaz
            } else if (retornoSat.numeroCod.equals("") === false) {
                retornoFormatado += "Cod/Mens Sefaz: \n" + retornoSat.numeroCod + "-"
            } else if (retornoSat.mensagemSefaz.equals("") === false) {
                retornoFormatado += "Cod/Mens Sefaz: \n" + "-" + retornoSat.mensagemSefaz
            }
            retornoFormatado += "\n" // Pula linha

            //* Agora só são inseridas as informações que não são padrões a todos retornos
            //* São atribuidas as informações especificas do retorno da operação
            if (retornoSat.operacao.equals("AtivarSAT")) {
                if (retornoSat.codigoCSR.equals("") === false) {
                    retornoFormatado += "CSR: " + retornoSat.codigoCSR
                }
            } else if (retornoSat.operacao.equals("ExtrairLog")) {
                //! Cuidado com está parte, ela pode  exigir muito processamento se estiver em modo Debug
                //! Recomenda-se que utilize somente em modo release e não colocar em um Dialogo, pois o arquivo retornado é grande
                // retornoFormatado += "Arquivo de log em base64: " + retornoSat.getLogBase64;
            } else if (retornoSat.operacao.equals("ConsultarStatusOperacional")) {
                retornoFormatado += """
                    ------- Conteúdo Retorno -------
                    Número de Série do SAT: ${retornoSat.numeroSerieSat}Tipo de Lan: ${retornoSat.tipoLan}
                    IP SAT: ${retornoSat.ipSat}
                    MAC SAT: ${retornoSat.macSat}
                    Máscara: ${retornoSat.mascara}
                    Gateway: ${retornoSat.gateway}
                    DNS 1: ${retornoSat.dns1}
                    DNS 2: ${retornoSat.dns2}
                    Status da Rede: ${retornoSat.statusRede}
                    Nível da Bateria: ${retornoSat.nivelBateria}
                    Memória de Trabalho Total: ${retornoSat.memoriaDeTrabalhoTotal}
                    Memória de Trabalho Usada: ${retornoSat.memoriaDeTrabalhoUsada}
                    Data/Hora: ${retornoSat.dataHora}
                    Versão: ${retornoSat.versao}
                    Versão de Leiaute: ${retornoSat.versaoLeiaute}
                    Último CFe-Sat Emitido: ${retornoSat.ultimoCfeEmitido}
                    Primeiro CFe-Sat Em Memória: ${retornoSat.primeiroCfeMemoria}
                    Último CFe-Sat Em Memória: ${retornoSat.ultimoCfeMemoria}
                    Última Transmissão de CFe-SAT para SEFAZ: ${retornoSat.ultimaTransmissaoSefazDataHora}
                    Última Comunicacao com a SEFAZ:${retornoSat.ultimaComunicacaoSefazData}
                    Estado de Operação do SAT: ${retornoSat.estadoDeOperacao}
                    """.trimIndent()
            } else if (retornoSat.operacao.equals("AssociarSAT")) {
                //* Associar SAT somente tem como dado especifico o campo CCCC(fica ao seu criterio adicionar-lo ou não)
            } else if (retornoSat.operacao.equals("EnviarTesteFim")) {
                retornoFormatado += """
                    TimeStamp: ${retornoSat.timeStamp}
                    Num Doc Fiscal: ${retornoSat.numDocFiscal}
                    Chave de Consulta: ${retornoSat.chaveConsulta}
                    Arquivo CFE Base 64: ${converterBase64EmXml(retornoSat.arquivoCFeBase64)}
                    """.trimIndent()
            } else if (retornoSat.operacao
                    .equals("EnviarTesteVendas") || retornoSat.operacao
                    .equals("CancelarUltimaVenda")
            ) {
                retornoFormatado += """
                    TimeStamp: ${retornoSat.timeStamp}
                    Chave de Consulta: ${retornoSat.chaveConsulta}
                    Valor CFE: ${retornoSat.valorTotalCFe}
                    Valor CPF CNPJ: ${retornoSat.cPFCNPJValue}
                    Arquivo CFE Base 64: ${converterBase64EmXml(retornoSat.arquivoCFeBase64)}
                    Assinatura QRCODE: ${retornoSat.assinaturaQRCODE}
                    """.trimIndent()
            }
        }
        return retornoFormatado
    }

    fun converterBase64EmXml(base64Sat: String): String {
        var retornoSemBase64 = ""
        try {
            val data = Base64.decode(base64Sat, Base64.DEFAULT)
            retornoSemBase64 = String(data, Charset.forName("UTF-8"))
        } catch (e: UnsupportedEncodingException) {
            e.printStackTrace()
        }
        return retornoSemBase64
    }

}
