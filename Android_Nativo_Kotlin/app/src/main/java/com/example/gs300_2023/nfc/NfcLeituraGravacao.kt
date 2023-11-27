package com.example.gs300_2023.nfc

import android.annotation.SuppressLint
import android.nfc.FormatException
import android.nfc.NdefMessage
import android.nfc.NdefRecord
import android.nfc.Tag
import android.nfc.tech.IsoDep
import android.nfc.tech.MifareClassic
import android.nfc.tech.Ndef
import android.nfc.tech.NdefFormatable
import java.io.IOException
import java.nio.charset.Charset
import java.util.UUID

open class NfcLeituraGravacao(tag: Tag) {

    private val mifareClassic: MifareClassic = MifareClassic.get(tag)
    private val isoDep: IsoDep? = IsoDep.get(tag)

    private val MENSAGEM_PADRAO = "GERTEC"
    private val TAG = NfcLeituraGravacao::class.java.simpleName

    private var tempInicial: Long = 0
    private var tempFinal: Long = 0
    private var direfenca: Long = 0

    init {
        this.gravaTempoInicia()
    }


    fun lerTodosOsSetoresDoCartao(): List<Any> {
        var byteRead: ByteArray
        var auth: Boolean
        val quantSetores: Int
        var blocoCount: Int
        var blocoIndex: Int
        val ByteRetorno: MutableList<Any> = mutableListOf()

        try {
            this.validConexaoCartao()

            quantSetores = mifareClassic.getSectorCount()

            for (i in 0 until quantSetores) {

                auth = this.validPermissaoBlocoA(i)

                if (!auth) {
                    auth = this.validPermissaoBlocoB(i)
                }

                if (auth) {

                    blocoCount = mifareClassic.getBlockCountInSector(i)

                    for (j in 0 until blocoCount) {
                        auth = this.validPermissaoBlocoA(j)

                        if (!auth) {
                            auth = this.validPermissaoBlocoB(j)
                        }

                        if (auth) {
                            blocoIndex = mifareClassic.sectorToBlock(j)
                            byteRead = mifareClassic.readBlock(blocoIndex)
                            ByteRetorno.add(byteRead)
                        }
                    }
                }
            }

        } catch (e: IOException) {
            throw e
        } finally {
            this.desconectaCartao()
            this.gravaTempoFinal()
        }

        return ByteRetorno
    }
    /**
     *
     * Método que faz a leitura de um bloco e setor específico
     * no cartão que esta sendo lido.
     *
     * A leitura sempre será retornada em Bytes.
     *
     * @param bloco = número que bloco que deve ser lido
     * @param setor = número do setor existente dentro do bloco que será lido
     *
     * @throws IOException
     *
     * @return byte[] = a
     *
     * */
    fun lerUmSetoresDoCartao(bloco: Int, setor: Int): ByteArray {
        var byteRead: ByteArray? = null
        var auth: Boolean
        val blocoIndex: Int

        try {
            this.validConexaoCartao()

            auth = this.validPermissaoBlocoA(bloco)

            if (!auth) {
                auth = this.validPermissaoBlocoB(bloco)

                if (!auth) {
                    throw Exception("Falha na validação de senha.")
                }
            }

            if (auth) {
                blocoIndex = mifareClassic.sectorToBlock(setor)
                byteRead = mifareClassic.readBlock(blocoIndex)
            }

        } catch (e: IOException) {
            throw e
        } finally {
            this.desconectaCartao()
            this.gravaTempoFinal()
        }

        return byteRead!!
    }

    /**
     *
     * Método faz a gravação de uma mensagem em um bloco específico
     * no cartão.
     *
     * A mensagem que será gravada não deve ser superior a 16 bits.
     *
     * A leitura sempre será retornada em Bytes.
     *
     * @param bloco = número que bloco que deve ser lido
     * @param mensagem = número do setor existente dentro do bloco que será lido
     *
     * @throws IOException
     *
     * @return true = caso haja um erro na gravação, será tratada no throw
     *
     * */
    @Throws(java.lang.Exception::class)
    open fun gravaSetorCartao(bloco: Int, mensagem: ByteArray): Boolean {
        try {
            // Valida a conexão com o cartão
            validConexaoCartao()

            // Valida a quantidade de bytes que serão gravados
            require(mensagem.size == 16) { "A mensagem não contem 16 bits" }
            // Grava no cartão
            mifareClassic!!.writeBlock(bloco, mensagem)
        } catch (e: IOException) {
            throw java.lang.Exception(e)
        } finally {
            desconectaCartao()
            this.gravaTempoFinal()
        }
        return true
    }

