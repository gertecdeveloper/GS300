unit mainSegundaTela;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, EasylayerPlugin,
  FMX.Controls.Presentation, FMX.StdCtrls, Androidapi.Jni.App,
  FMX.Helpers.Android, FMX.MediaLibrary,
  Androidapi.Jni.GraphicsContentViewText, Androidapi.Jni.JavaTypes,
  Androidapi.Jni.Net, Androidapi.Helpers,
  FMX.surfaces, Androidapi.JNIBridge, System.IOUtils;

type
  TForm1 = class(TForm)
    btnStartCarousel: TButton;
    btnStopCarousel: TButton;
    btnClearCarousel: TButton;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    Label2: TLabel;
    btnStartScanner: TButton;
    btnStopScanner: TButton;
    Label3: TLabel;
    procedure btnStartCarouselClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStopCarouselClick(Sender: TObject);
    procedure btnClearCarouselClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStartScannerClick(Sender: TObject);
    procedure btnStopScannerClick(Sender: TObject);
  private
    procedure LoadAndDisplayImages;
    function LoadImageToJavaArray(const ImagePath: string): TJavaArray<Byte>;
    function JavaArrayToJBitmap(JavaArray: TJavaArray<Byte>): JBitmap;
  public
    pluginEasyLayer: JPluginEasyLayer;

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  myReturn: Boolean;
begin
  // Inicializa��o necess�ria na cria��o do formul�rio
  pluginEasyLayer := TJPluginEasyLayer.JavaClass.init;
  myReturn := pluginEasyLayer.instanciaLcd(TAndroidHelper.Activity);
  ShowMessage('Instanciando LCD: ' + BoolToStr(myReturn, true));
  pluginEasyLayer.CodeScanner(TAndroidHelper.Activity);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // Liberar recursos
  pluginEasyLayer := nil;
  //ShowMessage('Formul�rio destru�do e recursos liberados');
end;

procedure TForm1.btnClearCarouselClick(Sender: TObject);
var
  LcdReturn: Boolean;
begin
  // Limpar a tela do display secund�rio
  LcdReturn := pluginEasyLayer.clearScreen;
  ShowMessage('Clear: ' + BoolToStr(LcdReturn, true));
end;


procedure TForm1.btnStartCarouselClick(Sender: TObject);
begin
  // Carregar e exibir as imagens
  LoadAndDisplayImages;
end;

procedure TForm1.btnStopCarouselClick(Sender: TObject);
var
  LcdReturn: Boolean;
begin
  // Parar o carrossel de imagens
  LcdReturn := pluginEasyLayer.stopCarrossel;
  ShowMessage('Stop: ' + BoolToStr(LcdReturn, true));
end;


procedure TForm1.btnStartScannerClick(Sender: TObject);
begin
  //Inicia o scanner
  pluginEasyLayer.scanCode(TAndroidHelper.Activity) ;
end;

procedure TForm1.btnStopScannerClick(Sender: TObject);
begin
  //Parar scanner
  pluginEasyLayer.scanCodeStop;
end;


procedure TForm1.LoadAndDisplayImages;
var
  ImagePaths: array [0..3] of string;
  JavaArrayList: JArrayList;
  JavaArray: TJavaArray<Byte>;
  ImageBitmap: JBitmap;
  pluginEasyLayerReturn: Boolean;
  I: Integer;
begin
  // Definir caminhos das imagens
  ImagePaths[0] := TPath.Combine(TPath.GetDocumentsPath, 'image1.jpeg');
  ImagePaths[1] := TPath.Combine(TPath.GetDocumentsPath, 'image2.jpeg');
  ImagePaths[2] := TPath.Combine(TPath.GetDocumentsPath, 'image3.jpeg');
  ImagePaths[3] := TPath.Combine(TPath.GetDocumentsPath, 'image4.jpeg');

  JavaArrayList := TJArrayList.Create;
  try
    for I := Low(ImagePaths) to High(ImagePaths) do
    begin
      // Verificar se o arquivo de imagem existe
      if not FileExists(ImagePaths[I]) then
      begin
        ShowMessage('Imagem n�o encontrada: ' + ImagePaths[I]);
        Continue;
      end;

      try
        JavaArray := LoadImageToJavaArray(ImagePaths[I]);
        ImageBitmap := JavaArrayToJBitmap(JavaArray);
        JavaArrayList.add(ImageBitmap);
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao carregar imagem: ' + E.Message);
        end;
      end;
    end;

    // Iniciar carrossel de imagens no display secund�rio
    pluginEasyLayerReturn := pluginEasyLayer.startCarrossel(JavaArrayList);
    ShowMessage('Start: ' + BoolToStr(pluginEasyLayerReturn, true));
  finally
    //JavaArrayList.Free;
  end;
end;

function TForm1.LoadImageToJavaArray(const ImagePath: string): TJavaArray<Byte>;
var
  Bitmap: TBitmap;
  ImageStream: TMemoryStream;
  JavaArray: TJavaArray<Byte>;
  I: Integer;
begin
  Bitmap := TBitmap.Create;
  ImageStream := TMemoryStream.Create;
  try
    Bitmap.LoadFromFile(ImagePath);
    ImageStream.Clear;
    Bitmap.SaveToStream(ImageStream);

    // Criar TJavaArray<Byte> com o mesmo tamanho do TMemoryStream
    JavaArray := TJavaArray<Byte>.Create(ImageStream.Size);

    // Copiar dados do TMemoryStream para TJavaArray<Byte>
    ImageStream.Position := 0;
    for I := 0 to ImageStream.Size - 1 do
    begin
      JavaArray[I] := PByte(ImageStream.Memory)[I];
    end;

    Result := JavaArray;
  finally
    Bitmap.Free;
    ImageStream.Free;
  end;
end;

function TForm1.JavaArrayToJBitmap(JavaArray: TJavaArray<Byte>): JBitmap;
begin
  // Decodificar TJavaArray<Byte> em JBitmap
  Result := TJBitmapFactory.JavaClass.decodeByteArray(JavaArray, 0, JavaArray.Length);
end;

end.

