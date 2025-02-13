program GS300_Impressora;

uses
  System.StartUpCopy,
  FMX.Forms,
  uImpressora in 'uImpressora.pas' {FrmImpressora},
  uFormat in 'util\uFormat.pas',
  AndroidTTS in 'AndroidTTS.pas',
  GS300Interfaces in 'libs\GS300Interfaces.pas',
  uPrinter in 'uPrinter.pas',
  uTratamentoDeImagem in 'util\uTratamentoDeImagem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmImpressora, FrmImpressora);
  Application.Run;
end.
