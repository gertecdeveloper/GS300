program Exemplo_SubLcd;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  mainSubLcd in 'mainSubLcd.pas' {Form1},
  SdkPlugin in 'Libs\SdkPlugin.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
