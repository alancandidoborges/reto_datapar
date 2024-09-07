unit unt.pedido;

interface

uses unt.elementos.pedido, Generics.Collections, unt.cliente;

type
  TPedido = class
  private
    FID          : Integer;
    FElementos   : TObjectList<TElementosPedido>;
    FValorTotal  : Extended;
    FValor_Total : Extended;
    FCliente     : TCliente;
    FData_Entrega: TDate;
    FData_Inc    : TDate;
  public
    property ID           : Integer  read FID           write FID;
    property ValorTotal   : Extended read FValorTotal   write FValorTotal;
    property Cliente      : TCliente read FCliente      write FCliente;
    property Valor_Total  : Extended read FValor_Total  write FValor_Total;
    property Data_Entrega : TDate    read FData_Entrega write FData_Entrega;
    property Data_Inc     : TDate    read FData_Inc     write FData_Inc;
    property Elementos  : TObjectList<TElementosPedido> read FElementos  write FElementos;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

constructor TPedido.Create;
begin
  Cliente := TCliente.Create;
  FElementos := TObjectList<TElementosPedido>.Create;
end;

destructor TPedido.Destroy;
begin
  Elementos.Clear;
  Elementos.DisposeOf;
  Cliente.DisposeOf;
  inherited;
end;

end.
