unit unt.cliente.dao;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, unt.cliente, unt.conexion.controller,
  FireDAC.VCLUI.Wait, FireDAC.FMXUI.Wait, FireDAC.ConsoleUI.Wait;

type
  TClienteDAO = Class
  private
    FQuery: TFDQuery;
    FCliente: TCliente;
    Function BuscaCodigo: Integer;

  public
    function Load(ClienteID: Integer): TCliente; overload;
    function Load: TFDQuery; overload;
    function Insert(ACliente: TCliente): Integer;
    function Edit(ACliente: TCliente): Boolean;
    function Delete(ClienteID: Integer): Boolean;

    Constructor Create;
    Destructor Destroy; override;
  End;

implementation

function TClienteDAO.BuscaCodigo: Integer;
begin
  FQuery.close;
  FQuery.Open('select max(id) as id from Cliente');
  Result := FQuery.FieldByName('id').AsInteger;
end;

constructor TClienteDAO.Create;
begin
  FQuery := TConexionController.GetInstance().Conexion.CrearQuery;
  FCliente := TCliente.Create;
end;

function TClienteDAO.Delete(ClienteID: Integer): Boolean;
begin
  Result := False;
  FQuery.close;
  FQuery.Open('select * from pedido where cliente = ' + ClienteID.ToString);

  if FQuery.RecordCount = 0 then
  begin
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('delete from Cliente where id = ' + ClienteID.ToString);
    FQuery.ExecSQL;
    Result := True;
  end;
end;

destructor TClienteDAO.Destroy;
begin
  inherited;
end;

function TClienteDAO.Edit(ACliente: TCliente): Boolean;
var
  StrSql: string;
begin
  StrSql := 'update Cliente set ';
  StrSql := StrSql + 'VECINDARIO = '         + QuotedStr(ACliente.VECINDARIO) + ', ';
  StrSql := StrSql + 'CODIGOPOSTAL = '       + QuotedStr(ACliente.CODIGOPOSTAL) + ', ';
	StrSql := StrSql + 'CIUDAD = '             + QuotedStr(ACliente.CIUDAD) + ', ';
	StrSql := StrSql + 'CPF ='                 + QuotedStr(ACliente.CPF) + ', ';
	StrSql := StrSql + 'DIRECCION= '           + QuotedStr(ACliente.DIRECCION) + ', ';
	StrSql := StrSql + 'NUMERO = '             + QuotedStr(ACliente.NUMERO) + ', ';
	StrSql := StrSql + 'TELEFONO = '           + QuotedStr(ACliente.TELEFONO) + ', ';
	StrSql := StrSql + 'NOMBRE =  '            + QuotedStr(ACliente.NOMBRE) + ', ';
	StrSql := StrSql + 'CORREOELECTRONICO = '  + QuotedStr(ACliente.CORREOELECTRONICO) ;
  StrSql := StrSql + 'where id = '           + ACliente.ID.ToString;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(StrSql);
  FQuery.ExecSQL;
  Result := True;
end;

function TClienteDAO.Insert(ACliente: TCliente): Integer;
var
  StrSql: string;
begin
  StrSql := 'INSERT INTO CLIENTE(VECINDARIO, CODIGOPOSTAL, CIUDAD, CPF , DIRECCION, NUMERO, TELEFONO, NOMBRE, CORREOELECTRONICO)';
  StrSql := StrSql + ' VALUES( ';
  StrSql := StrSql + QuotedStr(ACliente.VECINDARIO)        + ',';
  StrSql := StrSql + QuotedStr(ACliente.CODIGOPOSTAL)      + ',';
  StrSql := StrSql + QuotedStr(ACliente.CIUDAD)            + ',';
  StrSql := StrSql + QuotedStr(ACliente.CPF)               + ',';
  StrSql := StrSql + QuotedStr(ACliente.DIRECCION)         + ',';
  StrSql := StrSql + QuotedStr(ACliente.NUMERO)            + ',';
  StrSql := StrSql + QuotedStr(ACliente.TELEFONO)          + ',';
  StrSql := StrSql + QuotedStr(ACliente.NOMBRE)            + ',';
  StrSql := StrSql + QuotedStr(ACliente.CORREOELECTRONICO) + ')';

  FQuery.close;
  FQuery.SQL.Clear;
  FQuery.ExecSQL(StrSql);
  Result := BuscaCodigo;
end;

function TClienteDAO.Load: TFDQuery;
begin
  try
    FQuery.Open('select * from Cliente order by id, nombre');
    Result := FQuery;
  finally
  end;
end;

function TClienteDAO.Load(ClienteID: Integer): TCliente;
begin
  try
    FQuery.Open('select * from Cliente where id = :id', [ClienteID]);
    if FQuery.RecordCount <> 0 then
    begin
      FCliente.id                := FQuery.FieldByName('ID').Value;
      FCliente.VECINDARIO        := FQuery.FieldByName('VECINDARIO').Value;
      FCliente.CODIGOPOSTAL      := FQuery.FieldByName('CODIGOPOSTAL').Value;
      FCliente.CIUDAD            := FQuery.FieldByName('CIUDAD').Value;
      FCliente.CPF               := FQuery.FieldByName('CPF').Value;
      FCliente.DIRECCION         := FQuery.FieldByName('DIRECCION').Value;
      FCliente.NUMERO            := FQuery.FieldByName('NUMERO').Value;
      FCliente.TELEFONO          := FQuery.FieldByName('TELEFONO').Value;
      FCliente.NOMBRE            := FQuery.FieldByName('NOMBRE').Value;
      FCliente.CORREOELECTRONICO := FQuery.FieldByName('CORREOELECTRONICO').Value;
      Result := FCliente;
    end;
  finally
    FQuery.Close;
  end;
end;

end.
