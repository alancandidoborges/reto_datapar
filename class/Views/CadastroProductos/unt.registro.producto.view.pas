unit unt.registro.producto.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unt.formplantilharegistro.view,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, unt.producto, unt.producto.service;

type
  TfrmRegistroProducto = class(TfrmPlantilhaRegistro)
    Label1: TLabel;
    EdtNombre: TEdit;
    Label2: TLabel;
    MemDescripcion: TMemo;
    Label3: TLabel;
    EdtPrecio: TEdit;
    EdtQuantidad: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EdtNombreKeyPress(Sender: TObject; var Key: Char);
  private
    FProducto       : TProducto;
    FProductoService: TProductoService;
  public
    function Grabar     : Integer; override;
    function Consiste   : Boolean; override;
    function CargarDatos: Boolean; override;

    procedure CargarObjeto; override;

    property Producto: TProducto read FProducto write FProducto;
  end;

var
  frmRegistroProducto: TfrmRegistroProducto;

implementation

{$R *.dfm}

uses unt.TipoOperacion.Enum;

function TfrmRegistroProducto.CargarDatos: Boolean;
begin
  if TipoOperacion = toAlterar then
  begin
    Producto := FProductoService.Load(Codigo);
    if Assigned(FProducto) then
    begin
      EdtNombre.Text      := Producto.Nombre;
      MemDescripcion.Text := Producto.Descripcion;
      EdtPrecio.Text      := FormatFloat('###,0.00', Producto.Precio);
      EdtQuantidad.Text   := FloatToStr(Producto.Cantidad);
    end;
  end
  else
  begin
    EdtPrecio.Text    := '0,00';
    EdtQuantidad.Text := '0';
  end;
end;

procedure TfrmRegistroProducto.CargarObjeto;
begin
  inherited;
  Producto.ID          := Codigo;
  Producto.Nombre      := EdtNombre.Text;
  Producto.Descripcion := MemDescripcion.Text;
  Producto.Precio      := StrToFloatDef(EdtPrecio.Text, 0);
  Producto.Cantidad    := StrToFloatDef(EdtQuantidad.Text, 0);
end;

function TfrmRegistroProducto.Consiste: Boolean;
var
  mensagem: String;
begin
  Result := True;
  if trim(edtNombre.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Nombre] no debe estar vacío.';
    Application.MessageBox(PChar(mensagem), 'Información', MB_OK + MB_ICONWARNING);
    edtNombre.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(MemDescripcion.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Descripcion] no debe estar vacío.';
    Application.MessageBox(PChar(mensagem), 'Información', MB_OK + MB_ICONWARNING);
    MemDescripcion.SetFocus;
    Result := False;
    Abort;
  end;

  if StrToFloatDef(EdtPrecio.Text, 0) = 0 then
  begin
    mensagem := 'El campo [Precio] no debe estar vacío.';
    Application.MessageBox(PChar(mensagem), 'Información', MB_OK + MB_ICONWARNING);
    EdtPrecio.SetFocus;
    Result := False;
    Abort;
  end;

  if StrToFloatDef(EdtQuantidad.Text, 0) = 0 then
  begin
    mensagem := 'El campo [Precio] no debe estar vacío.';
    Application.MessageBox(PChar(mensagem), 'Información', MB_OK + MB_ICONWARNING);
    EdtQuantidad.SetFocus;
    Result := False;
    Abort;
  end;
end;

procedure TfrmRegistroProducto.EdtNombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    SelectNext(TWinControl(Sender), True, True);
end;

procedure TfrmRegistroProducto.FormCreate(Sender: TObject);
begin
  inherited;
  Producto         := TProducto.Create;
  FProductoService := TProductoService.Create;
end;

procedure TfrmRegistroProducto.FormDestroy(Sender: TObject);
begin
  inherited;
  FProductoService.DisposeOf;
end;

function TfrmRegistroProducto.Grabar: Integer;
begin
   inherited;
   if TipoOperacion = toIncluir then
     Result := FProductoService.Insert(Producto)
   else
   begin
     Producto.ID := Codigo;
     FProductoService.Edit(Producto);
     Result := Producto.ID;
   end;
   Close;
end;

end.
