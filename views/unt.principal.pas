unit unt.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Phys.OracleDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Data.DBXOracle, Data.SqlExpr, Vcl.Buttons,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, unt.vendas.view;

type
  TfrmPrincipal = class(TForm)
    btnRegistroCliente: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btn_vendas: TSpeedButton;
    btnSalir: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRegistroClienteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_vendasClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unt.conexion.controller, unt.consulta.cliente.view,
  unt.plantilha.consulta.producto.view;

procedure TfrmPrincipal.btnRegistroClienteClick(Sender: TObject);
begin
  if application.FindComponent('frmPlantilhaConsultaCliente') = nil then
    Application.CreateForm(TfrmPlantilhaConsultaCliente, frmPlantilhaConsultaCliente);
  try
    frmPlantilhaConsultaCliente.ShowModal;
  finally
    frmPlantilhaConsultaCliente.DisposeOf;
  end;
end;

procedure TfrmPrincipal.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btn_vendasClick(Sender: TObject);
begin
  if application.FindComponent('frmVendas') = nil then
    Application.CreateForm(TfrmVendas, frmVendas);
  try
    frmVendas.ShowModal;
  finally
    frmVendas.DisposeOf;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TConexionController.GetInstance();
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  TConexionController.GetInstance().Destroy();
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  if application.FindComponent('frmPlantilhaConsultaProducto') = nil then
    Application.CreateForm(TfrmPlantilhaConsultaProducto, frmPlantilhaConsultaProducto);
  try
    frmPlantilhaConsultaProducto.ShowModal;
  finally
    frmPlantilhaConsultaProducto.DisposeOf;
  end;
end;

end.
