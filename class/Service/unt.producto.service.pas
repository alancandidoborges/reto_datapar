unit unt.Producto.service;

interface

uses
  unt.producto.dao, unt.producto, FireDAC.Comp.Client;

type
  TProductoService = class
    private
      FProductoDao : TProductoDao;
    public
      constructor Create();
      destructor Destroy; override;

      function Load(ProductoID: Integer): TProducto; overload;
      function Load: TFDQuery; overload;
      function Insert(AProducto: TProducto): Integer;
      function Edit(AProducto: TProducto): Boolean;
      function Delete(ProductoID: Integer): Boolean;
      function ConsultaSaldo(ProductoID: Integer): Float32;
      function ActualizarSaldo(ProductoID: Integer; Cantidad: Float32): Float32;
  end;

implementation

function TProductoService.ActualizarSaldo(ProductoID: Integer;
  Cantidad: Float32): Float32;
begin
   Result := FProductoDao.ActualizarSaldo(ProductoID, Cantidad);
end;

function TProductoService.ConsultaSaldo(ProductoID: Integer): Float32;
begin
  Result := FProductoDao.ConsultaSaldo(ProductoID);
end;

constructor TProductoService.Create;
begin
  FProductoDao := TProductoDao.Create;
end;

function TProductoService.Delete(ProductoID: Integer): Boolean;
begin
  Result := FProductoDao.Delete(ProductoID);
end;

destructor TProductoService.Destroy;
begin
  FProductoDao.DisposeOf;
  inherited;
end;

function TProductoService.Edit(AProducto: TProducto): Boolean;
begin
  Result := FProductoDao.Edit(AProducto);
end;

function TProductoService.Insert(AProducto: TProducto): Integer;
begin
  Result := FProductoDao.Insert(AProducto);
end;

function TProductoService.Load(ProductoID: Integer): TProducto;
begin
  Result := FProductoDao.Load(ProductoID);
end;

function TProductoService.Load: TFDQuery;
begin
  Result := FProductoDao.Load;
end;


end.

