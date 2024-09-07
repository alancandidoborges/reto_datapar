inherited frmRegistroProducto: TfrmRegistroProducto
  Caption = 'frmRegistroProducto'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCenter: TPanel
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 54
      Height = 13
      Caption = 'Descripcion'
    end
    object Label3: TLabel
      Left = 16
      Top = 168
      Width = 29
      Height = 13
      Caption = 'Precio'
    end
    object Label4: TLabel
      Left = 167
      Top = 167
      Width = 43
      Height = 13
      Caption = 'Cantidad'
    end
    object EdtNombre: TEdit
      Left = 16
      Top = 35
      Width = 561
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = EdtNombreKeyPress
    end
    object MemDescripcion: TMemo
      Left = 16
      Top = 81
      Width = 561
      Height = 80
      TabOrder = 1
    end
    object EdtPrecio: TEdit
      Left = 16
      Top = 187
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnKeyPress = EdtNombreKeyPress
    end
    object EdtQuantidad: TEdit
      Left = 167
      Top = 187
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = EdtNombreKeyPress
    end
  end
end
