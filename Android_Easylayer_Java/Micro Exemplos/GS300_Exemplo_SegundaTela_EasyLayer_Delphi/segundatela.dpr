program segundatela;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  mainSegundaTela in 'mainSegundaTela.pas' {Form1},
  EasylayerPlugin in 'Libs\EasylayerPlugin.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
