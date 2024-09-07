unit unt.inc.vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  unt.itens.vendas, unt.TipoOperacion.Enum, unt.pedido, unt.pedido.service,
  unt.cliente.service, unt.elementos.pedido.service, unt.elementos.pedido,
  unt.producto.service, unt.cliente, Vcl.Mask;

type
  TfrmIncVendas = class(TForm)
    pnCenter: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btn_salir: TSpeedButton;
    FDMemPrincipal: TFDMemTable;
    FDMemPrincipalTipoOperacion: TStringField;
    DS_Principal: TDataSource;
    DBGrid1: TDBGrid;
    EdtCliente: TEdit;
    EdtNombreCliente: TEdit;
    Label2: TLabel;
    btnSalvar: TSpeedButton;
    Label3: TLabel;
    FDMemPrincipalCOD_VENDA: TFMTBCDField;
    FDMemPrincipalCODIGO: TFMTBCDField;
    FDMemPrincipalCOD_PRODUCTO: TFMTBCDField;
    FDMemPrincipalDESCRIPCION: TStringField;
    FDMemPrincipalCANTIDAD: TFloatField;
    FDMemPrincipalPRECIO: TBCDField;
    FDMemPrincipalPRECIOTOTAL: TBCDField;
    EdtDataEntrega: TMaskEdit;
    procedure btn_salirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure EdtClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FDMemPrincipalPRECIOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDMemPrincipalPRECIOTOTALGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FPedidoService   : TPedidoService;
    FClienteService  : TClienteService;
    FElementosService: TElementosPedidoService;
    FProductoService : TProductoService;

    FPedido          : TPedido;
    FCodigo          : Integer;
    FTipoOperacion   : TTipoOperacion;

    procedure CrearDataSet();
    procedure CargaObjeto;
    procedure CargaDatos;
    procedure LimpiaTela;

    function AlterarPedido: Boolean;
    function IncluiPedido : Integer;
    function Consiste     : Boolean;
    function tbStrIsDate(const S: string): boolean;
  public
    Property Codigo       : Integer        read FCodigo        write FCodigo;
    Property TipoOperacion: TTipoOperacion read FTipoOperacion write FTipoOperacion;
    Property Pedido       : TPedido        read FPedido        write FPedido;
  end;

var
  frmIncVendas: TfrmIncVendas;

implementation

{$R *.dfm}

procedure TfrmIncVendas.CargaDatos;
var
 List: TFDQuery;
begin
  if TipoOperacion = toAlterar then
  begin
    Pedido := FPedidoService.Load(Codigo);
    List := TFDQuery.Create(nil);
    try
      List := FElementosService.LoadGrid(Codigo);
      List.Open;
      FDMemPrincipal.Close;
      FDMemPrincipal.Filter := EmptyStr;
      FDMemPrincipal.Data   := List.Data;
      FDMemPrincipal.Open;

      EdtCliente.Text       := Pedido.Cliente.ID.ToString;
      EdtNombreCliente.Text := Pedido.Cliente.Nombre;
      EdtDataEntrega.Text   := DateToStr(Pedido.Data_Entrega);
    finally
      List.DisposeOf;
    end;
  end;
end;

procedure TfrmIncVendas.CargaObjeto;
begin
  Pedido.ID           := Codigo;
  Pedido.Cliente      := FClienteService.Load(StrToIntDef(EdtCliente.Text, 0));
  Pedido.Data_Inc     := Date();
  Pedido.Data_Entrega := StrToDate(EdtDataEntrega.Text);
end;

function TfrmIncVendas.Consiste: Boolean;
var
  mensagem: String;
begin
  Result := True;
  if trim(EdtCliente.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Cliente] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);EdtCliente.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(EdtNombreCliente.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Nombre] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);EdtCliente.SetFocus;
    Result := False;
    Abort;
  end;

  if not tbStrIsDate(EdtDataEntrega.Text) then
  begin
    mensagem := 'El campo [Fecha - Entrega] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);EdtCliente.SetFocus;
    Result := False;
    Abort;
  end;

  if (not FDMemPrincipal.Active) or (FDMemPrincipal.RecordCount = 0) then
  begin
    mensagem := 'No hay art�culos en oferta para este pedido.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);EdtCliente.SetFocus;
    Result := False;
    Abort;
  end;
end;

procedure TfrmIncVendas.CrearDataSet;
begin
  FDMemPrincipal.Close;
  FDMemPrincipal.CreateDataSet;
  FDMemPrincipal.Open;
  FDMemPrincipal.EmptyDataSet;
end;

procedure TfrmIncVendas.EdtClienteExit(Sender: TObject);
var
  Cliente: TCliente;
begin
  if Trim(EdtCliente.Text) <> EmptyStr then
  begin
    Cliente := TCliente.Create;
    try
      Cliente := FClienteService.Load(StrToIntDef(EdtCliente.Text, 0));
      EdtNombreCliente.Text := Cliente.Nombre;
    finally
      Cliente.Free;
    end;
  end;
end;

procedure TfrmIncVendas.EdtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    SelectNext(TWinControl(Sender), True, True);
end;

procedure TfrmIncVendas.FDMemPrincipalPRECIOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := FormatFloat('###,0.00', Sender.AsFloat);
end;

