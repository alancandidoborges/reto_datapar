unit unt.producto;

interface

type
  TProducto = class
    private
    FPrecio     : Extended;
    FID         : Integer;
    FCantidad   : Extended;
    FNombre     : String;
    FDescripcion: String;
    public
       property ID         : Integer   read  FID           write FID;
       property Nombre     : String    read  FNombre       write FNombre;
       property Descripcion: String    read  FDescripcion  write FDescripcion;
       property Precio     : Extended  read  FPrecio       write FPrecio;
       property Cantidad   : Extended  read  FCantidad     write FCantidad;
  end;

implementation

end.
