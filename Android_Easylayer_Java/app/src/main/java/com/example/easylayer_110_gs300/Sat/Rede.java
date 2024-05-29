package com.example.easylayer_110_gs300.Sat;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import com.example.easylayer_110_gs300.R;
import com.example.satfuncoes.SatFunctions;

import java.util.Random;

public class Rede extends AppCompatActivity {
    private Button button_configurar;
    private EditText txtCodAtivacao, txtIp, txtMascara, txtGateway, txtDns, txtDns2, txtProxyIp, txtPorta, txtUser, txtPassword;
    private Spinner spinnerTipoRede, spinnerOptDns, spinnerOptProxy;
    private AlertDialog alerta;
    private static final String[] tipoRede = new String[]{"Estático", "DHCP"};
    private static final String[] optDns = new String[]{"Não", "Sim"};
    private static final String[] optProxy = new String[]{"Não usa proxy", "Proxy com configuração", "Proxy transparente"};
    private String appPackage = "com.gertec.exemplosgertec8";
    private String caminhoXML = "data/data/" + appPackage + "/configRede.xml";
    Random gerador = new Random();
    Context context;
    SatFunctions satFunctions;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rede);

    }
}