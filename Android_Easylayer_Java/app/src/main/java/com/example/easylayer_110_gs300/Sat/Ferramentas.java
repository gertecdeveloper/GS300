package com.example.easylayer_110_gs300.Sat;

import android.app.AlertDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.easylayer_110_gs300.Components.ComponentsGertec;
import com.example.easylayer_110_gs300.GlobalValues;
import com.example.easylayer_110_gs300.R;
import com.example.satfuncoes.OperacaoSat;
import com.example.satfuncoes.RetornoSat;
import com.example.satfuncoes.SatFunctions;

import java.util.Random;

public class Ferramentas extends AppCompatActivity {

    private EditText txtCodAtivacao;
    private AlertDialog alerta;
    Random gerador = new Random();
    SatFunctions satFunctions;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ferramentas);

        satFunctions = new SatFunctions(this);
        Button button_bloquear = (Button) findViewById(R.id.buttonBloquear);
        Button button_desbloquear = (Button) findViewById(R.id.buttonDesbloquear);
        Button button_log = (Button) findViewById(R.id.buttonLog);
        Button button_atualizar = (Button) findViewById(R.id.buttonAtualizar);
        Button button_versao = (Button) findViewById(R.id.buttonVersao);
        txtCodAtivacao = (EditText) findViewById(R.id.txtCodAtivacao);
        txtCodAtivacao.setText(GlobalValues.codAtivacao);

        button_bloquear.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("BloquearSat");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_desbloquear.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("DesbloquearSat");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_log.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("ExtrairLog");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_atualizar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("AtualizarSoftware");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_versao.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                try {
                    repostaSat("Versao");
                } catch (Exception e) {
                    Toast.makeText(Ferramentas.this, "Erro ao verificar versão!", Toast.LENGTH_LONG).show();
                }
            }
        });
    }
        public void repostaSat(String operacao){
            String retornoOperaca = "";
            switch (operacao){
                case "BloquearSat":
                    retornoOperaca = satFunctions.bloquearSat(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                    break;
                case "DesbloquearSat":
                    retornoOperaca = satFunctions.desbloquearSat(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                    break;
                case "ExtrairLog":
                    retornoOperaca = satFunctions.extrairLog(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                    break;
                case "AtualizarSoftware":
                    retornoOperaca = satFunctions.atualizarSoftware(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                    break;
                case "Versao":
                    retornoOperaca = satFunctions.versao();
                    break;
                default:
                    retornoOperaca = "";
                    break;
            }
            GlobalValues.codAtivacao = txtCodAtivacao.getText().toString();

            RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat(operacao, retornoOperaca);

            //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
            //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
            // Recomenda-se acessar a função e entender como ela funciona
            String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
            ComponentsGertec.dialogoRetorno(retornoFormatado, this);
        }
    }
