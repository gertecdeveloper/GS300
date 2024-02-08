program MicroExemploNFC;

uses
  System.StartUpCopy,
  FMX.Forms,
  NFC in 'NFC.pas' {FrmNFC},
  Androidapi.JNI.Nfc.Tech in 'Imports NFC\Androidapi.JNI.Nfc.Tech.pas',
  Androidapi.JNI.Toast in 'Imports NFC\Androidapi.JNI.Toast.pas',
  NFCHelper in 'Imports NFC\NFCHelper.pas',
  Androidapi.JNI.Nfc in 'Imports NFC\Androidapi.JNI.Nfc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmNFC, FrmNFC);
  Application.Run;
end.
