object frmItensVendas: TfrmItensVendas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Elementos de Ventas'
  ClientHeight = 231
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object lblNombreBentana: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 9
      Width = 628
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = 'Elementos de Ventas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnCenter: TPanel
    Left = 0
    Top = 41
    Width = 644
    Height = 118
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Cod.Producto'
    end
    object Label2: TLabel
      Left = 112
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Descricion'
    end
    object Label3: TLabel
      Left = 6
      Top = 60
      Width = 69
      Height = 13
      Caption = 'Precio Unitario'
    end
    object Label4: TLabel
      Left = 112
      Top = 60
      Width = 43
      Height = 13
      Caption = 'Cantidad'
    end
    object Label5: TLabel
      Left = 199
      Top = 60
      Width = 56
      Height = 13
      Caption = 'Precio Total'
    end
    object SpeedButton1: TSpeedButton
      Left = 609
      Top = 30
      Width = 25
      Height = 24
    end
    object EdtCodProducto: TEdit
      Left = 5
      Top = 33
      Width = 101
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = EdtCodProductoExit
      OnKeyPress = EdtCodProductoKeyPress
    end
    object EdtDescricion: TEdit
      Left = 112
      Top = 33
      Width = 491
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = EdtCodProductoKeyPress
    end
    object EdtPrecoUnitario: TEdit
      Left = 5
      Top = 79
      Width = 101
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = EdtCodProductoKeyPress
    end
    object EdtCantidad: TEdit
      Left = 112
      Top = 79
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnExit = EdtCantidadExit
      OnKeyPress = EdtCodProductoKeyPress
    end
    object EdtPrecioTotal: TEdit
      Left = 199
      Top = 79
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnKeyPress = EdtCodProductoKeyPress
    end
  end
  object pnButton: TPanel
    Left = 0
    Top = 159
    Width = 644
    Height = 72
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    object btnSalvar: TSpeedButton
      Left = 480
      Top = 6
      Width = 73
      Height = 57
      Caption = 'Salvar'
      OnClick = btnSalvarClick
    end
    object btnSalir: TSpeedButton
      Left = 559
      Top = 6
      Width = 74
      Height = 57
      Caption = 'Salir'
      OnClick = btnSalirClick
    end
  end
end
