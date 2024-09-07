unit unt.itens.vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unt.producto.service, unt.producto,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, unt.TipoOperacion.Enum,
  unt.elementos.pedido, unt.elementos.pedido.service;

type
  TfrmItensVendas = class(TForm)
    pnTop: TPanel;
    pnCenter: TPanel;
    pnButton: TPanel;
    btnSalvar: TSpeedButton;
    btnSalir: TSpeedButton;
    lblNombreBentana: TLabel;
    EdtCodProducto: TEdit;
    Label1: TLabel;
    EdtDescricion: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtPrecoUnitario: TEdit;
    Label4: TLabel;
    EdtCantidad: TEdit;
    Label5: TLabel;
    EdtPrecioTotal: TEdit;
    SpeedButton1: TSpeedButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EdtCodProductoExit(Sender: TObject);
    procedure EdtCantidadExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodProductoKeyPress(Sender: TObject; var Key: Char);
  private
    FProductoService       : TProductoService;
    FProducto              : TProducto;
    FElementosPedido       : TElementosPedido;
    FElementosPedidoService: TElementosPedidoService;
    FCodigo                : Integer;
    FTipoOperacion         : TTipoOperacion;
    FCodigoVenta           : Integer;

    Procedure CalcPrecioTotal();
    Procedure GrabaDataSet();
    Procedure CargarObjeto();
    function  Consiste: Boolean;
    procedure LimpiaTela;
    procedure CargarDatos;
  public
    Property Codigo         : Integer          read FCodigo          write FCodigo;
    Property CodigoVenta    : Integer          read FCodigoVenta     write FCodigoVenta;
    Property TipoOperacion  : TTipoOperacion   read FTipoOperacion   write FTipoOperacion;
    Property Producto       : TProducto        read FProducto        write FProducto;
    Property ElementosPedido: TElementosPedido read FElementosPedido write FElementosPedido;
  end;

var
  frmItensVendas: TfrmItensVendas;

implementation

{$R *.dfm}

uses unt.inc.vendas;

procedure TfrmItensVendas.btnSalvarClick(Sender: TObject);
begin
  if Consiste then
  begin
    CalcPrecioTotal();
    CargarObjeto();
    GrabaDataSet();
  end;
  Close;
end;

procedure TfrmItensVendas.CalcPrecioTotal;
var
  Cuantidad     : Extended;
  PrecioUnitario: Extended;
begin
  Cuantidad           :=  0;
  PrecioUnitario      :=  0;
  Cuantidad           := StrToFloatDef(EdtCantidad.Text, 0);
  PrecioUnitario      := StrToFloatDef(EdtPrecoUnitario.Text, 0);
  EdtPrecioTotal.Text := FormatFloat('###,0.00', PrecioUnitario * Cuantidad);
end;

procedure TfrmItensVendas.CargarDatos;
begin
  if TipoOperacion = toAlterar then
  begin
    FElementosPedido      := FElementosPedidoService.Load(Codigo);
    EdtCodProducto.Text   := FElementosPedido.Producto.ID.ToString;
    EdtDescricion.Text    := FElementosPedido.Producto.Descripcion;
    EdtPrecoUnitario.Text := FormatFloat('###,0.00', FElementosPedido.ValorUnitario);
    EdtCantidad.Text      := FloatToStr(FElementosPedido.Cantidad);
    EdtPrecioTotal.Text   := FormatFloat('###,0.00', FElementosPedido.ValorTotal);
  end;
end;

procedure TfrmItensVendas.CargarObjeto;
begin
  ElementosPedido.Producto.ID          := Codigo;
  ElementosPedido.Producto.Descripcion := EdtDescricion.Text;
  ElementosPedido.Cantidad             := StrToFloatDef(EdtCantidad.Text, 0);
  ElementosPedido.ValorUnitario        := StrToFloatDef(EdtPrecoUnitario.Text, 0);
  ElementosPedido.ValorTotal           := StrToFloatDef(EdtPrecioTotal.Text, 0);
  ElementosPedido.Producto             := FProductoService.Load(StrToIntDef(EdtCodProducto.Text, 0));
end;

function TfrmItensVendas.Consiste: Boolean;
var
  mensagem: String;
