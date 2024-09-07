unit unt.conexion;

interface

uses
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.Oracle, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RTTI, Datasnap.DBClient,
  IniFiles, SysUtils;

type TConexion = Class
  private
    FDiver : TFDPhysOracleDriverLink;
    FConn  : TFDConnection;
    procedure ConfigurarConexion;
  public
    constructor Create;
    destructor Destroy; override;

    function getConn: TFDConnection;
    function CrearQuery: TFDQuery;
  end;

implementation

constructor TConexion.Create;
begin
  FDiver := TFDPhysOracleDriverLink.Create(nil);
  FConn := TFDConnection.Create(nil);
  ConfigurarConexion;
  FConn.Connected := True;
end;

destructor TConexion.Destroy;
begin
  FConn.Connected := False;
  FConn.DisposeOf;
  FDiver.DisposeOf;
  inherited;
end;

procedure TConexion.ConfigurarConexion;
var
  Configura: TiniFile;
  IP,Dirservidor, Usuario, Senha, DBName, VendorLib: String;
  Puerta: Integer ;
begin
  Dirservidor := getcurrentDir;
  Configura   := TIniFile.Create( Dirservidor + '\Datapar.INI' );
  IP          := Configura.ReadString('Servidor', 'ipservidor', 'localhost');
  Puerta      := Configura.ReadInteger('Servidor','PortaServidor', 1521);
  DBName      := Configura.ReadString('Servidor','DBName', 'XEPDB1');
  Usuario     := Configura.ReadString('Servidor', 'Usuario','root');
  Senha       := Configura.ReadString('Servidor', 'Senha', 'password');
  VendorLib   := Configura.ReadString('Servidor', 'VendorLib', 'C:\Test_Datapar\Dll\oci.dll');

  FDiver.VendorLib      := VendorLib;
  FConn.Params.DriverID := 'Ora';
  FConn.Params.Database := IP + ':' + Puerta.ToString + '/' + DBName;
  FConn.Params.UserName := Usuario;
  FConn.Params.Password := Senha;
  FConn.LoginPrompt     := False;
end;

function TConexion.CrearQuery: TFDQuery;
var
  vQuery: TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := FConn;
  Result := vQuery;
end;

function TConexion.getConn: TFDConnection;
begin
  Result := FConn;
end;

end.
