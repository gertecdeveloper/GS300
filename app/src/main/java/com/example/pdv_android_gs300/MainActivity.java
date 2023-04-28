package com.example.pdv_android_gs300;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.pdv_android_gs300.fala.FalaActivity;
import com.example.pdv_android_gs300.impressora.Impressora;
import com.example.pdv_android_gs300.msitef.Tef;
import com.example.pdv_android_gs300.nfc.NfcExemplo;
import com.example.pdv_android_gs300.sat.MenuSat;
import com.example.pdv_android_gs300.sublcd.SubLcd;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private Class WangPosManagerClass;
    private Object WangPosManager;
    public static String Model = Build.MODEL;
    public static String PLATAFORMA = "Android Studio";
    public static final String VERSION = "1.0.0";

    public static String getVersion(){
        return PLATAFORMA+" - "+VERSION+" - GS300";
    }

    //REFERÊNCIA DAS ACTIVITIES
    public static final String ACTIVITY_SEGUNDO_DISPLAY = "Segundo Display";
    public static final String ACTIVITY_NFC = "NFC - NDF";
    public static final String ACTIVITY_FALA = "Texto para Fala";
    public static final String  ACTIVITY_SAT = "Sat";
    public static final String  ACTIVITY_TEF = "Tef";
    public static final String  ACTIVITY_IMPRESSORA = "Impressão";
    public static final String  ACTIVITY_TEF_FEIRA = "Tef";

    ArrayList<Projeto> projetos = new ArrayList<Projeto>();
    ListView lvProjetos;

    TextView txtProject;
    private AlertDialog alerta;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        lvProjetos = findViewById(R.id.lvProjetos);
        txtProject = findViewById(R.id.txtNameProject);
        txtProject.setText(getVersion());

        projetos.add(new Projeto(ACTIVITY_IMPRESSORA, R.drawable.print));
        projetos.add(new Projeto(ACTIVITY_SEGUNDO_DISPLAY, R.drawable.customerdisplay));
        projetos.add(new Projeto(ACTIVITY_NFC, R.drawable.nfc2));
        projetos.add(new Projeto(ACTIVITY_FALA, R.drawable.speaker));
        projetos.add(new Projeto(ACTIVITY_TEF, R.drawable.tef));
        projetos.add(new Projeto(ACTIVITY_SAT, R.drawable.icon_sat));
        //projetos.add(new Projeto(ACTIVITY_TEF_FEIRA, R.drawable.icon_sat));

        ProjetoAdapter adapter = new ProjetoAdapter(getBaseContext(), R.layout.listprojetos, projetos);
        lvProjetos.setAdapter(adapter);
        lvProjetos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Projeto projeto = (Projeto) lvProjetos.getItemAtPosition(i);

                Intent intent = null;
                switch (projeto.getNome()){
                    //G-BOT Implementação Futura
                    case ACTIVITY_SEGUNDO_DISPLAY:
                        intent = new Intent(MainActivity.this, SubLcd.class);
                        break;
                    case ACTIVITY_NFC:
                        intent = new Intent(MainActivity.this, NfcExemplo.class);
                        break;

                    //A112
                    /*case ACTIVITY_IMPRESSAO:
                        intent = new Intent(MainActivity.this, Impressora.class);
                        break;*/
                    /*case ACTIVITY_DISPLAY:
                        intent = new Intent(MainActivity.this, DisplayActivity.class);
                        break;*/

                    //Activities Comuns
                    case ACTIVITY_TEF:
                        intent = new Intent(MainActivity.this, Tef.class);
                        break;

                    case ACTIVITY_SAT:
                        intent = new Intent(MainActivity.this, MenuSat.class);
                        break;

                    case ACTIVITY_FALA:
                        intent = new Intent(MainActivity.this, FalaActivity.class);
                        break;

                    case ACTIVITY_IMPRESSORA:
                        intent = new Intent(MainActivity.this, Impressora.class);
                        break;

                    /*case ACTIVITY_TEF_FEIRA:
                        intent = new Intent(MainActivity.this, SensorActivity.class);
                        break;*/

                }

                if(intent != null){
                    startActivity(intent);
                }
            }
        });
    }
}