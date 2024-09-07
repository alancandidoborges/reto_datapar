object frmIncVendas: TfrmIncVendas
  Left = 0
  Top = 0
  Caption = 'Inclusi'#243'n de Ventas'
  ClientHeight = 352
  ClientWidth = 617
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
  object pnCenter: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 65
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 143
      Top = 13
      Width = 73
      Height = 13
      Caption = 'Nombre Cliente'
    end
    object Label3: TLabel
      Left = 471
      Top = 13
      Width = 77
      Height = 13
      Caption = 'Fecha - Entrega'
    end
    object EdtCliente: TEdit
      Left = 16
      Top = 33
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = EdtClienteExit
      OnKeyPress = EdtClienteKeyPress
    end
    object EdtNombreCliente: TEdit
      Left = 143
      Top = 33
      Width = 322
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = EdtClienteKeyPress
    end
    object EdtDataEntrega: TMaskEdit
      Left = 471
      Top = 33
      Width = 120
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 617
    Height = 218
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 613
      Height = 214
      Align = alClient
      DataSource = DS_Principal
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_VENDA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODIGO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_PRODUCTO'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 286
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIOTOTAL'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TipoOperacion'
          Visible = False
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 283
    Width = 617
    Height = 36
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 2
      Top = 2
      Width = 65
      Height = 32
      Align = alLeft
      Caption = 'Incluir'
      OnClick = SpeedButton1Click
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 29
    end
    object SpeedButton3: TSpeedButton
      Left = 67
      Top = 2
      Width = 65
      Height = 32
      Align = alLeft
      Caption = 'Alterar'
      OnClick = SpeedButton3Click
      ExplicitLeft = 68
      ExplicitTop = 4
      ExplicitHeight = 29
    end
    object SpeedButton4: TSpeedButton
      Left = 132
      Top = 2
      Width = 65
      Height = 32
      Align = alLeft
      Caption = 'Excluir'
      ExplicitTop = 4
      ExplicitHeight = 29
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 319
    Width = 617
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 3
    object btn_salir: TSpeedButton
      Left = 541
      Top = 2
      Width = 74
      Height = 29
      Align = alRight
      Caption = 'Salir'
      OnClick = btn_salirClick
      ExplicitLeft = 539
      ExplicitTop = 6
      ExplicitHeight = 27
    end
    object btnSalvar: TSpeedButton
      Left = 476
      Top = 2
      Width = 65
      Height = 29
      Align = alRight
      Caption = 'Salvar'
      OnClick = btnSalvarClick
      ExplicitLeft = 468
      ExplicitTop = 6
      ExplicitHeight = 27
    end
  end
  object FDMemPrincipal: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 145
    object FDMemPrincipalCOD_VENDA: TFMTBCDField
      FieldName = 'COD_VENDA'
      Origin = 'COD_VENDA'
      Visible = False
      Precision = 38
      Size = 38
    end
    object FDMemPrincipalCODIGO: TFMTBCDField
      DisplayLabel = 'N'#186'  Controle'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Precision = 38
      Size = 0
    end
    object FDMemPrincipalCOD_PRODUCTO: TFMTBCDField
      DisplayLabel = 'Cod.Producto'
      FieldName = 'COD_PRODUCTO'
      Origin = 'COD_PRODUCTO'
      Precision = 38
      Size = 0
    end
    object FDMemPrincipalDESCRIPCION: TStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      Size = 255
    end
    object FDMemPrincipalCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
    end
    object FDMemPrincipalPRECIO: TBCDField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'PRECIO'
      OnGetText = FDMemPrincipalPRECIOGetText
      Precision = 16
      Size = 2
    end
    object FDMemPrincipalPRECIOTOTAL: TBCDField
      DisplayLabel = 'Precio Total'
      FieldName = 'PRECIOTOTAL'
      Origin = 'PRECIOTOTAL'
      OnGetText = FDMemPrincipalPRECIOTOTALGetText
      Precision = 16
      Size = 2
    end
    object FDMemPrincipalTipoOperacion: TStringField
      FieldName = 'TipoOperacion'
      Visible = False
      Size = 1
    end
  end
  object DS_Principal: TDataSource
    DataSet = FDMemPrincipal
    Left = 136
    Top = 145
  end
end
