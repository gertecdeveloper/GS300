package com.exampledv.exemplogs300_java.sat;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.view.View;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;

import com.exampledv.exemplogs300_java.R;
import com.phimac.gertec.sat.satger.ResponseSat;
import com.phimac.gertec.sat.satger.ResponseSatInterface;
import com.phimac.gertec.sat.satger.SatGerLib;

import java.util.ArrayList;
import java.util.Base64;

public class Sat extends Activity {

    //private String cupons = "<CFe><infCFe versaoDadosEnt=\"0.06\"><ide><CNPJ>16716114000172</CNPJ><signAC>SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT</signAC><numeroCaixa>123</numeroCaixa></ide><emit><CNPJ>03654119000176</CNPJ><IE>000052619494</IE><IM>123123</IM><indRatISSQN>N</indRatISSQN></emit><dest/><det nItem=\"1\"><prod><cProd>0020</cProd><xProd>Trib ICMS Isento -  PIS e COFINS ST aliquota 0.0250</xProd><NCM>60052300</NCM><CFOP>5020</CFOP><uCom>kg</uCom><qCom>1.0000</qCom><vUnCom>30.00</vUnCom><indRegra>A</indRegra></prod><imposto><ICMS><ICMS40><Orig>2</Orig><CST>40</CST></ICMS40></ICMS><PIS><PISAliq><CST>02</CST><vBC>30.00</vBC><pPIS>0.0250</pPIS></PISAliq></PIS><PISST><vBC>30.00</vBC><pPIS>0.0250</pPIS></PISST><COFINS><COFINSAliq><CST>02</CST><vBC>30.00</vBC><pCOFINS>0.0250</pCOFINS></COFINSAliq></COFINS><COFINSST><vBC>30.00</vBC><pCOFINS>0.0250</pCOFINS></COFINSST></imposto></det><total></total><pgto><MP><cMP>01</cMP><vMP>30.00</vMP></MP></pgto></infCFe></CFe>";
    private int sessao = (int)(Math.random()*1000000)%1000000;
    PowerManager.WakeLock wakeLock;
    private SatGerLib serialComms;
    private TextView versiontxt;

    private EditText inputCodAtiv, inputNovoCodAtiv, inputCNPJ, inputChaveCancela, inputSWHouse,inputNumSessao;
    private Button log_Btn, ativatSAT_btn, atualizarSAT_btn, consultarSAT_btn, associar_assinatura_btn,
            consultar_status_operacional_btn, consultar_numero_sessao_btn, bloquearSAT_btn, desbloquearSAT_btn,
            enviar_dados_venda_btn, cancelar_ultima_venda_btn, trocar_codigo_de_ativacao_btn,
            teste_fim_a_fim_btn, configurar_interface_de_rede_btn;

    TextView message;

    public int cUF = 0;

