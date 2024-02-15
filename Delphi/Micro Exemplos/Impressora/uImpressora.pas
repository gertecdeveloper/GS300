unit uImpressora;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation,
  uPrinter;

type
  TFrmImpressora = class(TForm)
    btnCupom: TButton;
    btnImprimirCodigoDeBarras: TButton;
    btnImprimirImagem: TButton;
    btnImprimirQrCode: TButton;
    ImageControl1: TImageControl;
    procedure btnImprimirCodigoDeBarrasClick(Sender: TObject);
    procedure btnCupomClick(Sender: TObject);
    procedure btnImprimirQrCodeClick(Sender: TObject);
    procedure btnImprimirImagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpressora: TFrmImpressora;

implementation

{$R *.fmx}

procedure TFrmImpressora.btnCupomClick(Sender: TObject);
begin
  GS300Printer.ImprimeCupom;

end;

procedure TFrmImpressora.btnImprimirCodigoDeBarrasClick(Sender: TObject);
begin
//T_TIPO_BARCODE  = (UPCA, UPCE, EAN13, EAN8, CODE39, ITF, CODABAR, CODE93, CODE128A, CODE128B, CODE128C);
  GS300Printer.ImprimeCodigoDeBarras('7899970400070', 2, 100, 200, 1, 0);

end;

procedure TFrmImpressora.btnImprimirImagemClick(Sender: TObject);
begin

   GS300Printer.ImprimirImagem(ImageControl1.Bitmap );
end;

procedure TFrmImpressora.btnImprimirQrCodeClick(Sender: TObject);
begin

   GS300Printer.ImprimeQRCode('GS300');
end;


end.
