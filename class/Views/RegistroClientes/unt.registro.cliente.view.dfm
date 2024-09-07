inherited frmRegistroCliente: TfrmRegistroCliente
  Caption = 'Registro de Clientes'
  ClientHeight = 352
  ClientWidth = 676
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 682
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnTop: TPanel
    Width = 676
    ExplicitWidth = 676
  end
  inherited pnCenter: TPanel
    Width = 676
    Height = 239
    ExplicitWidth = 676
    ExplicitHeight = 239
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 27
      Height = 13
      Caption = 'C.P.F'
    end
    object Label3: TLabel
      Left = 151
      Top = 72
      Width = 42
      Height = 13
      Caption = 'Telefono'
    end
    object Label4: TLabel
      Left = 286
      Top = 72
      Width = 88
      Height = 13
      Caption = 'Correo Electronico'
    end
    object Label5: TLabel
      Left = 16
      Top = 120
      Width = 43
      Height = 13
      Caption = 'Direccion'
    end
    object Label6: TLabel
      Left = 567
      Top = 120
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label7: TLabel
      Left = 16
      Top = 168
      Width = 49
      Height = 13
      Caption = 'Vencidario'
    end
    object Label8: TLabel
      Left = 338
      Top = 168
      Width = 33
      Height = 13
      Caption = 'Ciudad'
    end
    object Label9: TLabel
      Left = 567
      Top = 168
      Width = 65
      Height = 13
      Caption = 'Codigo Postal'
    end
    object edtNombre: TEdit
      Left = 16
      Top = 43
      Width = 641
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edtNombreKeyPress
    end
    object edtCpf: TEdit
      Left = 16
      Top = 91
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyPress = edtNombreKeyPress
    end
    object edtTelefono: TEdit
      Left = 151
      Top = 91
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnKeyPress = edtNombreKeyPress
    end
    object EdtCorreoElectronico: TEdit
      Left = 286
      Top = 91
      Width = 371
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = edtNombreKeyPress
    end
    object edtDirecion: TEdit
      Left = 16
      Top = 139
      Width = 545
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnKeyPress = edtNombreKeyPress
    end
    object EdtNumero: TEdit
      Left = 567
      Top = 139
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      OnKeyPress = edtNombreKeyPress
    end
    object EdtVencidario: TEdit
      Left = 16
      Top = 187
      Width = 316
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
      OnKeyPress = edtNombreKeyPress
    end
    object EdtCiudad: TEdit
      Left = 338
      Top = 187
      Width = 223
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
      OnKeyPress = edtNombreKeyPress
    end
    object EdtCodigoPostal: TEdit
      Left = 567
      Top = 187
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
      OnKeyPress = edtNombreKeyPress
    end
  end
  inherited pnButton: TPanel
    Top = 280
    Width = 676
    ExplicitTop = 280
    ExplicitWidth = 676
    inherited btnGrabar: TSpeedButton
      Left = 259
      ExplicitLeft = 259
    end
    inherited SpeedButton2: TSpeedButton
      Left = 338
      ExplicitLeft = 338
    end
  end
end
