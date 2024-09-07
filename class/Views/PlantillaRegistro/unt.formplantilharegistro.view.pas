unit unt.formplantilharegistro.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unt.TipoOperacion.Enum, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmPlantilhaRegistro = class(TForm)
    pnTop: TPanel;
    pnCenter: TPanel;
    pnButton: TPanel;
    btnGrabar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lblNombreBentana: TLabel;
    procedure btnGrabarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FCodigo       : Integer;
    FNombreVentana: String;
    FTipoOperacion: TTipoOperacion;
  public
    property Codigo       : Integer        read FCodigo        write FCodigo;
    property TipoOperacion: TTipoOperacion read FTipoOperacion write FTipoOperacion;
    property NombreVentana: String         read FNombreVentana write FNombreVentana;

    function  Grabar     : Integer; virtual; abstract;
    function  Consiste   : Boolean; virtual; abstract;
    function  CargarDatos: Boolean; virtual; abstract;
    procedure CargarObjeto;         virtual; abstract;

    procedure LimpiaTela;
  end;

var
  frmPlantilhaRegistro: TfrmPlantilhaRegistro;

implementation

{$R *.dfm}

procedure TfrmPlantilhaRegistro.FormActivate(Sender: TObject);
begin
  lblNombreBentana.Caption := NombreVentana;
end;

procedure TfrmPlantilhaRegistro.FormShow(Sender: TObject);
begin
  LimpiaTela();
  CargarDatos();
end;

procedure TfrmPlantilhaRegistro.LimpiaTela;
var
  i : Integer;
begin
  for i := 0 to Self.ControlCount - 1 do
  begin
    if Self.Controls[i] is TEdit then
      (Self.Controls[i] as TEdit).Clear
    else
    if Self.Controls[i] is TComboBox then
      (Self.Controls[i] as TComboBox).ItemIndex := -1
    else
    if Self.Controls[i] is TRadioGroup then
      (Self.Controls[i] as TRadioGroup).ItemIndex := -1
    else
    if Self.Controls[i] is TCheckBox then
      (Self.Controls[i] as TCheckBox).Checked := False
    else
    if Self.Controls[i] is TMaskEdit then
      (Self.Controls[i] as TMaskEdit).Clear;
  end;
end;

procedure TfrmPlantilhaRegistro.btnGrabarClick(Sender: TObject);
var
  confExcl: Integer;
begin
  if Consiste() then
  begin
    confExcl:= Application.MessageBox('� Confirmas la Grabaci�n?','Aten��o',MB_YESNO + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    if confExcl = IDYES then
    begin
      CargarObjeto();
      Grabar();
    end;
  end;
end;

procedure TfrmPlantilhaRegistro.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.
