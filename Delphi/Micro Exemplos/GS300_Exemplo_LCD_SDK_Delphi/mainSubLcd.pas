unit mainSubLcd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TextLayout,
  FMX.Controls.Presentation, FMX.StdCtrls, SdkPlugin, Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge, System.IOUtils,
  Androidapi.JNI.JavaTypes, Androidapi.Bitmap, FMX.Surfaces,
  FMX.Helpers.Android;

type
  TForm1 = class(TForm)
    btnPropaganda: TButton;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    btnTexto: TButton;
    btnScanner: TButton;
    procedure btnPropagandaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTextoClick(Sender: TObject);
    procedure btnScannerClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    subLcd: JSubLcd;
    playAds: Boolean;
    Bitmaps: array [0 .. 3] of TBitmap;
    JBitmaps: array [0 .. 3] of JBitmap;
    CurrentIndex: Integer;
    Timer: TTimer;
    procedure LoadAndDisplayImages;
    procedure TimerOnTimer(Sender: TObject);
    function ConvertToJBitmap(Bitmap: TBitmap): JBitmap;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnScannerClick(Sender: TObject);
begin
  playAds := false;
  subLcd.sendScan;
end;

procedure TForm1.btnTextoClick(Sender: TObject);
var
  Text: String;

begin
  playAds := false;
  if Timer <> nil then
  begin
    Timer.Enabled := false;
  end;

  Sleep(2000);
  Text := 'GS300 Terminal PDV';
  subLcd.sendText(StringToJString(Text),
    TJLayout_Alignment.JavaClass.ALIGN_NORMAL, 60);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  subLcd := TJSubLcd.JavaClass.init(TAndroidHelper.Context);
  playAds := false;

end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  if Assigned(Timer) then
    Timer.Free;  // Libera o objeto Timer se estiver alocado

  for I := 0 to 3 do
    if Assigned(Bitmaps[I]) then
      Bitmaps[I].Free;  // Libera os objetos TBitmap utilizados para as propagandas

end;

procedure TForm1.btnPropagandaClick(Sender: TObject);
begin
  playAds := True;
  LoadAndDisplayImages;
end;

procedure TForm1.LoadAndDisplayImages;
var
  ImagePaths: array [0 .. 3] of string;
  I: Integer;
begin
  // Definir caminhos das imagens
  ImagePaths[0] := TPath.Combine(TPath.GetDocumentsPath, 'image1.jpeg');
  ImagePaths[1] := TPath.Combine(TPath.GetDocumentsPath, 'image2.jpeg');
  ImagePaths[2] := TPath.Combine(TPath.GetDocumentsPath, 'image3.jpeg');
  ImagePaths[3] := TPath.Combine(TPath.GetDocumentsPath, 'image4.jpeg');

  // Carregar bitmaps
  for I := 0 to 3 do
  begin
    Bitmaps[I] := TBitmap.Create;
    Bitmaps[I].LoadFromFile(ImagePaths[I]);
  end;

  // Configurar e iniciar o temporizador
  Timer := TTimer.Create(Self);
  Timer.Interval := 2000; // Trocar a cada 2 segundos
  Timer.OnTimer := TimerOnTimer;
  Timer.Enabled := True;
  CurrentIndex := 0;
end;

procedure TForm1.TimerOnTimer(Sender: TObject);
var
  AdsBitmap: JBitmap;
begin
  if playAds then
  begin
    AdsBitmap := ConvertToJBitmap(Bitmaps[CurrentIndex]);
    TThread.Synchronize(nil,
      procedure
      begin
        // Enviar a imagem atual para o subLcd
        subLcd.sendBitmap(AdsBitmap);
        // Atualizar o �ndice para a pr�xima imagem
        CurrentIndex := (CurrentIndex + 1) mod 4;
      end);
  end
  else
  begin
    Timer.Enabled := false;
    exit;
  end;
end;

function TForm1.ConvertToJBitmap(Bitmap: TBitmap): JBitmap;
var
  LSurface: TBitmapSurface;
  ResultBitmap: JBitmap;
begin
  ResultBitmap := TJBitmap.JavaClass.createBitmap(Bitmap.Width, Bitmap.Height,
    TJBitmap_Config.JavaClass.ARGB_8888);
  LSurface := TBitmapSurface.Create;
  try
    LSurface.Assign(Bitmap);
    SurfaceToJBitmap(LSurface, ResultBitmap);
    Result := ResultBitmap;
  finally
    LSurface.Free;
  end;
end;

end.
