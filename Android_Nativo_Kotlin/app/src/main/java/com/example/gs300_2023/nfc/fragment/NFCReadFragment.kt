package com.example.gs300_2023.nfc.fragment

import android.content.Context
import android.nfc.FormatException
import android.nfc.Tag
import android.nfc.tech.Ndef
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.example.gs300_2023.R
import com.example.gs300_2023.nfc.NfcExemplo
import com.example.gs300_2023.nfc.NfcLeituraGravacao
import java.io.IOException



class NFCReadFragment : Fragment() {

    private var nfcLeituraGravacao: NfcLeituraGravacao? = null

    companion object {
        fun newInstance(): NFCReadFragment {
            return NFCReadFragment()
        }
    }

    private lateinit var mTvMessage: TextView
    private lateinit var mListener: NfcExemplo

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_leitura, container, false)
        initViews(view)
        return view
    }

    private fun initViews(view: View) {
        mTvMessage = view.findViewById(R.id.tv_message)
    }

    override fun onAttach(context: Context) {
        super.onAttach(context)
        mListener = context as NfcExemplo
        mListener.onDialogDisplayed()
    }

    override fun onDetach() {
        super.onDetach()
        mListener.onDialogDismissed()
    }

    fun onNfcDetected(tag: Tag) {
        nfcLeituraGravacao = NfcLeituraGravacao(tag)
        readFromNFC(null, tag)
    }

    fun onNfcDetected(ndef: Ndef) {
        nfcLeituraGravacao = NfcLeituraGravacao(ndef.tag)
        readFromNFC(ndef, null)
    }

    private fun readFromNFC(ndef: Ndef?, tag: Tag?) {
        var mensagem = ""
        var idCarao: String?
        var tempoExecucao: Long

        try {
            // Recebe a leitura das atuais mensagens cadastradas no cartão
            if (ndef != null) {
                mensagem = nfcLeituraGravacao!!.retornaMensagemGravadaCartao(ndef)
            }
            idCarao = nfcLeituraGravacao!!.idCartaoHexadecimal()

            // Recebe o tempo total de execução da operação de leitura
            tempoExecucao = nfcLeituraGravacao!!.retornaTempoDeExeculcaoSegundos()!!

            if (ndef == null) {
                mTvMessage.text = "ID Cartão: $idCarao"
            } else if (mensagem.isEmpty()) {
                mTvMessage.text = "Não existe mensagem gravada no cartão."
            } else {
                mTvMessage.text = "ID Cartão: $idCarao\n$mensagem\n\nTempo de execução: ${tempoExecucao} segundos"
            }

        } catch (e: IOException) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
        } catch (e: FormatException) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
        } catch (e: Exception) {
            e.printStackTrace()
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
        }
    }
}