    public String assinatura = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sat);

        // Ativa o modo full screen
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            getWindow().setDecorFitsSystemWindows(false);
        }

        View decorView = getWindow().getDecorView();
        WindowInsetsControllerCompat controller = ViewCompat.getWindowInsetsController(decorView);

        if (controller != null) {
            // Oculta as barras de sistema
            controller.hide(WindowInsetsCompat.Type.systemBars());
            // Permite que as barras apareçam com swipe
            controller.setSystemBarsBehavior(WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
        }

        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        //PowerManager powerManager = (PowerManager) getSystemService(POWER_SERVICE);
        /*wakeLock = powerManager.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,
                "MyWakelockTag");*/
        //wakeLock.acquire();

        ResponseSat responseSat = (ResponseSat) new ResponseSat(new ResponseSatInterface() {
            @Override
            public void processFinish(String[] output) {
                onReceivedDataUpdate(output[1]);
                /*if(output[0].contains("EnviarDadosVenda"))
                {
                    flagSend = true;
                    System.out.println("flag send true");
                }*/
                System.out.println(output[0]);
            }
        }).execute();

        serialComms = new SatGerLib(Sat.this, responseSat);

        versiontxt = (TextView)findViewById(R.id.libversion);
        versiontxt.setText(getVersion());

        log_Btn = (Button) findViewById(R.id.btnExtrairLog);
        log_Btn.setOnClickListener(generalClickListener); //callback do btn

        ativatSAT_btn = (Button) findViewById(R.id.btnAtivarSAT);
        ativatSAT_btn.setOnClickListener(generalClickListener);//callback btn

        atualizarSAT_btn = (Button) findViewById(R.id.btnAtualizarSAT);
        atualizarSAT_btn.setOnClickListener(generalClickListener);//callback

        consultarSAT_btn = (Button) findViewById(R.id.btnConsultaSAT);
        consultarSAT_btn.setOnClickListener(generalClickListener);//callback

        associar_assinatura_btn = (Button) findViewById(R.id.btnAssociarSAT);
        associar_assinatura_btn.setOnClickListener(generalClickListener);//callback

        consultar_status_operacional_btn = (Button) findViewById(R.id.btnConsultarStatusOperacional);
        consultar_status_operacional_btn.setOnClickListener(generalClickListener);//callback

        consultar_numero_sessao_btn = (Button) findViewById(R.id.btnConsultarNumeroSessao);
        consultar_numero_sessao_btn.setOnClickListener(generalClickListener);//callback

        bloquearSAT_btn = (Button) findViewById(R.id.btnBloquearSAT);
        bloquearSAT_btn.setOnClickListener(generalClickListener);//callback

        desbloquearSAT_btn = (Button) findViewById(R.id.btnDesbloquearSAT);
        desbloquearSAT_btn.setOnClickListener(generalClickListener);//callback

        enviar_dados_venda_btn = (Button) findViewById(R.id.btnEnviarDadosVenda);
        enviar_dados_venda_btn.setOnClickListener(generalClickListener);//callback

        cancelar_ultima_venda_btn = (Button) findViewById(R.id.btnCancelarUltimaVenda);
        cancelar_ultima_venda_btn.setOnClickListener(generalClickListener);//callback

        trocar_codigo_de_ativacao_btn = (Button) findViewById(R.id.btnTrocarCodigoDeAtivacao);
        trocar_codigo_de_ativacao_btn.setOnClickListener(generalClickListener);//callback

        teste_fim_a_fim_btn = (Button) findViewById(R.id.btnTesteFimAFim);
        teste_fim_a_fim_btn.setOnClickListener(generalClickListener);//callback

        configurar_interface_de_rede_btn = (Button) findViewById(R.id.btnConfigurarInterfaceDeRede);
        configurar_interface_de_rede_btn.setOnClickListener(generalClickListener);//callback

//        consultar_status_operacional_MFE_btn = (Button) findViewById(R.id.btnConsultarStatusOperacionalMFE);
//        consultar_status_operacional_MFE_btn.setOnClickListener(generalClickListener);

        message = ((TextView) findViewById(R.id.incomingMessage));

        inputCodAtiv = (EditText) findViewById(R.id.editTextCodAtiva);

        inputNovoCodAtiv = (EditText) findViewById(R.id.editTextNovoCodAtiva);

        inputCNPJ = (EditText) findViewById(R.id.editTextCNPJ);

        inputChaveCancela = (EditText) findViewById(R.id.editTextChaveCancelaVenda);

        inputSWHouse = (EditText) findViewById(R.id.editTextCNPJSWHouse);

        inputNumSessao = (EditText) findViewById(R.id.editTextNumSessao);

        Spinner spinner = (Spinner)findViewById(R.id.spinner);
        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add("São Paulo");
        arrayList.add("Ceará");
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this,                         android.R.layout.simple_spinner_item, arrayList);
        arrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(arrayAdapter);
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String uf = parent.getItemAtPosition(position).toString();
                if (uf == "São Paulo"){
                    cUF = 35;
                    assinatura = "SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT";
                }else{
                    cUF = 23;
                    assinatura = "CODIGO DE VINCULACAO AC DO MFE-CFE";
                }
            }
            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
    }
    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onDestroy() {
        if (wakeLock != null && wakeLock.isHeld()) {
            wakeLock.release();
            wakeLock = null; // Boa prática para evitar chamadas duplicadas
        }
        super.onDestroy();
    }


    //@Override
    public void onError(Exception e) {
        onReceivedDataUpdate(e.getMessage());
    }

    /*@Override*/
    public void onReceivedDataUpdate(String messageReceived) {
        boolean Cancelar = false;
        if (Cancelar){
            String[] msg = messageReceived.split("|");
            //inputChaveCancela.setText(msg[8]);
            Cancelar = false;
            for (int i = 0; i < msg.length; i++){
                if(msg[i].contains("CFe") && msg[i].length() == 47){
                    inputChaveCancela.setText(msg[i].toString());
                }
            }
        }

        message.setText(messageReceived);

        if(messageReceived!=null)
        {
            System.out.println(messageReceived);
        }
    }

    View.OnClickListener generalClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            int id = v.getId();

            if (id == R.id.btnExtrairLog) {
                extrairLog();
            } else if (id == R.id.btnAtivarSAT) {
                ativarSAT();
            } else if (id == R.id.btnAtualizarSAT) {
                atualizarSat();
            } else if (id == R.id.btnConsultaSAT) {
                consultarSAT();
            } else if (id == R.id.btnAssociarSAT) {
                associar_assinatura();
            } else if (id == R.id.btnConsultarStatusOperacional) {
                consultar_status_operacional();
            } else if (id == R.id.btnConsultarNumeroSessao) {
                consultar_numero_sessao();
            } else if (id == R.id.btnBloquearSAT) {
                bloquearSAT();
            } else if (id == R.id.btnDesbloquearSAT) {
                desbloquarSAT();
            } else if (id == R.id.btnEnviarDadosVenda) {
                enviarDadosVenda();
            } else if (id == R.id.btnCancelarUltimaVenda) {
                cancelarUltimaVenda();
            } else if (id == R.id.btnTrocarCodigoDeAtivacao) {
                trocarCodigoDeAtivacao();
            } else if (id == R.id.btnTesteFimAFim) {
                testeFimAFim();
            } else if (id == R.id.btnConfigurarInterfaceDeRede) {
                configurarInterfaceDeRede();
            }
            // else if (id == R.id.btnConsultarStatusOperacionalMFE) {
            //     consultar_status_operacional_mfe();
            // }
        }
    };

    public String getVersion(){
        return serialComms.VersaoDllGerSAT();
    }

    //-----------------------------------------------------------------------------------------