    /**
     *
     * Método que faz o incremento de um valor em um bloco específico
     * no cartão.
     *
     * O valor a ser incrementado será sempre o INTEIRO
     *
     *
     * @param bloco = Número que bloco que deve ser incrementado
     * @param valor = Valor que será incrementado ao já existente no bloco
     *
     * @throws IOException
     *
     * @return true = caso haja um erro na gravação será tratado no throw
     *
     */
    @Throws(java.lang.Exception::class)
    fun incrementaValorCartao(bloco: Int, valor: Int): Boolean {
        try {
            // Valida a conexão com o cartão
            validConexaoCartao()
            // Valida o valor a ser gravado
            validaValor(valor)
            // Incrementa o valor no cartão
            mifareClassic!!.increment(bloco, valor)
        } catch (e: IOException) {
            throw java.lang.Exception(e)
        } finally {
            desconectaCartao()
            this.gravaTempoFinal()
        }
        return true
    }

    /**
     *
     * Método que faz o decremento de um valor em um bloco específico
     * no cartão.
     *
     * O valor a ser decrementado será sempre o INTEIRO
     *
     *
     * @param bloco = Número que bloco que deve ser incrementado
     * @param valor = Valor que será incrementado ao já existente no bloco
     *
     * @throws IOException
     *
     * @return true = caso haja um erro na gravação será tratado no throw
     *
     */
    @Throws(java.lang.Exception::class)
    fun decrementaValorCartao(bloco: Int, valor: Int): Boolean {
        try {
            // Valida conexão
            validConexaoCartao()
            // Valida o valor
            validaValor(valor)
            // Decrementa o valor do cartão
            mifareClassic!!.decrement(bloco, valor)
        } catch (e: IOException) {
            throw java.lang.Exception(e)
        } finally {
            desconectaCartao()
            this.gravaTempoFinal()
        }
        return true
    }

    /**
     *
     * Método faz a gravação de uma nova mensagem no cartão.
     *
     * Essa nova mensagem será códificada usando o padrão UTF-8.
     *
     * @param ndef = Contém as informações do cartão que esta sendo lido.
     * @param mensagem = Mensagem que será gravada no cartão
     *
     * @throws IOException
     * @throws FormatException
     *
     * @return boolean =>  True = Mensagem Gravada / False = Erro ao gravar mensagem
     *
     * */
    @SuppressLint("NewApi")
    fun gravaMensagemCartao(ndef: Ndef?, mensagem: String): Boolean {
        var retorno = false

        try {
            if (ndef != null) {
                ndef.connect()

                val mimeRecord = NdefRecord.createMime("UTF-8", mensagem.toByteArray(Charset.forName("UTF-8")))
                ndef.writeNdefMessage(NdefMessage(mimeRecord))

                ndef.close()

                retorno = true
            } else {
                retorno = formataCartao(ndef!!)
            }
        } catch (e: FormatException) {
            throw FormatException(e.message)
        } catch (e: IOException) {
            throw IOException(e)
        } finally {
            gravaTempoFinal()
        }

        return retorno
    }

    /**
     *
     * Método faz a gravação de uma nova mensagem no cartão.
     *
     * Essa nova mensagem será códificada usando o padrão UTF-8.
     *
     * @param ndef = Contém as informações do cartão que esta sendo lido.
     *
     * @throws IOException
     * @throws FormatException
     *
     * @return String = contém a mensagem que esta gravada no cartão
     *
     */
    @SuppressLint("NewApi")
    fun retornaMensagemGravadaCartao(ndef: Ndef?): String {
        var message = ""

        try {
            if (ndef == null) {
                throw Exception("Não foi possível ler o cartão.")
            }

            if (!ndef.isConnected) {
                ndef.connect()
            }

            val ndefMessage = ndef.ndefMessage
            if (ndefMessage == null) {
                throw Exception("Não foi possível ler o cartão.")
            } else {
                message = String(ndefMessage.records[0].payload)
            }
        } catch (e: IOException) {
            throw Exception(e.message)
        } catch (e: FormatException) {
            throw Exception(e.message)
        } catch (e: Exception) {
            throw Exception(e.message)
        } finally {
            gravaTempoFinal()
        }

        return message
    }


    /**
     *
     * Método faz a formatação do cartão.
     *
     * A formatação do cartão só é necessario na sua primeira gravação.
     *
     * Após já existir algum valor gravado no cartão, não será possível formata-lo
     * novamente.
     *
     * @param ndef = Contém as informações do cartão que esta sendo lido.
     *
     * @throws IOException
     * @throws FormatException
     *
     * @return boolean =>  True = Cartão Formatado / False = Cartão não formatado
     *
     */
    @SuppressLint("NewApi")
    fun formataCartao(ndef: Ndef): Boolean {
        var retorno = false

        val ndefFormatable = NdefFormatable.get(ndef.tag)

        try {
            if (ndefFormatable == null) {
                return retorno
            }

            if (!ndefFormatable.isConnected) {
                ndefFormatable.connect()
            }

            ndefFormatable.format(
                NdefMessage(
                    NdefRecord.createMime("UTF-8", MENSAGEM_PADRAO.toByteArray(Charset.forName("UTF-8")))
                )
            )

            ndefFormatable.close()
            retorno = true
        } catch (e: IOException) {
            throw IOException(e.message)
        } catch (e: FormatException) {
            throw FormatException(e.message)
        } finally {
            gravaTempoFinal()
        }

        return retorno
    }

