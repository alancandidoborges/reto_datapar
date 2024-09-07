unit unt.cliente.service;

interface

uses
  unt.cliente.dao, unt.cliente, FireDAC.Comp.Client;

type
  TClienteService = class
    private
      FClienteDao : TClienteDao;
    public
      constructor Create();
      destructor Destroy; override;

      function Load(ACliente: Integer): TCliente; overload;
      function Load: TFDQuery; overload;
      function Insert(ACliente: TCliente): Integer;
      function Edit(ACliente: TCliente): Boolean;
      function Delete(AClienteID: Integer): Boolean;
  end;

implementation

constructor TClienteService.Create;
begin
  FClienteDao := TClienteDao.Create;
end;

function TClienteService.Delete(AClienteID: Integer): Boolean;
begin
  Result := FClienteDao.Delete(AClienteID);
end;

destructor TClienteService.Destroy;
begin
  FClienteDao.DisposeOf;
  inherited;
end;

function TClienteService.Edit(ACliente: TCliente): Boolean;
begin
  Result := FClienteDao.Edit(ACliente);
end;

function TClienteService.Insert(ACliente: TCliente): Integer;
begin
  Result := FClienteDao.Insert(ACliente);
end;

function TClienteService.Load(ACliente: Integer): TCliente;
begin
  Result := FClienteDao.Load(ACliente);
end;

function TClienteService.Load: TFDQuery;
begin
  Result := FClienteDao.Load;
end;


end.
