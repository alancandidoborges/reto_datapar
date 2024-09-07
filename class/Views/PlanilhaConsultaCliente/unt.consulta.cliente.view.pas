unit unt.consulta.cliente.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unt.plantilha.consulta.view, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, unt.TipoOperacion.Enum, unt.cliente.service;

type
  TfrmPlantilhaConsultaCliente = class(TfrmPlantilhaConsulta)
    FDMemPrincipalID: TFMTBCDField;
    FDMemPrincipalNOMBRE: TStringField;
    FDMemPrincipalCPF: TStringField;
    FDMemPrincipalTELEFONO: TStringField;
    FDMemPrincipalCORREOELECTRONICO: TStringField;
    FDMemPrincipalDIRECCION: TStringField;
    FDMemPrincipalNUMERO: TStringField;
    FDMemPrincipalVECINDARIO: TStringField;
    FDMemPrincipalCIUDAD: TStringField;
    FDMemPrincipalCODIGOPOSTAL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
  private
    FClentes       : TFDQuery;
    FClienteService: TClienteService;

  public
    procedure CadastroShowModal(TipoOperacion: TTipoOperacion; ACodigo: Integer); override;
    procedure CargaDatos; override;
    procedure ExcluirRegistro(ACodigo: Integer); override;
  end;

var
  frmPlantilhaConsultaCliente: TfrmPlantilhaConsultaCliente;

implementation

{$R *.dfm}

uses unt.registro.cliente.view;

procedure TfrmPlantilhaConsultaCliente.btnBorrarClick(Sender: TObject);
var
  mensagem: String;
begin
  inherited;
  if not FClienteService.Delete(FDMemPrincipal.FieldByName('ID').AsInteger) then
  begin
    mensagem := 'Erro al Eliminar el registro';
    Application.MessageBox(PChar(mensagem), 'Informação', MB_OK + MB_ICONWARNING);
  end;
  CargaDatos;
end;

procedure TfrmPlantilhaConsultaCliente.CadastroShowModal(
  TipoOperacion: TTipoOperacion; ACodigo: Integer);
begin
  inherited;

  if TipoOperacion = toIncluir then
    Codigo := 0;

  if application.FindComponent('frmRegistroCliente') = nil then
      Application.CreateForm(TfrmRegistroCliente, frmRegistroCliente);
  try
    frmRegistroCliente.NombreVentana:= 'Cadastro de Clientes';
    frmRegistroCliente.TipoOperacion := TipoOperacion;
    frmRegistroCliente.Codigo := ACodigo;
    frmRegistroCliente.Hide;
    frmRegistroCliente.ShowModal;
    Codigo := frmRegistroCliente.Codigo;
    frmRegistroCliente.show;
  finally
     FreeAndNil(frmRegistroCliente);
  end;
end;

procedure TfrmPlantilhaConsultaCliente.CargaDatos;
begin
  inherited;
  FClentes := FClienteService.Load;
  FClentes.FetchAll;
  FDMemPrincipal.Close;
  FDMemPrincipal.Filter := EmptyStr;
  FDMemPrincipal.Data   := FClentes.Data;
  FDMemPrincipal.Open;
end;

procedure TfrmPlantilhaConsultaCliente.ExcluirRegistro(ACodigo: Integer);
begin
  inherited;
  FClienteService.Delete(ACodigo);
end;

procedure TfrmPlantilhaConsultaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FClentes        := TFDQuery.Create(nil);
  FClienteService := TClienteService.Create;
  CampoCosulta    := 'NOMBRE';
end;

procedure TfrmPlantilhaConsultaCliente.FormDestroy(Sender: TObject);
begin
  inherited;
  FClentes.DisposeOf;
  FClienteService.DisposeOf;
end;

procedure TfrmPlantilhaConsultaCliente.FormShow(Sender: TObject);
begin
  NombreVentana := 'Lista de Clientes';
  inherited;
end;

end.
