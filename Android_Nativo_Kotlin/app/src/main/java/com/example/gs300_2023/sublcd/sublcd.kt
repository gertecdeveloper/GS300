package com.example.gs300_2023.sublcd

import android.Manifest
import android.content.pm.PackageManager
import android.graphics.BitmapFactory
import android.os.AsyncTask
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Message
import android.speech.tts.Voice
import android.text.Layout
import android.text.TextUtils
import android.util.Log
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.ListView
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import br.com.estudos.texttospeaks.TextToFala
import com.android.sublcdlibrary.SubLcdConstant.CMD_PROTOCOL_BMP_DISPLAY
import com.android.sublcdlibrary.SubLcdConstant.CMD_PROTOCOL_START_SCAN
import com.android.sublcdlibrary.SubLcdConstant.CMD_PROTOCOL_UPDATE
import com.android.sublcdlibrary.SubLcdException
import com.android.sublcdlibrary.SubLcdHelper
import com.example.gs300_2023.R
import java.util.Collections
import java.util.Locale

class SubLcd : AppCompatActivity(), SubLcdHelper.VuleCalBack {

    private lateinit var localeSet: Set<Locale>
    private lateinit var voice: Set<Voice>
    private lateinit var btnStart: Button
    private lateinit var btnStop: Button
    private lateinit var btnLigarLed: Button
    private lateinit var txtResultado: TextView
    private lateinit var listCursos: ListView
    private lateinit var consulta: MutableList<String>
    private lateinit var adapter: ArrayAdapter<String>
    private val PERMISSIONS_REQUEST = 1
    private val PERMISSION_WRITE_STORAGE = android.Manifest.permission.WRITE_EXTERNAL_STORAGE
    private val PERMISSION_READ_STORAGE = Manifest.permission.READ_EXTERNAL_STORAGE
    private val Permission = arrayOf(PERMISSION_WRITE_STORAGE, PERMISSION_READ_STORAGE)
    private var cmdflag: Int = 0
    private var isShowResult = false
    private var toast: Toast? = null
    private val TAG = "PrintService"
    private var flagtxt: String? = null
    private val handler = Handler()
    private val handler1 = Handler()
    private val handler2 = Handler()
    private val handler3 = Handler()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sublcd)

        listCursos = findViewById(R.id.lvConsulta)
        consulta = ArrayList()
        adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, consulta)
        listCursos.adapter = adapter

        btnStart = findViewById(R.id.btnStar)
        btnStop = findViewById(R.id.btnStop)
        btnLigarLed = findViewById(R.id.btnLigarLed)
        txtResultado = findViewById(R.id.txtResultado)
        TextToFala.getInstance(this.applicationContext).init(this.applicationContext)

        SubLcdHelper.getInstance().init(applicationContext)
        SubLcdHelper.getInstance().SetCalBack { s, cmd -> datatrigger(s, cmd) }

        btnStart.setOnClickListener {
           SubImages()
        }

        btnStop.setOnClickListener {
            val text = "GS300 Terminal PDV"
            try {
                //TextToFala.getInstance(applicationContext).speechText(text)
            } catch (e: Exception) {
                txtResultado.text = e.toString()
            }
            try {
                SubLcdHelper.getInstance().sendText(text, Layout.Alignment.ALIGN_CENTER,10)
                cmdflag = CMD_PROTOCOL_BMP_DISPLAY.toInt()
                mHandler.sendEmptyMessageDelayed(MSG_REFRESH_NO_SHOWRESULT, 300)
            } catch (e: SubLcdException) {
                e.printStackTrace()
            }
        }

        btnLigarLed.setOnClickListener {
            AsyncTask.execute {
                try {
                    SubLcdHelper.getInstance().sendScan()
                    cmdflag = CMD_PROTOCOL_START_SCAN.toInt()
                    mHandler.sendEmptyMessageDelayed(MSG_REFRESH_SHOWRESULT, 300)
                } catch (e: SubLcdException) {
                    SubLcdHelper.getInstance().release()
                    e.printStackTrace()
                }
            }
        }
    }

    override fun datatrigger(s: String, cmd: Int) {
        runOnUiThread {
            if (!TextUtils.isEmpty(s)) {
                if (cmd == cmdflag) {
                    if (cmd.toByte() == CMD_PROTOCOL_UPDATE && s == " data is incorrect") {
                        closeLoading()
                        mHandler.removeMessages(MSG_REFRESH_SHOWRESULT)
                        mHandler.removeMessages(MSG_REFRESH_NO_SHOWRESULT)
                        Log.i(TAG, "datatrigger result=$s")
                        Log.i(TAG, "datatrigger cmd=$cmd")
                        if (isShowResult) {
                            //showtoast(getString(R.string.updatesuccessed))
                        }
                    } else if (cmd.toByte() == CMD_PROTOCOL_UPDATE && (s == "updatalogo" || s == "updatafilenameok" || s == "updatauImage" || s == "updataok")) {
                        Log.i(TAG, "neglect")
                    } else if (cmd.toByte() == CMD_PROTOCOL_UPDATE && (s == "Same_version")) {
                        closeLoading()
                        mHandler.removeMessages(MSG_REFRESH_SHOWRESULT)
                        mHandler.removeMessages(MSG_REFRESH_NO_SHOWRESULT)
                        Log.i(TAG, "datatrigger result=$s")
                        Log.i(TAG, "datatrigger cmd=$cmd")
                        if (isShowResult) {
                            //showtoast(getString(R.string.same_version))
                        }
                    } else {
                        mHandler.removeMessages(MSG_REFRESH_SHOWRESULT)
                        mHandler.removeMessages(MSG_REFRESH_NO_SHOWRESULT)
                        Log.i(TAG, "datatrigger result=$s")
                        Log.i(TAG, "datatrigger cmd=$cmd")
                        if (isShowResult) {
                            showtoast(s)
                        }
                    }
                }
            }
        }
    }
    private fun hasPermission(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            return checkSelfPermission(PERMISSION_READ_STORAGE) == PackageManager.PERMISSION_GRANTED &&
                    checkSelfPermission(PERMISSION_WRITE_STORAGE) == PackageManager.PERMISSION_GRANTED
        } else {
            return true
        }
    }

    private fun requestPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            requestPermissions(Permission, PERMISSIONS_REQUEST)
        }
    }
    private val MSG_REFRESH_SHOWRESULT = 0x11
    private val MSG_REFRESH_NO_SHOWRESULT = 0x12
    private val MSG_REFRESH_UPGRADING_SYSTEM = 0x13
    private val mHandler: Handler = object : Handler(Looper.getMainLooper()) {
        override fun handleMessage(msg: Message) {
            when (msg.what) {
                MSG_REFRESH_SHOWRESULT -> {
                    isShowResult = true
                    SubLcdHelper.getInstance().readData()
                    removeMessages(MSG_REFRESH_SHOWRESULT)
                    sendEmptyMessageDelayed(MSG_REFRESH_SHOWRESULT, 100)
                }
                MSG_REFRESH_NO_SHOWRESULT -> {
                    isShowResult = false
                    SubLcdHelper.getInstance().readData()
                    removeMessages(MSG_REFRESH_NO_SHOWRESULT)
                    sendEmptyMessageDelayed(MSG_REFRESH_NO_SHOWRESULT, 100)
                }
                MSG_REFRESH_UPGRADING_SYSTEM -> {
                    showLoading()
                    sendEmptyMessage(MSG_REFRESH_SHOWRESULT)
                }
            }
        }
    }

    private fun closeLoading() {
        runOnUiThread { /* LoadingDialogUtil.getInstance().closeLoadingDialog() */ }
    }

    private fun showLoading() {
        runOnUiThread { /* LoadingDialogUtil.getInstance().showLoadingDialog(MainActivity.this, "The secondary screen is being upgraded, please do not operate...") */ }
    }
    private fun showtoast(s: String) {
        runOnUiThread {
            toast?.cancel()
            toast = Toast.makeText(this, s, Toast.LENGTH_SHORT)
            if (toast != null) {
                toast!!.cancel()
                toast = Toast.makeText(this, s, Toast.LENGTH_SHORT)
                if (s == "scandatatimeout") {
                    txtResultado.text = "Falha na leitura"
                    TextToFala.getInstance(applicationContext).speechText("Falha na leitura")
                    toast = Toast.makeText(this, "Falha na leitura", Toast.LENGTH_SHORT)
                } else {
                    consulta.add(s)
                    Collections.reverse(consulta)
                    adapter.notifyDataSetChanged()
                    TextToFala.getInstance(applicationContext).speechText("Sucesso na leitura")
                }

                try {
                    val bp = BitmapFactory.decodeResource(resources, R.drawable.gertec4)
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bp, 90f))
                } catch (e: SubLcdException) {
                    e.printStackTrace()
                }
                toast!!.show()
            } else {
                toast = Toast.makeText(this, s, Toast.LENGTH_SHORT)
                if (s == "scandatatimeout") {
                    txtResultado.text = "Falha na leitura"
                    TextToFala.getInstance(applicationContext).speechText("Falha na leitura")
                    toast = Toast.makeText(this, "Falha na leitura", Toast.LENGTH_SHORT)
                } else {
                    consulta.add(s)
                    Collections.reverse(consulta)
                    adapter.notifyDataSetChanged()
                    TextToFala.getInstance(applicationContext).speechText("Sucesso na leitura")
                }
                try {
                    val bp = BitmapFactory.decodeResource(resources, R.drawable.gertec4)
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bp, 90f))
                } catch (e: SubLcdException) {
                    e.printStackTrace()
                }
                toast!!.show()
                flagtxt = "1"
            }
        }

    }
    fun SubImages() {
        val bp = BitmapFactory.decodeResource(resources, R.drawable.gertec4)
        val bpp = BitmapFactory.decodeResource(resources, R.drawable.valor4)
        val bpb = BitmapFactory.decodeResource(resources, R.drawable.pix8)
        val bpbp = BitmapFactory.decodeResource(resources, R.drawable.gertec3)
        handler.postDelayed({
            try {
                SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bpb, 90f))
            } catch (e: SubLcdException) {
                e.printStackTrace()
            }
        }, 2000)
        handler1.postDelayed({
            try {
                SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bpp,
                    90f
                ))
            } catch (e: SubLcdException) {
                e.printStackTrace()
            }
        }, 4000)
        handler2.postDelayed({
            try {
                SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bpbp, 90f))
            } catch (e: SubLcdException) {
                e.printStackTrace()
            }
        }, 6000)
        handler3.postDelayed({
            try {
                SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bp, 90f))
            } catch (e: SubLcdException) {
                e.printStackTrace()
            }
        }, 9000)
    }

}