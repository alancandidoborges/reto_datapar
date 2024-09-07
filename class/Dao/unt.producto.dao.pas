unit unt.producto.dao;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, unt.Producto, unt.conexion.controller,
  FireDAC.VCLUI.Wait, FireDAC.FMXUI.Wait, FireDAC.ConsoleUI.Wait;

type
  TProductoDAO = Class
  private
    FQuery: TFDQuery;
    FProducto: TProducto;
    Function BuscaCodigo: Integer;

  public
    function Load(ProductoID: Integer): TProducto; overload;
    function Load: TFDQuery; overload;
    function Insert(AProducto: TProducto): Integer;
    function Edit(AProducto: TProducto): Boolean;
    function Delete(ProductoID: Integer): Boolean;
    function ConsultaSaldo(ProductoID: Integer): Float32;
    function ActualizarSaldo(ProductoID: Integer; Cantidad: Float32): Float32;

    Constructor Create;
    Destructor Destroy; override;
  End;

implementation

function TProductoDAO.ActualizarSaldo(ProductoID: Integer; Cantidad: Float32): Float32;
var
  CantidadActual: Float32;
  StrSql        : String;
begin
  CantidadActual := 0;
  CantidadActual := ConsultaSaldo(ProductoID);

  StrSql := 'update producto set ';
  StrSql := StrSql + 'CANTIDAD ='     + FloatToStr(CantidadActual - Cantidad);
  StrSql := StrSql + ' where id = '    + ProductoID.ToString;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(StrSql);
  FQuery.ExecSQL;
  Result := CantidadActual - Cantidad;
end;

function TProductoDAO.BuscaCodigo: Integer;
begin
  FQuery.close;
  FQuery.Open('select max(id) as id from producto');
  Result := FQuery.FieldByName('id').AsInteger;
end;

function TProductoDAO.ConsultaSaldo(ProductoID: Integer): Float32;
begin
  FQuery.close;
  FQuery.Open('select Sum(Cantidad) Saldo from producto where id = ' + ProductoID.ToString);
  Result := FQuery.FieldByName('Saldo').AsInteger;
end;

constructor TProductoDAO.Create;
begin
  FQuery := TConexionController.GetInstance().Conexion.CrearQuery;
  FProducto := TProducto.Create;
end;

function TProductoDAO.Delete(ProductoID: Integer): Boolean;
begin
  Result := False;
  FQuery.close;
  FQuery.Open('select * from elementospedido where cod_producto = ' + ProductoID.ToString);

  if FQuery.RecordCount = 0 then
  begin
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('delete from producto where id = ' + ProductoID.ToString);
    FQuery.ExecSQL;
    Result := False;
  end;
end;

destructor TProductoDAO.Destroy;
begin
  inherited;
end;

function TProductoDAO.Edit(AProducto: TProducto): Boolean;
var
  StrSql: string;
begin
  StrSql := 'update producto set ';
  StrSql := StrSql + 'NOMBRE = '      + QuotedStr(AProducto.NOMBRE)      + ', ';
  StrSql := StrSql + 'DESCRIPCION = ' + QuotedStr(AProducto.DESCRIPCION) + ', ';
	StrSql := StrSql + 'PRECIO = '      + FloatToStr(AProducto.PRECIO)     + ', ';
	StrSql := StrSql + 'CANTIDAD ='     + FloatToStr(AProducto.CANTIDAD);
  StrSql := StrSql + 'where id = '    + AProducto.ID.ToString;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(StrSql);
  FQuery.ExecSQL;
  Result := True;
end;

function TProductoDAO.Insert(AProducto: TProducto): Integer;
var
  StrSql: string;
begin
  StrSql := 'INSERT INTO producto(NOMBRE, DESCRIPCION, PRECIO, CANTIDAD)';
  StrSql := StrSql + 'VALUES( ';
  StrSql := StrSql + QuotedStr(AProducto.NOMBRE)      + ', ';
  StrSql := StrSql + QuotedStr(AProducto.DESCRIPCION) + ', ';
  StrSql := StrSql + FloatToStr(AProducto.PRECIO)     + ', ';
  StrSql := StrSql + FloatToStr(AProducto.CANTIDAD)   + ')';

  FQuery.close;
  FQuery.SQL.Clear;
  FQuery.ExecSQL(StrSql);
  Result := BuscaCodigo();
end;

function TProductoDAO.Load: TFDQuery;
begin
  FQuery.Open('select * from producto order by id, nombre');
  Result := FQuery;
end;

function TProductoDAO.Load(ProductoID: Integer): TProducto;
begin
  try
    FQuery.Open('select * from producto where id = :id', [ProductoID]);
    if FQuery.RecordCount <> 0 then
    begin
      FProducto.id          := FQuery.FieldByName('ID').Value;
      FProducto.NOMBRE      := FQuery.FieldByName('NOMBRE').Value;
      FProducto.DESCRIPCION := FQuery.FieldByName('DESCRIPCION').Value;
      FProducto.PRECIO      := FQuery.FieldByName('PRECIO').Value;
      FProducto.CANTIDAD    := FQuery.FieldByName('CANTIDAD').Value;
      Result := FProducto;
    end;
  finally
    FQuery.Close;
  end;
end;
end.
