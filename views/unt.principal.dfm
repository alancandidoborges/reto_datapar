object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Bentana Principal'
  ClientHeight = 50
  ClientWidth = 512
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
  PixelsPerInch = 96
  TextHeight = 13
  object btnRegistroCliente: TSpeedButton
    Left = 8
    Top = 8
    Width = 129
    Height = 33
    Caption = 'Registro de Clientes'
    OnClick = btnRegistroClienteClick
  end
  object SpeedButton1: TSpeedButton
    Left = 143
    Top = 8
    Width = 138
    Height = 33
    Caption = 'Registro de Productos'
    OnClick = SpeedButton1Click
  end
  object btn_vendas: TSpeedButton
    Left = 287
    Top = 8
    Width = 138
    Height = 33
    Caption = 'Registro de Vendas'
    OnClick = btn_vendasClick
  end
  object btnSalir: TSpeedButton
    Left = 431
    Top = 8
    Width = 74
    Height = 33
    Caption = 'Salir'
    OnClick = btnSalirClick
  end
end
