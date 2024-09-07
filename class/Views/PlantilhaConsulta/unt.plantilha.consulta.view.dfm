object frmPlantilhaConsulta: TfrmPlantilhaConsulta
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmPlantilhaConsulta'
  ClientHeight = 379
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 43
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object lblNombreBentana: TLabel
      Left = 10
      Top = 13
      Width = 104
      Height = 16
      Caption = 'lblNombreBentana'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnCenter: TPanel
    Left = 0
    Top = 99
    Width = 575
    Height = 202
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 142
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 571
      Height = 198
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
    end
  end
  object pnButton: TPanel
    Left = 0
    Top = 301
    Width = 575
    Height = 39
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 312
    object SpeedButton2: TSpeedButton
      Left = 88
      Top = 2
      Width = 86
      Height = 35
      Align = alLeft
      Caption = 'Actualizar'
      OnClick = SpeedButton2Click
      ExplicitLeft = 94
      ExplicitTop = -2
    end
    object btnIncluir: TSpeedButton
      Left = 2
      Top = 2
      Width = 86
      Height = 35
      Align = alLeft
      Caption = 'Crear'
      OnClick = btnIncluirClick
      ExplicitLeft = 11
      ExplicitHeight = 31
    end
    object btnBorrar: TSpeedButton
      Left = 174
      Top = 2
      Width = 86
      Height = 35
      Align = alLeft
      Caption = 'Eliminar'
      OnClick = btnBorrarClick
      ExplicitLeft = 180
      ExplicitTop = -2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 43
    Width = 575
    Height = 56
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 11
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Localizar'
    end
    object SpeedButton3: TSpeedButton
      Left = 479
      Top = 16
      Width = 82
      Height = 34
      Caption = 'Leer Todos'
      OnClick = SpeedButton3Click
    end
    object edtLocalizar: TEdit
      Left = 10
      Top = 27
      Width = 463
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtLocalizarChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 340
    Width = 575
    Height = 39
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 312
    object SpeedButton1: TSpeedButton
      Left = 487
      Top = 2
      Width = 86
      Height = 35
      Align = alRight
      Caption = 'Salir'
      OnClick = SpeedButton1Click
      ExplicitLeft = 484
      ExplicitTop = 3
      ExplicitHeight = 33
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
    Top = 155
  end
  object DS_Principal: TDataSource
    DataSet = FDMemPrincipal
    Left = 136
    Top = 155
  end
end