    /**
     *
     * Método que válida o valor a ser incrementado ou decrementado do cartão.
     *
     * @param valor = Valor a ser incrementado ou decrementado do cartão
     *
     * @throws IllegalArgumentException
     *
     */
    private fun validaValor(valor: Int) {
        if (valor < 0) {
            throw IllegalArgumentException("O valor não pode ser negativo.")
        }
    }


    /**
     *
     * Método que válida se existe ou não conexão com o atual cartão.
     *
     * Caso não haja conexão aberta com o cartão, esse método irá abrir
     * uma nova conexão.
     *
     */
    private fun validConexaoCartao() {
        if (!mifareClassic.isConnected) {
            conectarCartao()
        }
    }

    /**
     *
     * Método que faz a conexão com o cartão.
     *
     * @throws IOException
     *
     */
    private fun conectarCartao() {
        try {
            mifareClassic.connect()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    /**
     *
     * Método que desconecta o cartão.
     *
     * @throws IOException
     *
     */
    private fun desconectaCartao() {
        try {
            mifareClassic.close()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }


    /**
     *
     * Método que faz a validação de senha
     * para leitura e escrita de um bloco no SETOR A
     *
     * @param bloco  = Número do bloco que será validado a permissão
     *
     * @throws IOException
     *
     * @return boolean = Caso falso é porque não existe a permissão para leitura do bloco
     *
     */
    private fun validPermissaoBlocoA(bloco: Int): Boolean {
        var retorno = false

        try {
            if (mifareClassic.authenticateSectorWithKeyA(bloco, MifareClassic.KEY_MIFARE_APPLICATION_DIRECTORY)) {
                retorno = true
            } else if (mifareClassic.authenticateSectorWithKeyA(bloco, MifareClassic.KEY_DEFAULT)) {
                retorno = true
            } else if (mifareClassic.authenticateSectorWithKeyA(bloco, MifareClassic.KEY_NFC_FORUM)) {
                retorno = true
            }
        } catch (e: IOException) {
            throw Exception(e.message)
        }

        return retorno
    }

    /**
     *
     * Método que faz a validação de senha
     * para leitura e escrita de um bloco no SETOR B
     *
     * @param bloco  = Número do bloco que será validado a permissão
     *
     * @throws IOException
     *
     * @return boolean = Caso falso é porque não existe a permissão para leitura do bloco
     *
     */
    private fun validPermissaoBlocoB(bloco: Int): Boolean {
        var retorno = false

        try {
            if (mifareClassic.authenticateSectorWithKeyB(bloco, MifareClassic.KEY_MIFARE_APPLICATION_DIRECTORY)) {
                retorno = true
            } else if (mifareClassic.authenticateSectorWithKeyB(bloco, MifareClassic.KEY_DEFAULT)) {
                retorno = true
            } else if (mifareClassic.authenticateSectorWithKeyB(bloco, MifareClassic.KEY_NFC_FORUM)) {
                retorno = true
            }
        } catch (e: IOException) {
            throw Exception(e.message)
        }

        return retorno
    }

    /**
     *
     * Método que grava os milesegundos na inicialização desta class
     *
     */
    private fun gravaTempoInicia() {
        this.tempInicial = System.currentTimeMillis()
    }

    /**
     *
     * Método que grava os milesegundos da finalização de um método.
     *
     * Esse método sempre será chamado na finally dos try/catch
     *
     *
     */
    private fun gravaTempoFinal() {
        this.tempFinal = System.currentTimeMillis()
    }


    /**
     *
     * Método que retorna a quantidade de segundos que foram
     * necessário para faz uma execução.
     *
     * @return Long = Segundos que foram usado para concluir um processo.
     *
     *
     */
    public fun retornaTempoDeExeculcaoSegundos(): Long {
        this.direfenca = (this.tempFinal - this.tempInicial)
        return direfenca / 60
    }

    /**
     *  Method that returns the card ID already converted to hexadecimal
     *
     * @return String = Card ID
     *
     * */
    open fun idCartaoHexadecimal(): String? {
        var idCartao: ByteArray? = null
        var result: Long = 0
        idCartao = mifareClassic.tag.id
        if (idCartao == null) return ""
        for (i in idCartao.indices.reversed()) {
            result = result shl 8
            result = result or (idCartao[i].toInt() and 0x0FF).toLong()
        }
        return result.toString()
    }

    /**
     *
     * Method that returns the card ID in bytes
     *
     * @return byte[] = Card ID
     *
     * */
    fun cartaoId(): ByteArray {
        return mifareClassic.tag.id
    }

    /**
     *
     * Method that generates a random string to be used in tests.
     *
     * @return String = Randomly generated text
     *
     * */
    public fun geraString(): String {
        val uuid = UUID.randomUUID()
        val myRandom = uuid.toString()

        return myRandom.substring(0, 30)
    }

}