//    public void extrairLog(){
//        try {
//            String ret = serialComms.ExtrairLogs(++sessao, inputCodAtiv.getText().toString());
//        } catch (Exception e) {
//            onError(e);
//        }
//    }


    public void extrairLog(){
        try {
            String codAtivacao = inputCodAtiv.getText().toString();
            String ret = serialComms.ExtrairLogs(++sessao, codAtivacao);

            // Converte o log retornado (ret) para base64
            String retBase64 = null;
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                retBase64 = Base64.getEncoder().encodeToString(ret.getBytes());
            }

            // Exibir ou utilizar o log em base64 conforme necessário
            System.out.println("Log em base64: " + retBase64);

        } catch (Exception e) {
            onError(e);
        }
    }




    //---------------------------------------------------------------------------------------------

    public void ativarSAT(){
        try {
            String ret = serialComms.AtivarSAT(++sessao, 1, inputCodAtiv.getText().toString(), inputCNPJ.getText().toString(), cUF);
        } catch (Exception e){
            onError(e);
        }
    }

    public void atualizarSat(){
        try {
            String ret = serialComms.AtualizarSAT(++sessao, inputCodAtiv.getText().toString());
        } catch (Exception e) {
            onError(e);
        }
    }

    public void consultarSAT(){
        try{
            String ret = serialComms.ConsultarSAT(++sessao);
        }catch (Exception e){
            onError(e);
        }
    }

    public void associar_assinatura(){
        try{
            String CNPJ = inputSWHouse.getText().toString() + inputCNPJ.getText().toString();
            String ret = serialComms.AssociarAssinatura(++sessao,  inputCodAtiv.getText().toString(),CNPJ, assinatura);
        }catch (Exception e){
            onError(e);
        }
    }

    public void consultar_status_operacional(){
        try{
            String ret = serialComms.ConsultarStatusOperacional(++sessao, inputCodAtiv.getText().toString());
        }catch (Exception e){
            onError(e);
        }
    }

    public void consultar_status_operacional_mfe(){
        try{
            String ret = serialComms.ConsultarStatusOperacional(++sessao, inputCodAtiv.getText().toString());
        }catch (Exception e){
            onError(e);
        }
    }

    public void consultar_numero_sessao(){
        try{
            String ret = serialComms.ConsultarNumeroSessao(++sessao,inputCodAtiv.getText().toString(), Integer.parseInt(inputNumSessao.getText().toString()));
        }catch (Exception e){
            onError(e);
        }
    }

    public void bloquearSAT(){
        try{
            String ret = serialComms.BloquearSAT(++sessao, inputCodAtiv.getText().toString());
        }catch (Exception e){
            onError(e);
        }
    }

    public void desbloquarSAT(){
        try{
            String ret = serialComms.DesbloquearSAT(++sessao,inputCodAtiv.getText().toString());
        }catch (Exception e){
            onError(e);
        }
    }

    public void enviarDadosVenda(){
        try {
            boolean Cancelar = true;
            String ret = serialComms.EnviarDadosVenda(++sessao, inputCodAtiv.getText().toString(),
                    Cupom.GeraCupom(true ,inputSWHouse.getText().toString().toString().replace(".", ""),inputCNPJ.getText().toString().toString().replace(".", ""), assinatura));
        } catch (Exception e) {
            onError(e);
        }
    }

    //<CFeCanc><infCFe chCanc = "CFe29180903654119000176599000056460018170565936" ><ide><CNPJ>16716
    //114000172</CNPJ><signAC>SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT</signAC><numeroCaixa>123</numeroCaixa></ide>
    // <emit></emit><dest></dest><total></total></infCFe></CFeCanc>

    private String GeraDadosCancelamento(){
        String chave = "<CFeCanc><infCFe chCanc = \"" + inputChaveCancela.getText().toString() + "\" " +
                "><ide><CNPJ>"+ inputSWHouse.getText().toString() + "</CNPJ>" +
                "<signAC>"+ assinatura +"</signAC>" +
                "<numeroCaixa>123</numeroCaixa></ide>    " +
                "<emit></emit><dest></dest><total></total></infCFe></CFeCanc>";
        return chave;
    }

    public void cancelarUltimaVenda(){
        try{
            String ret = serialComms.CancelarUltimaVenda(++sessao, inputCodAtiv.getText().toString(), inputChaveCancela.getText().toString(), GeraDadosCancelamento());
        }catch (Exception e){
            onError(e);
        }
    }

    public void trocarCodigoDeAtivacao(){
        try{
            String ret = serialComms.TrocarCodigoDeAtivacao(++sessao,inputCodAtiv.getText().toString(), 1, inputNovoCodAtiv.getText().toString(), inputNovoCodAtiv.getText().toString());
        }catch (Exception e){
            onError(e);
        }
    }

    public void testeFimAFim(){
        try{
            String ret = serialComms.TesteFimAFim(++sessao,inputCodAtiv.getText().toString(),
                    Cupom.GeraCupom(true, inputSWHouse.getText().toString().toString().replace(".", ""),inputCNPJ.getText().toString().toString().replace(".", ""), assinatura));
        }catch (Exception e){
            onError(e);
        }
    }

    public void configurarInterfaceDeRede(){
        try{
            String ret = serialComms.ConfigurarInterfaceDeRede(++sessao, inputCodAtiv.getText().toString(), "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                    "<config>\n" +
                    "<tipoInter>ETHE</tipoInter>\n" +
                    "<tipoLan>DHCP</tipoLan>\n" +
                    "<proxy>0</proxy >\n" +
                    "</config>");
        }catch (Exception e){
            onError(e);
        }
    }
}