unit unt.plantilha.consulta.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unt.TipoOperacion.Enum, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPlantilhaConsulta = class(TForm)
    pnTop: TPanel;
    lblNombreBentana: TLabel;
    pnCenter: TPanel;
    pnButton: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    edtLocalizar: TEdit;
    DBGrid1: TDBGrid;
    FDMemPrincipal: TFDMemTable;
    DS_Principal: TDataSource;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnBorrar: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtLocalizarChange(Sender: TObject);
  private
    FstrSql       : string;
    FCodigo       : Integer;
    FNombreVentana: string;
    FCampoCosulta : string;
  public
    property Codigo:        Integer read FCodigo        write FCodigo;
    property NombreVentana: string  read FNombreVentana write FNombreVentana;
    property strSql:        string  read FstrSql        write FstrSql;
    property CampoCosulta:  string  read FCampoCosulta  write FCampoCosulta;

    procedure CadastroShowModal(TipoOperacion: TTipoOperacion; ACodigo: Integer); dynamic; abstract;
    procedure CargaDatos; dynamic; abstract;
    procedure ExcluirRegistro(ACodigo: Integer); dynamic; abstract;
    procedure Alterar; dynamic;
    procedure CrearDataSet;
  end;

var
  frmPlantilhaConsulta: TfrmPlantilhaConsulta;

implementation

{$R *.dfm}

procedure TfrmPlantilhaConsulta.Alterar;
begin
  if (FDMemPrincipal.Active) and (FDMemPrincipal.RecordCount > 0) then
  begin
    Codigo := FDMemPrincipal.FieldByName('ID').AsInteger;
    CadastroShowModal(toAlterar, Codigo);
    CargaDatos;
    FDMemPrincipal.Locate('ID', IntToStr(Codigo), [])
  end;
end;

procedure TfrmPlantilhaConsulta.btnBorrarClick(Sender: TObject);
begin
  if (FDMemPrincipal.Active) and (FDMemPrincipal.RecordCount > 0) then
    ExcluirRegistro(FDMemPrincipal.FieldByName('ID').AsInteger);
end;

procedure TfrmPlantilhaConsulta.btnIncluirClick(Sender: TObject);
begin
  CadastroShowModal(toIncluir, 0);
  CargaDatos();
end;

procedure TfrmPlantilhaConsulta.CrearDataSet;
begin
  FDMemPrincipal.Close;
  FDMemPrincipal.CreateDataSet;
  FDMemPrincipal.Open;
  FDMemPrincipal.EmptyDataSet;
end;

procedure TfrmPlantilhaConsulta.DBGrid1DblClick(Sender: TObject);
begin
  if (FDMemPrincipal.Active) and (FDMemPrincipal.RecordCount <> 0) then
  begin
    CadastroShowModal(toAlterar, FDMemPrincipal.FieldByName('id').AsInteger);
    CargaDatos();
  end;
end;

procedure TfrmPlantilhaConsulta.edtLocalizarChange(Sender: TObject);
begin
  FDMemPrincipal.Filtered := False;
  FDMemPrincipal.FilterOptions := [foCaseInsensitive];
  FDMemPrincipal.Filter :=  CampoCosulta + ' LIKE ' + QuotedStr(edtLocalizar.Text +'%');
  FDMemPrincipal.Filtered := True;
end;

procedure TfrmPlantilhaConsulta.FormActivate(Sender: TObject);
begin
  CargaDatos();
end;

procedure TfrmPlantilhaConsulta.FormShow(Sender: TObject);
begin
  edtLocalizar.Text        := EmptyStr;
  lblNombreBentana.Caption := NombreVentana;
end;

procedure TfrmPlantilhaConsulta.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlantilhaConsulta.SpeedButton2Click(Sender: TObject);
begin
  if (FDMemPrincipal.Active) and (FDMemPrincipal.RecordCount <> 0) then
  begin
    CadastroShowModal(toAlterar, FDMemPrincipal.FieldByName('id').AsInteger);
    CargaDatos();
  end;
end;

procedure TfrmPlantilhaConsulta.SpeedButton3Click(Sender: TObject);
begin
  CargaDatos;
end;

end.
