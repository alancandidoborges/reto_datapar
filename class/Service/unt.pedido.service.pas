unit unt.pedido.service;

interface

uses
  unt.pedido.dao, unt.Pedido, FireDAC.Comp.Client;

type
  TPedidoService = class
  private
    FPedidoDao : TPedidoDao;
  public
    constructor Create();
    destructor Destroy; override;

    function Load(APedido: Integer): TPedido; overload;
    function Load: TFDQuery; overload;
    function Insert(APedido: TPedido): Integer;
    function Edit(APedido: TPedido): Boolean;
    function Delete(APedidoID: Integer): Boolean;
    function LoadGrid: TFDQuery;
  end;

implementation

constructor TPedidoService.Create;
begin
  FPedidoDao := TPedidoDao.Create;
end;

function TPedidoService.Delete(APedidoID: Integer): Boolean;
begin
  Result := FPedidoDao.Delete(APedidoID);
end;

destructor TPedidoService.Destroy;
begin
  FPedidoDao.DisposeOf;
  inherited;
end;

function TPedidoService.Edit(APedido: TPedido): Boolean;
begin
  Result := FPedidoDao.Edit(APedido);
end;

function TPedidoService.Insert(APedido: TPedido): Integer;
begin
  Result := FPedidoDao.Insert(APedido);
end;

function TPedidoService.Load(APedido: Integer): TPedido;
begin
  Result := FPedidoDao.Load(APedido);
end;

function TPedidoService.Load: TFDQuery;
begin
  Result := FPedidoDao.Load;
end;

function TPedidoService.LoadGrid: TFDQuery;
begin
  Result := FPedidoDao.LoadGrid;
end;

end.
