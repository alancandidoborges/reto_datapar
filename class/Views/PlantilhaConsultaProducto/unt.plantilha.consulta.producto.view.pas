unit unt.plantilha.consulta.producto.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unt.plantilha.consulta.view, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, unt.producto, unt.producto.service,
  unt.TipoOperacion.Enum;

type
  TfrmPlantilhaConsultaProducto = class(TfrmPlantilhaConsulta)
    FDMemPrincipalID: TFMTBCDField;
    FDMemPrincipalNOMBRE: TStringField;
    FDMemPrincipalDESCRIPCION: TStringField;
    FDMemPrincipalPRECIO: TBCDField;
    FDMemPrincipalCANTIDAD: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDMemPrincipalPRECIOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnBorrarClick(Sender: TObject);
  private
    FProducto       : TFDQuery;
    FProductoService: TProductoService;
  public
    procedure CadastroShowModal(TipoOperacion: TTipoOperacion; ACodigo: Integer); override;
    procedure CargaDatos; override;
    procedure ExcluirRegistro(ACodigo: Integer); override;
  end;

var
  frmPlantilhaConsultaProducto: TfrmPlantilhaConsultaProducto;

implementation

{$R *.dfm}

uses unt.registro.producto.view;


{ TfrmPlantilhaConsultaProducto }

procedure TfrmPlantilhaConsultaProducto.btnBorrarClick(Sender: TObject);
var
  mensagem: String;
begin
  inherited;
  if not FProductoService.Delete(FDMemPrincipal.FieldByName('ID').AsInteger) then
  begin
    mensagem := 'Erro al Eliminar el registro';
    Application.MessageBox(PChar(mensagem), 'Informação', MB_OK + MB_ICONWARNING);
  end;
  CargaDatos;
end;

procedure TfrmPlantilhaConsultaProducto.CadastroShowModal(
  TipoOperacion: TTipoOperacion; ACodigo: Integer);
begin
  inherited;

  if TipoOperacion = toIncluir then
    Codigo := 0;

  if application.FindComponent('frmRegistroProducto') = nil then
        Application.CreateForm(TfrmRegistroProducto, frmRegistroProducto);
  try
    frmRegistroProducto.NombreVentana:= 'Cadastro de Productos';
    frmRegistroProducto.TipoOperacion := TipoOperacion;
    frmRegistroProducto.Codigo := ACodigo;
    frmRegistroProducto.Hide;
    frmRegistroProducto.ShowModal;
    Codigo := frmRegistroProducto.Codigo;
    frmRegistroProducto.show;
  finally
     FreeAndNil(frmRegistroProducto);
  end;

end;

procedure TfrmPlantilhaConsultaProducto.CargaDatos;
begin
  inherited;
  FProducto := FProductoService.Load;
  FProducto.FetchAll;
  FDMemPrincipal.Close;
  FDMemPrincipal.Filter := EmptyStr;
  FDMemPrincipal.Data   := FProducto.Data;
  FDMemPrincipal.Open;
end;

procedure TfrmPlantilhaConsultaProducto.ExcluirRegistro(ACodigo: Integer);
begin
  inherited;
  FProductoService.Delete(ACodigo);
end;

procedure TfrmPlantilhaConsultaProducto.FDMemPrincipalPRECIOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := FormatFloat('###,0.00', Sender.AsFloat);
end;

procedure TfrmPlantilhaConsultaProducto.FormCreate(Sender: TObject);
begin
  inherited;
  FProducto        := TFDQuery.Create(nil);
  FProductoService := TProductoService.Create;
  CampoCosulta     := 'NOMBRE';
end;

procedure TfrmPlantilhaConsultaProducto.FormDestroy(Sender: TObject);
begin
  inherited;
  FProducto.DisposeOf;
  FProductoService.DisposeOf;
end;

procedure TfrmPlantilhaConsultaProducto.FormShow(Sender: TObject);
begin
  NombreVentana := 'Lista de Productos';
  inherited;
end;

end.
