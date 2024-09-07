unit unt.registro.cliente.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unt.formplantilharegistro.view,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, unt.cliente, unt.cliente.service;

type
  TfrmRegistroCliente = class(TfrmPlantilhaRegistro)
    Label1: TLabel;
    edtNombre: TEdit;
    Label2: TLabel;
    edtCpf: TEdit;
    Label3: TLabel;
    edtTelefono: TEdit;
    Label4: TLabel;
    EdtCorreoElectronico: TEdit;
    Label5: TLabel;
    edtDirecion: TEdit;
    EdtNumero: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdtVencidario: TEdit;
    Label8: TLabel;
    EdtCiudad: TEdit;
    Label9: TLabel;
    EdtCodigoPostal: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtNombreKeyPress(Sender: TObject; var Key: Char);
  private
    FCliente      : TCliente;
    ClienteService: TClienteService;
  public
    function Grabar     : Integer; override;
    function Consiste   : Boolean; override;
    function CargarDatos: Boolean; override;

    procedure CargarObjeto; override;
    property Cliente: TCliente read FCliente write FCliente;
  end;

var
  frmRegistroCliente: TfrmRegistroCliente;

implementation

{$R *.dfm}

uses unt.TipoOperacion.Enum;


function TfrmRegistroCliente.CargarDatos: Boolean;
begin
  Result := false;
  if TipoOperacion = toAlterar then
  begin
    Cliente := ClienteService.Load(Codigo);
    if Assigned(Cliente) then
    begin
      edtNombre.Text            := Cliente.Nombre;
      edtCpf.Text               := Cliente.CPF;
      edtTelefono.Text          := Cliente.Telefono;
      EdtCorreoElectronico.Text := Cliente.CorreoElectronico;
      edtDirecion.Text          := Cliente.Direccion;
      EdtNumero.Text            := Cliente.Numero;
      EdtVencidario.Text        := Cliente.Vecindario;
      EdtCiudad.Text            := Cliente.Ciudad;
      EdtCodigoPostal.Text      := Cliente.CodigoPostal;
      Result := True;
    end
    else
    begin
      Result := false;
      Close;
    end;
  end;
end;

procedure TfrmRegistroCliente.CargarObjeto;
begin
  inherited;
  Cliente.Nombre            :=  EdtNombre.Text;
  Cliente.CPF               :=  EdtCpf.Text;
  Cliente.Telefono          :=  EdtTelefono.Text;
  Cliente.CorreoElectronico :=  EdtCorreoElectronico.Text;
  Cliente.Direccion         :=  edtDirecion.Text;
  Cliente.Numero            :=  EdtNumero.Text;
  Cliente.Vecindario        :=  EdtVencidario.Text;
  Cliente.Ciudad            :=  EdtCiudad.Text;
  Cliente.CodigoPostal      :=  EdtCodigoPostal.Text;
end;

function TfrmRegistroCliente.Consiste: Boolean;
var
  mensagem: String;
begin
  Result := True;
  if trim(edtNombre.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Nombre] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    edtNombre.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(edtCpf.Text) = EmptyStr then
  begin
    mensagem := 'El campo [C.P.F] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    edtCpf.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(edtTelefono.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Telefono] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    edtTelefono.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(EdtCorreoElectronico.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Correo Electronico] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtCorreoElectronico.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(edtDirecion.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Direccion] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    edtDirecion.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(EdtNumero.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Numero] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtNumero.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(EdtVencidario.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Vencidario] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtVencidario.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(EdtCiudad.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Ciudad] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtCiudad.SetFocus;
    Result := False;
    Abort;
  end;

  if trim(EdtCodigoPostal.Text) = EmptyStr then
  begin
    mensagem := 'El campo [Codigo Postal] no debe estar vac�o.';
    Application.MessageBox(PChar(mensagem), 'Informaci�n', MB_OK + MB_ICONWARNING);
    EdtCodigoPostal.SetFocus;
    Result := False;
    Abort;
  end;

end;

procedure TfrmRegistroCliente.edtNombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    SelectNext(TWinControl(Sender), True, True);
end;

procedure TfrmRegistroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  Cliente        := TCliente.Create;
  ClienteService := TClienteService.Create;
end;

procedure TfrmRegistroCliente.FormDestroy(Sender: TObject);
begin
  inherited;
  ClienteService.DisposeOf;
end;

function TfrmRegistroCliente.Grabar: Integer;
begin
   inherited;
   if TipoOperacion = toIncluir then
     Result := ClienteService.Insert(Cliente)
   else
   begin
     Cliente.ID := Codigo;
     ClienteService.Edit(Cliente);
     Result := Cliente.ID;
   end;
   Close;
end;

end.
