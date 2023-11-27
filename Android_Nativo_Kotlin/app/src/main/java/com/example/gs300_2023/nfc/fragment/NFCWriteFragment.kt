package com.example.gs300_2023.nfc.fragment

import android.content.Context
import android.nfc.FormatException
import android.nfc.tech.Ndef
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ProgressBar
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.example.gs300_2023.R
import com.example.gs300_2023.nfc.NfcExemplo
import com.example.gs300_2023.nfc.NfcLeituraGravacao
import java.io.IOException



class NFCWriteFragment : Fragment() {

    private var nfcLeituraGravacao: NfcLeituraGravacao? = null

    companion object {
        fun newInstance(): NFCWriteFragment {
            return NFCWriteFragment()
        }
    }

    private lateinit var mTvMessage: TextView
    private lateinit var mProgress: ProgressBar
    private lateinit var mListener: NfcExemplo

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_gravacao, container, false)
        initViews(view)
        return view
    }

    private fun initViews(view: View) {
        mTvMessage = view.findViewById(R.id.tv_message)
        mProgress = view.findViewById(R.id.progress)
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

    fun onNfcDetected(ndef: Ndef, messageToWrite: String) {
        nfcLeituraGravacao = NfcLeituraGravacao(ndef.tag)
        mProgress.visibility = View.VISIBLE
        writeToNfc(ndef, messageToWrite)
    }

    private fun writeToNfc(ndef: Ndef, message: String) {
        var tempoExecucao: Long

        mTvMessage.text = getString(R.string.message_write_progress)

        if (ndef != null) {
            try {
                nfcLeituraGravacao!!.gravaMensagemCartao(ndef, message)
                tempoExecucao = nfcLeituraGravacao!!.retornaTempoDeExeculcaoSegundos()!!

                mTvMessage.text = getString(R.string.message_write_success) +
                        "\n\nTempo de execução: ${String.format("%02d segundos", tempoExecucao)}"

            } catch (e: IOException) {
                Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
                e.printStackTrace()
                mTvMessage.text = getString(R.string.message_write_error)

            } catch (e: FormatException) {
                Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
                e.printStackTrace()
            } finally {
                mProgress.visibility = View.GONE
            }
        } else {
            Toast.makeText(activity, "Não foi possível ler este cartão", Toast.LENGTH_LONG).show()
        }
    }
}