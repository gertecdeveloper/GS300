package com.example.gs300_2023.nfc
//thiago
import android.app.PendingIntent
import android.content.Intent
import android.content.IntentFilter
import android.nfc.NfcAdapter
import android.nfc.Tag
import android.nfc.tech.Ndef
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.gs300_2023.R
import com.example.gs300_2023.nfc.fragment.NFCFormatFragment
import com.example.gs300_2023.nfc.fragment.NFCReadFragment
import com.example.gs300_2023.nfc.fragment.NFCWriteFragment
import com.example.gs300_2023.nfc.fragment.NFCWriteReadFragment

class NfcExemplo : AppCompatActivity() {

    private lateinit var editMesagemPadrao: EditText
    private lateinit var btnLer: Button
    private lateinit var btnGravar: Button
    private lateinit var btnForceteste: Button
    private lateinit var btnFormatarCartao: Button

    private var isDialogDisplayed = false
    private var isWrite = false
    private var isRead = false
    private var isFormat = false
    private var isForceTeste = false

    private lateinit var mNfcWriteFragment: NFCWriteFragment
    private lateinit var mNfcReadFragment: NFCReadFragment
    private lateinit var nfcWriteReadFragment: NFCWriteReadFragment
    private lateinit var nfcFormatFragment: NFCFormatFragment

    private lateinit var mNfcAdapter: NfcAdapter

    private val MENSAGEM_PADRAO = "GERTEC"
    private var processo = 1000
    private var getID: ByteArray? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.nfcexemplo)

        editMesagemPadrao = findViewById(R.id.editMensagemPadrao)
        btnLer = findViewById(R.id.btn_leitura)
        btnGravar = findViewById(R.id.btn_gravar)
        btnForceteste = findViewById(R.id.btn_teste)
        btnFormatarCartao = findViewById(R.id.btn_formatarCartao)
        editMesagemPadrao.isEnabled = false

        initViews()
        initNFC()
    }

    private fun initViews() {
        btnGravar.setOnClickListener { showWriteFragment() }

        btnForceteste.setOnClickListener { showReadWriteFragment() }

        btnFormatarCartao.setOnClickListener { showFormatFragment() }

        btnLer.setOnClickListener { showReadFragment() }
    }
    private fun initNFC() {
        mNfcAdapter = NfcAdapter.getDefaultAdapter(this)
    }

    private fun showWriteFragment() {
        isWrite = true
        isRead = false
        isForceTeste = false
        isFormat = false
        editMesagemPadrao.isEnabled = true
        mNfcWriteFragment = NFCWriteFragment.newInstance()
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.viewer, mNfcWriteFragment)
        transaction.addToBackStack(null)
        transaction.commit()
    }

    private fun showReadFragment() {
        isRead = true
        isWrite = false
        isForceTeste = false
        isFormat = false
        mNfcReadFragment = NFCReadFragment.newInstance()
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.viewer, mNfcReadFragment)
        transaction.addToBackStack(null)
        transaction.commit()
    }
    private fun showFormatFragment() {
        isFormat = true
        nfcFormatFragment = NFCFormatFragment.newInstance()
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.viewer, nfcFormatFragment)
        transaction.addToBackStack(null)
        transaction.commit()
    }

    private fun showReadWriteFragment() {
        isForceTeste = true
        isRead = false
        isWrite = false
        isFormat = false
        processo = 1000

        nfcWriteReadFragment = NFCWriteReadFragment.newInstance()
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.viewer, nfcWriteReadFragment)
        transaction.addToBackStack(null)
        transaction.commit()
    }
    fun onDialogDisplayed() {
        isDialogDisplayed = true
    }

    fun onDialogDismissed() {
        isDialogDisplayed = false
    }

    override fun onResume() {
        super.onResume()
        val tagDetected = IntentFilter(NfcAdapter.ACTION_TAG_DISCOVERED)
        val ndefDetected = IntentFilter(NfcAdapter.ACTION_NDEF_DISCOVERED)
        val techDetected = IntentFilter(NfcAdapter.ACTION_TECH_DISCOVERED)
        val idDetected = IntentFilter(NfcAdapter.EXTRA_ID)
        val nfcIntentFilter = arrayOf(techDetected, tagDetected, ndefDetected, idDetected)
        val pendingIntent = PendingIntent.getActivity(
            this, 0, Intent(this, javaClass).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP), 0
        )
        if (mNfcAdapter != null) mNfcAdapter.enableForegroundDispatch(
            this,
            pendingIntent,
            nfcIntentFilter,
            null
        )
    }
    override fun onPause() {
        super.onPause()
        if (mNfcAdapter != null) mNfcAdapter.disableForegroundDispatch(this)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        val tag = intent.getParcelableExtra<Tag>(NfcAdapter.EXTRA_TAG)

        Log.d("TAG", "onNewIntent: ${intent.action}")

        if (tag != null) {
            val ndef = Ndef.get(tag)

            if (isDialogDisplayed) {
                if (isWrite) {
                    val messageToWrite = editMesagemPadrao.text.toString()
                    if (messageToWrite.isEmpty()) {
                        Toast.makeText(applicationContext, "Preencha uma mensagem", Toast.LENGTH_SHORT).show()
                    } else {
                        if (ndef == null) {
                            Toast.makeText(applicationContext, "Tipo de cartão não suportado.", Toast.LENGTH_SHORT).show()
                            return
                        }

                        mNfcWriteFragment.onNfcDetected(ndef, messageToWrite)
                    }
                } else if (isRead) {
                    if (ndef == null) {
                        mNfcReadFragment.onNfcDetected(tag)
                    } else if (tag == null) {
                        mNfcReadFragment.onNfcDetected(ndef)
                    } else {
                        Toast.makeText(applicationContext, "Tipo de cartão não suportado.", Toast.LENGTH_SHORT).show()
                        return
                    }
                } else if (isForceTeste) {
                    if (ndef == null) {
                        Toast.makeText(applicationContext, "Tipo de cartão não suportado.", Toast.LENGTH_SHORT).show()
                        return
                    }

                    nfcWriteReadFragment.onNfcDetected(ndef, MENSAGEM_PADRAO + processo.toString())
                    processo--
                } else if (isFormat) {
                    if (ndef == null) {
                        Toast.makeText(applicationContext, "Tipo de cartão não suportado.", Toast.LENGTH_SHORT).show()
                        return
                    }
                    nfcFormatFragment.onNfcDetected(ndef)
                }
            }
        }
    }

}