procedure TfrmIncVendas.FDMemPrincipalPRECIOTOTALGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := FormatFloat('###,0.00', Sender.AsFloat);
end;

procedure TfrmIncVendas.FormCreate(Sender: TObject);
begin
  FPedidoService   := TPedidoService.Create;
  FClienteService  := TClienteService.Create;
  FElementosService:= TElementosPedidoService.Create;
  FProductoService := TProductoService.Create;
  FPedido          := TPedido.Create;
end;

procedure TfrmIncVendas.FormDestroy(Sender: TObject);
begin
  FPedidoService.DisposeOf;
  FClienteService.DisposeOf;
  FElementosService.DisposeOf;
  FProductoService.DisposeOf;
end;

procedure TfrmIncVendas.FormShow(Sender: TObject);
begin
  LimpiaTela();
  CargaDatos();
end;

function TfrmIncVendas.IncluiPedido: Integer;
var
  ElementoPedido : TElementosPedido;
begin
  CargaObjeto;
  Codigo := FPedidoService.Insert(Pedido);
  Pedido.ID := Codigo;

  FDMemPrincipal.First;
  while not FDMemPrincipal.Eof do
  begin
    ElementoPedido := TElementosPedido.Create;
    try
      ElementoPedido.Pedido        := Codigo;
      ElementoPedido.Producto      := FProductoService.Load(FDMemPrincipal.FieldByName('Cod_Producto').AsInteger);
      ElementoPedido.Cantidad      := FDMemPrincipal.FieldByName('Cantidad').AsFloat;
      ElementoPedido.ValorUnitario := FDMemPrincipal.FieldByName('Precio').AsExtended;
      ElementoPedido.ValorTotal    := FDMemPrincipal.FieldByName('PrecioTotal').AsExtended;
      FElementosService.Insert(ElementoPedido);
      FProductoService.ActualizarSaldo(ElementoPedido.Producto.ID, ElementoPedido.Cantidad);
      FDMemPrincipal.Next;
    finally
      ElementoPedido.Free;
    end;
  end;
  Result := Pedido.ID;
end;

procedure TfrmIncVendas.LimpiaTela;
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

procedure TfrmIncVendas.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmItensVendas, frmItensVendas);
  frmItensVendas.TipoOperacion := toIncluir;
  frmItensVendas.ShowModal;
end;

procedure TfrmIncVendas.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfrmItensVendas, frmItensVendas);
  frmItensVendas.TipoOperacion := toAlterar;
  frmItensVendas.ShowModal;
end;

function TfrmIncVendas.tbStrIsDate(const S: string): boolean;
begin
  try
    StrToDate(S);
    Result := true;
  except
    Result := false;
  end;
end;

function TfrmIncVendas.AlterarPedido: Boolean;
var
  ElementoPedido : TElementosPedido;
begin
  CargaObjeto;
  Pedido.ID := Codigo;
  FPedidoService.Edit(Pedido);
  FDMemPrincipal.First;
  while not FDMemPrincipal.Eof do
  begin
    if FDMemPrincipal.FieldByName('TipoOperacion').AsString = 'E' then
    begin
      ElementoPedido := TElementosPedido.Create;
      try
        ElementoPedido.Pedido        := Codigo;
        ElementoPedido.ID            := FDMemPrincipal.FieldByName('Codigo').AsInteger;
        ElementoPedido.Producto      := FProductoService.Load(FDMemPrincipal.FieldByName('Cod_Producto').AsInteger);
        ElementoPedido.Cantidad      := FDMemPrincipal.FieldByName('Cantidad').AsFloat;
        ElementoPedido.ValorUnitario := FDMemPrincipal.FieldByName('Precio').AsExtended;
        ElementoPedido.ValorTotal    := FDMemPrincipal.FieldByName('PrecioTotal').AsExtended;
        FElementosService.Edit(ElementoPedido);
        FProductoService.ActualizarSaldo(ElementoPedido.Producto.ID, ElementoPedido.Cantidad);
        FDMemPrincipal.Next;
      finally
        ElementoPedido.Free;
      end;
    end
    else
    begin
      ElementoPedido := TElementosPedido.Create;
      try
        ElementoPedido.Pedido        := Codigo;
        ElementoPedido.Producto      := FProductoService.Load(FDMemPrincipal.FieldByName('Cod_Producto').AsInteger);
        ElementoPedido.Cantidad      := FDMemPrincipal.FieldByName('Cantidad').AsFloat;
        ElementoPedido.ValorUnitario := FDMemPrincipal.FieldByName('Precio').AsExtended;
        ElementoPedido.ValorTotal    := FDMemPrincipal.FieldByName('PrecioTotal').AsExtended;
        FElementosService.Insert(ElementoPedido);
        FProductoService.ActualizarSaldo(ElementoPedido.Producto.ID, ElementoPedido.Cantidad);
        FDMemPrincipal.Next;
      finally
        ElementoPedido.Free;
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmIncVendas.btn_salirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIncVendas.btnSalvarClick(Sender: TObject);
var
  confExcl: Integer;
begin
  if Consiste() then
  begin
    confExcl:= Application.MessageBox('� Confirmas la Grabaci�n?','Aten��o',MB_YESNO + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    if confExcl = IDYES then
    begin
      if TipoOperacion = toIncluir then
        IncluiPedido
      else
        AlterarPedido;
      Close;
    end;
  end;
end;

end.
