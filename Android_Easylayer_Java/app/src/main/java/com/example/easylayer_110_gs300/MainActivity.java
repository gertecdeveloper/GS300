package com.example.easylayer_110_gs300;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.example.easylayer_110_gs300.Balanca.Balanca;
import com.example.easylayer_110_gs300.Fala.FalaActivity;
import com.example.easylayer_110_gs300.Impressora.Impressora;
import com.example.easylayer_110_gs300.MSitef.Tef;
import com.example.easylayer_110_gs300.NFC.NFC;
import com.example.easylayer_110_gs300.Projeto.Projeto;
import com.example.easylayer_110_gs300.Projeto.ProjetoAdapter;
import com.example.easylayer_110_gs300.Projeto.Sobre;
import com.example.easylayer_110_gs300.Sat.MenuSat;
import com.example.easylayer_110_gs300.SegundoDisplay.Segundo_Display;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ArrayList<Projeto> projetos = new ArrayList<Projeto>();
    ListView lvProjetos;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Informações
        @SuppressLint({"MissingInflatedId", "LocalSuppress"})
        Button informaçoes = findViewById(R.id.infor);
        informaçoes.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDialog();
            }
        });

        //Lista das funções
        lvProjetos = findViewById(R.id.lvProjetos);
        projetos.add(new Projeto("Balança", R.drawable.balanca));
        projetos.add(new Projeto("Fala", R.drawable.speaker));
        projetos.add(new Projeto("Impressão", R.drawable.impressora));
        projetos.add(new Projeto("NFC", R.drawable.nfc));
        projetos.add(new Projeto("SAT", R.drawable.sat));
        projetos.add(new Projeto("Segundo Display", R.drawable.display));
        projetos.add(new Projeto("TEF", R.drawable.tef));

        //Intent para as activitys das funções
        ProjetoAdapter adapter = new ProjetoAdapter(getBaseContext(), R.layout.listprojetos, projetos);
        lvProjetos.setAdapter(adapter);
        lvProjetos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Projeto projeto = (Projeto) lvProjetos.getItemAtPosition(i);

                Intent intent = null;
                switch (projeto.getNome()){
                    case "Balança":
                        intent = new Intent(MainActivity.this, Balanca.class);
                        break;
                    case "Fala":
                        intent = new Intent(MainActivity.this, FalaActivity.class);
                        break;
                    case "Impressão":
                        intent = new Intent(MainActivity.this, Impressora.class);
                        break;
                    case "NFC":
                        intent = new Intent(MainActivity.this, NFC.class);
                        break;
                    case "SAT":
                        intent = new Intent(MainActivity.this, MenuSat.class);
                        break;
                    case "Segundo Display":
                        intent = new Intent(MainActivity.this, Segundo_Display.class);
                        break;
                    case "TEF":
                        intent = new Intent(MainActivity.this, Tef.class);
                        break;
                }

                if(intent != null){
                    startActivity(intent);
                }
            }
        });

    }

    //Função do dialog de informações
    public void showDialog() {
        int mStackLevel = 1;
        mStackLevel++;

        FragmentTransaction ft = getSupportFragmentManager().beginTransaction();
        Fragment prev = getSupportFragmentManager().findFragmentByTag("dialog");
        if (prev != null) {
            ft.remove(prev);
        }
        ft.addToBackStack(null);

        Sobre newFragment = Sobre.newInstance(mStackLevel);
        newFragment.show(ft, "dialog");
    }
}