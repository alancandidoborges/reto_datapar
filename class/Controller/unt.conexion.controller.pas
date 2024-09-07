unit unt.conexion.controller;

interface

uses unt.conexion;

type
  TConexionController = Class
    private
      FConexion: TConexion;
      class var FInstance: TConexionController;
    public
    constructor Create;
    destructor Destroy; override;

    class Function GetInstance: TConexionController;

    property Conexion: TConexion read FConexion;
  end;

implementation

constructor TConexionController.Create;
begin
    FConexion := TConexion.Create;
end;

destructor TConexionController.Destroy;
begin
  FConexion.DisposeOf;
  inherited;
end;

class function TConexionController.GetInstance: TConexionController;
begin
  if not Assigned(self.FInstance) then
    self.FInstance := TConexionController.Create;

  Result := self.FInstance;
end;

end.