begin
  Result := True;

  if Trim(EdtCodProducto.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Cod.Producto] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtCodProducto.SetFocus;
    Result := False;
    Abort;
  end;

  if Trim(EdtDescricion.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Descricion] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtDescricion.SetFocus;
    Result := False;
    Abort;
  end;

  if StrToFloatDef(EdtPrecoUnitario.Text, 0) = 0 then
  begin
    mensagem := 'El campo [Precio Unitario] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtDescricion.SetFocus;
    Result := False;
    Abort;
  end;

  if StrToFloatDef(EdtCantidad.Text, 0) = 0 then
  begin
    mensagem := 'El campo [Cantidad] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtCantidad.SetFocus;
    Result := False;
    Abort;
  end;

  if StrToFloatDef(EdtPrecioTotal.Text, 0) = 0 then
  begin
    mensagem := 'El campo [Precio Total] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtPrecioTotal.SetFocus;
    Result := False;
    Abort;
  end;

  if (FProductoService.ConsultaSaldo(StrToIntDef(EdtCodProducto.Text, 0)) < StrToFloatDef(EdtCantidad.Text, 0)) then
  begin
    mensagem := 'El Saldo insuficiente.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtPrecioTotal.SetFocus;
    Result := False;
    Abort;
  end;
end;

procedure TfrmItensVendas.EdtCantidadExit(Sender: TObject);
begin
  CalcPrecioTotal();
end;

procedure TfrmItensVendas.EdtCodProductoExit(Sender: TObject);
var
  Producto: TProducto;
begin
  if Trim(EdtCodProducto.Text) <> EmptyStr then
  begin
    Producto := TProducto.Create;
    try
      Producto := FProductoService.Load(StrToIntDef(EdtCodProducto.Text, 0));
      if Assigned(Producto) then
      begin
        EdtDescricion.Text    := Producto.Descripcion;
        EdtPrecoUnitario.Text := FormatFloat('###,0.00', Producto.Precio);
      end;
    finally
      Producto.DisposeOf;
    end;
  end;
end;

procedure TfrmItensVendas.EdtCodProductoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    SelectNext(TWinControl(Sender), True, True);
end;

procedure TfrmItensVendas.FormCreate(Sender: TObject);
begin
  FProductoService        := TProductoService.Create;
  Producto                := TProducto.Create;
  FElementosPedidoService := TElementosPedidoService.Create;
  ElementosPedido         := TElementosPedido.Create;
end;

procedure TfrmItensVendas.FormDestroy(Sender: TObject);
begin
  //FProductoService.DisposeOf;
  //FElementosPedidoService.DisposeOf;
end;

procedure TfrmItensVendas.FormShow(Sender: TObject);
begin
  LimpiaTela;
  CargarDatos();
end;

procedure TfrmItensVendas.GrabaDataSet;
begin
  frmIncVendas.FDMemPrincipal.Open;
  if TipoOperacion = toAlterar then
  begin
    frmIncVendas.FDMemPrincipal.Edit;
    frmIncVendas.FDMemPrincipal.FieldByName('TipoOperacion').AsString := 'A';
  end
  else
  begin
    frmIncVendas.FDMemPrincipal.Insert;
    frmIncVendas.FDMemPrincipal.FieldByName('TipoOperacion').AsString := 'I';
  end;
  frmIncVendas.FDMemPrincipal.FieldByName('Cod_Venda').AsInteger    := CodigoVenta;
  frmIncVendas.FDMemPrincipal.FieldByName('Codigo').AsInteger       := Codigo;
  frmIncVendas.FDMemPrincipal.FieldByName('Cod_Producto').AsInteger := ElementosPedido.Producto.ID;
  frmIncVendas.FDMemPrincipal.FieldByName('Descripcion').AsString   := ElementosPedido.Producto.Descripcion;
  frmIncVendas.FDMemPrincipal.FieldByName('Cantidad').AsFloat       := ElementosPedido.Cantidad;;
  frmIncVendas.FDMemPrincipal.FieldByName('Precio').AsExtended      := ElementosPedido.ValorUnitario;
  frmIncVendas.FDMemPrincipal.FieldByName('PrecioTotal').AsExtended := ElementosPedido.ValorTotal;
  frmIncVendas.FDMemPrincipal.Post;
end;

procedure TfrmItensVendas.LimpiaTela;
var
  i : Integer;
begin
  for i := 0 to Self.ControlCount - 1 do
  begin
    if Self.Controls[i] is TEdit then
      (Self.Controls[i] as TEdit).Clear
    else
    if Self.Controls[i] is TComboBox then
      (Self.Controls[i] as TComboBox).ItemIndex := -1
    else
    if Self.Controls[i] is TRadioGroup then
      (Self.Controls[i] as TRadioGroup).ItemIndex := -1
    else
    if Self.Controls[i] is TCheckBox then
      (Self.Controls[i] as TCheckBox).Checked := False;
  end;
end;

procedure TfrmItensVendas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.
