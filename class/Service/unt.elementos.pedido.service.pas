unit unt.elementos.pedido.service;

interface

uses
  FireDAC.Comp.Client, unt.elementos.pedido.dao, unt.elementos.pedido,
  Generics.Collections;

type
  TElementosPedidoService = class
    private
      FElementosPedidoDao : TElementosPedidoDao;
    public
      constructor Create();
      destructor Destroy; override;

      function Load(AElementosPedido: Integer): TElementosPedido; overload;
      function Load: TFDQuery; overload;
      function LoadGrid(APedido: Integer): TFDQuery;
      function Insert(AElementosPedido: TElementosPedido): Integer;
      function Edit(AElementosPedido: TElementosPedido): Boolean;
      function Delete(AElementosPedidoID: Integer): Boolean;
      function LoadByPedido(PedidoID: Integer): TObjectList<TElementosPedido>;
  end;

implementation

constructor TElementosPedidoService.Create;
begin
  FElementosPedidoDao := TElementosPedidoDao.Create;
end;

function TElementosPedidoService.Delete(AElementosPedidoID: Integer): Boolean;
begin
  Result := FElementosPedidoDao.Delete(AElementosPedidoID);
end;

destructor TElementosPedidoService.Destroy;
begin
  FElementosPedidoDao.DisposeOf;
  inherited;
end;

function TElementosPedidoService.Edit(AElementosPedido: TElementosPedido): Boolean;
begin
  Result := FElementosPedidoDao.Edit(AElementosPedido);
end;

function TElementosPedidoService.Insert(AElementosPedido: TElementosPedido): Integer;
begin
  Result := FElementosPedidoDao.Insert(AElementosPedido);
end;

function TElementosPedidoService.Load(AElementosPedido: Integer): TElementosPedido;
begin
  Result := FElementosPedidoDao.Load(AElementosPedido);
end;

function TElementosPedidoService.Load: TFDQuery;
begin
  Result := FElementosPedidoDao.Load;
end;

function TElementosPedidoService.LoadByPedido(PedidoID: Integer): TObjectList<TElementosPedido>;
begin
  Result := FElementosPedidoDao.LoadByPedido(PedidoID);
end;

function TElementosPedidoService.LoadGrid(APedido: Integer): TFDQuery;
begin
  Result := FElementosPedidoDao.LoadGrid(APedido);
end;

end.
