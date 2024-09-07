unit unt.pedido.dao;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, unt.Pedido, unt.conexion.controller,
  FireDAC.VCLUI.Wait, FireDAC.FMXUI.Wait, FireDAC.ConsoleUI.Wait,
  unt.elementos.pedido.service, unt.cliente.service;

type
  TPedidoDAO = Class
  private
    FQuery: TFDQuery;
    FPedido: TPedido;
    FElementosPedidoService: TElementosPedidoService;
    FClienteService        : TClienteService;
    Function BuscaCodigo: Integer;

  public
    function Load(PedidoID: Integer): TPedido; overload;
    function Load: TFDQuery; overload;
    function LoadGrid: TFDQuery;
    function Insert(APedido: TPedido): Integer;
    function Edit(APedido: TPedido): Boolean;
    function Delete(PedidoID: Integer): Boolean;

    Constructor Create;
    Destructor Destroy; override;
  End;

implementation

function TPedidoDAO.BuscaCodigo: Integer;
begin
  FQuery.close;
  FQuery.Open('select max(id) as id from Pedido');
  Result := FQuery.FieldByName('id').AsInteger;
end;

constructor TPedidoDAO.Create;
begin
  FQuery := TConexionController.GetInstance().Conexion.CrearQuery;
  FElementosPedidoService := TElementosPedidoService.Create;
  FClienteService         := TClienteService.Create;
  FPedido                 := TPedido.Create;
end;

function TPedidoDAO.Delete(PedidoID: Integer): Boolean;
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('delete from Pedido where id = ' + PedidoID.ToString);
  FQuery.ExecSQL;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('delete from elementospedido where pedido = ' + PedidoID.ToString);
  FQuery.ExecSQL;
  Result := True;
end;

destructor TPedidoDAO.Destroy;
begin
  FQuery.Close;
  FQuery := nil;;
  FQuery.DisposeOf;
  FPedido.DisposeOf;
  FElementosPedidoService.DisposeOf;
  FClienteService.DisposeOf;
  inherited;
end;

function TPedidoDAO.Edit(APedido: TPedido): Boolean;
var
  StrSql: string;
begin
  StrSql := 'update Pedido set ';
  StrSql := StrSql + ' Cliente = '      + APedido.Cliente.ID.ToString + ', ';
  StrSql := StrSql + ' Valor_Total = '  + FloatToStr(APedido.ValorTotal) + ', ';
	StrSql := StrSql + ' data_entrega = TO_DATE(' + QuotedStr(FormatDateTime('yyyy-mm-dd', APedido.Data_Entrega))+ ', ' + QuotedStr('YYYY-MM-DD') + ')';
  StrSql := StrSql + ' where id = '     + APedido.ID.ToString;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(StrSql);
  FQuery.ExecSQL;
  Result := True;
end;

function TPedidoDAO.Insert(APedido: TPedido): Integer;
var
  StrSql: string;
begin
  StrSql := 'INSERT INTO Pedido(cliente, valor_total, data_entrega, data_inc)';
  StrSql := StrSql + ' VALUES(';
  StrSql := StrSql + APedido.Cliente.ID.ToString + ',';
  StrSql := StrSql + FloatToStr(APedido.ValorTotal)      + ',';
  StrSql := StrSql + ' TO_DATE(' + QuotedStr(FormatDateTime('yyyy-mm-dd', APedido.Data_Entrega))+ ', ' + QuotedStr('YYYY-MM-DD') + '), ' ;
  StrSql := StrSql + ' TO_DATE(' + QuotedStr(FormatDateTime('yyyy-mm-dd', Date()))+ ', ' + QuotedStr('YYYY-MM-DD') + '))' ;
  FQuery.close;
  FQuery.SQL.Clear;
  FQuery.ExecSQL(StrSql);
  Result := BuscaCodigo;
end;

function TPedidoDAO.Load: TFDQuery;
begin
  try
    FQuery.Open('select * from Pedido order by id');
    Result := FQuery;
  finally
  end;
end;

function TPedidoDAO.LoadGrid: TFDQuery;
var
  StrSql: String;
begin
  StrSql := 'select pedido.id, cliente.id as codigocli, cliente.nombre, pedido.data_entrega, pedido.data_inc, pedido.valor_total';
  StrSql := StrSql + ' from pedido pedido, cliente cliente';
  StrSql := StrSql + ' where pedido.cliente = cliente.id';
  FQuery.Open(StrSql);
  Result := FQuery;
end;

function TPedidoDAO.Load(PedidoID: Integer): TPedido;
begin
  try
    FQuery.Open('select * from Pedido where id = :id', [PedidoID]);
    if FQuery.RecordCount <> 0 then
    begin
      FPedido.ID            := FQuery.FieldByName('ID').Value;
      FPedido.Cliente       := FClienteService.Load(FQuery.FieldByName('Cliente').Value);
      FPedido.ValorTotal    := FQuery.FieldByName('Valor_Total').Value;
      FPedido.Data_Entrega  := FQuery.FieldByName('Data_Entrega').Value;
      FPedido.Data_Inc      := FQuery.FieldByName('Data_Inc').Value;
      FPedido.Elementos     := FElementosPedidoService.LoadByPedido(PedidoID);
      Result := FPedido;
    end;
  finally
    FQuery.Close;
  end;
end;
end.
