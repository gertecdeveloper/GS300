unit uTratamentoDeImagem;

interface

uses
  FMX.Graphics, FMX.Helpers.Android, FMX.Surfaces, Androidapi.JNI.GraphicsContentViewText;

 function BitmapToJBitmap(const ABitmap: TBitmap): JBitmap;

implementation

function BitmapToJBitmap(const ABitmap: TBitmap): JBitmap;
var
  LSurface: TBitmapSurface;
  ResultBitmap: JBitmap;
begin
  ResultBitmap := TJBitmap.JavaClass.createBitmap(ABitmap.Width, ABitmap.Height, TJBitmap_Config.JavaClass.ARGB_8888);
  LSurface := TBitmapSurface.Create;
  try
    LSurface.Assign(ABitmap);
    SurfaceToJBitmap(LSurface, ResultBitmap);
    result:= ResultBitmap;
  finally
    LSurface.Free;
  end;
end;


end.
