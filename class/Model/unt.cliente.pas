unit unt.cliente;

interface

type
  TCliente = class
  private
    FID               : Integer;
    FVecindario       : String;
    FCodigoPostal     : String;
    FCiudad           : String;
    FCPF              : String;
    FDireccion        :  String;
    FNumero           : String;
    FTelefono         : String;
    FNombre           : String;
    FCorreoElectronico: String;
  public
      property ID                : Integer read FID                write FID;
      property Nombre            : String  read FNombre            write FNombre;
      property CPF               : String  read FCPF               write FCPF;
      property Direccion         : String  read FDireccion         write FDireccion;
      property Numero            : String  read FNumero            write  FNumero;
      property Vecindario        : String  read FVecindario        write FVecindario;
      property Ciudad            : String  read FCiudad            write FCiudad;
      property CodigoPostal      : String  read FCodigoPostal      write FCodigoPostal;
      property Telefono          : String  read FTelefono          write FTelefono;
      property CorreoElectronico : String  read FCorreoElectronico write FCorreoElectronico;
  end;

implementation

{ TClieente }
end.
