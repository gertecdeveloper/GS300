package com.example.easylayer_110_gs300.Sat;

import android.content.Context;
import android.os.Bundle;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.easylayer_110_gs300.Components.ComponentsGertec;
import com.example.easylayer_110_gs300.GlobalValues;
import com.example.easylayer_110_gs300.Mask;
import com.example.easylayer_110_gs300.R;
import com.example.easylayer_110_gs300.Util.CommonCode;
import com.example.satfuncoes.OperacaoSat;
import com.example.satfuncoes.RetornoSat;
import com.example.satfuncoes.SatFunctions;

import java.util.Random;

public class Ativacao extends AppCompatActivity {
    private TextWatcher cnpjMask;
    private Button button_ativar, button_voltar;
    private EditText txtCodAtivacao, txtConfCodAtivacao;
    Random gerador = new Random();
    SatFunctions satFunctions;
    CommonCode commonCode = new CommonCode();
    public Context context;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ativacao);

        satFunctions = new SatFunctions(this);
        context = this;
        button_ativar = (Button) findViewById(R.id.buttonAtivar);
        txtCodAtivacao = (EditText) findViewById(R.id.txtCodAtivacao);
        txtConfCodAtivacao = (EditText) findViewById(R.id.txtConfCodAtivacao);
        final EditText editCnpj = (EditText) findViewById(R.id.txtCNPJ);
        cnpjMask = Mask.insert("##.###.###/####-##", editCnpj);
        editCnpj.addTextChangedListener(cnpjMask);
        txtCodAtivacao.setText(GlobalValues.codAtivacao);

        button_ativar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    if (txtCodAtivacao.getText().toString().equals(txtConfCodAtivacao.getText().toString())) {
                        GlobalValues.codAtivacao = txtCodAtivacao.getText().toString();
                        String resp = satFunctions.ativarSat(txtCodAtivacao.getText().toString(),commonCode.removeMaskCnpj(editCnpj.getText().toString()), gerador.nextInt(999999));
                        RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("AtivarSAT",resp);

                        //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                        //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                        // Recomenda-se acessar a função e entender como ela funciona
                        String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
                        System.out.println(retornoFormatado);
                        ComponentsGertec.dialogoRetorno(retornoFormatado, context);
                    } else {
                        Toast.makeText(Ativacao.this, "O Código de Ativação e a Confirmação do Código de Ativação não correspondem!", Toast.LENGTH_LONG).show();
                    }
                } else {
                    Toast.makeText(Ativacao.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });
    }
}