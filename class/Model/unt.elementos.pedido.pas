unit unt.elementos.pedido;

interface

uses unt.producto;

type
  TElementosPedido = class
    private
      FProducto     : TProducto;
      FValorUnitario: Extended;
      FID           : Integer;
      FValorTotal   : Extended;
      FCantidad     : Extended;
      FPedido       : Integer;
    public
      property ID           : Integer   read FID            write FID;
      property Pedido       : Integer   read FPedido        write FPedido;
      property Producto     : TProducto read FProducto      write FProducto;
      property Cantidad     : Extended  read FCantidad      write FCantidad;
      property ValorUnitario: Extended  read FValorUnitario write FValorUnitario;
      property ValorTotal   : Extended  read FValorTotal    write FValorTotal;

      constructor Create;
      destructor Destroy; override;
  end;

implementation



{ TElementosPedido }

constructor TElementosPedido.Create;
begin
  Producto := TProducto.Create;
end;

destructor TElementosPedido.Destroy;
begin
  Producto.DisposeOf;
  inherited;
end;

end.
