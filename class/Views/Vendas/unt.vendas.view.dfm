object frmVendas: TfrmVendas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'DATAPAR - Lista de Ventas'
  ClientHeight = 343
  ClientWidth = 680
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
    Width = 680
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 658
    object lblNombreBentana: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 8
      Width = 104
      Height = 21
      Alignment = taCenter
      Caption = 'Lista de Ventas'
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
    Width = 680
    Height = 235
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 658
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 676
      Height = 231
      Align = alClient
      DataSource = DS_Principal
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_INC'
          Width = -1
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODIGOCLI'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Width = 268
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ENTREGA'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Visible = True
        end>
    end
  end
  object pnButton: TPanel
    Left = 0
    Top = 312
    Width = 680
    Height = 31
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 658
    object SpeedButton2: TSpeedButton
      Left = 604
      Top = 2
      Width = 74
      Height = 27
      Align = alRight
      Caption = 'Salir'
      OnClick = SpeedButton2Click
      ExplicitLeft = 538
      ExplicitTop = -7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 276
    Width = 680
    Height = 36
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 658
    object btn_incluir: TSpeedButton
      Left = 2
      Top = 2
      Width = 65
      Height = 32
      Align = alLeft
      Caption = 'Crear'
      OnClick = btn_incluirClick
      ExplicitLeft = 5
      ExplicitTop = 3
      ExplicitHeight = 29
    end
    object btn_alterar: TSpeedButton
      Left = 67
      Top = 2
      Width = 65
      Height = 32
      Align = alLeft
      Caption = 'Actualizar'
      OnClick = btn_alterarClick
      ExplicitLeft = 76
      ExplicitTop = 4
      ExplicitHeight = 29
    end
    object btn_excluir: TSpeedButton
      Left = 132
      Top = 2
      Width = 65
      Height = 32
      Align = alLeft
      Caption = 'Eliminar'
      OnClick = btn_excluirClick
      ExplicitTop = 4
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
    Left = 56
    Top = 81
    object FDMemPrincipalID: TFMTBCDField
      DisplayLabel = 'N'#186' Controle'
      FieldName = 'ID'
      Origin = 'ID'
      Precision = 38
      Size = 0
    end
    object FDMemPrincipalDATA_INC: TDateTimeField
      DisplayLabel = 'Data-Inclusion'
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
      Visible = False
    end
    object FDMemPrincipalCODIGOCLI: TFMTBCDField
      DisplayLabel = 'Cod.Cliente'
      FieldName = 'CODIGOCLI'
      Origin = 'CODIGOCLI'
      Required = True
      Precision = 38
      Size = 0
    end
    object FDMemPrincipalNOMBRE: TStringField
      DisplayLabel = 'Nombre Cliente'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 100
    end
    object FDMemPrincipalDATA_ENTREGA: TDateTimeField
      DisplayLabel = 'Data-Entrega'
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
    end
    object FDMemPrincipalVALOR_TOTAL: TBCDField
      DisplayLabel = 'Precio Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      OnGetText = FDMemPrincipalVALOR_TOTALGetText
      Precision = 16
      Size = 2
    end
  end
  object DS_Principal: TDataSource
    DataSet = FDMemPrincipal
    Left = 160
    Top = 129
  end
end
