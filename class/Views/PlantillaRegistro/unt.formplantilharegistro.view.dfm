object frmPlantilhaRegistro: TfrmPlantilhaRegistro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmFormEstandar'
  ClientHeight = 344
  ClientWidth = 593
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
    Width = 593
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object lblNombreBentana: TLabel
      Left = 16
      Top = 11
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
    Top = 41
    Width = 593
    Height = 231
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
  end
  object pnButton: TPanel
    Left = 0
    Top = 272
    Width = 593
    Height = 72
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    object btnGrabar: TSpeedButton
      Left = 224
      Top = 6
      Width = 73
      Height = 57
      Caption = 'Salvar'
      OnClick = btnGrabarClick
    end
    object SpeedButton2: TSpeedButton
      Left = 303
      Top = 6
      Width = 74
      Height = 57
      Caption = 'Cancelar'
      OnClick = SpeedButton2Click
    end
  end
end
