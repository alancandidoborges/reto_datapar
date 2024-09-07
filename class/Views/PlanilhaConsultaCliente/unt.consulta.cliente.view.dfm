inherited frmPlantilhaConsultaCliente: TfrmPlantilhaConsultaCliente
  Caption = 'DATAPAR - Lista de  Clientes'
  ClientHeight = 413
  ClientWidth = 697
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitLeft = -24
  ExplicitTop = -51
  ExplicitWidth = 703
  ExplicitHeight = 442
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnTop: TPanel
    Width = 697
    ExplicitWidth = 697
  end
  inherited pnCenter: TPanel
    Width = 697
    Height = 236
    ExplicitWidth = 697
    ExplicitHeight = 236
    inherited DBGrid1: TDBGrid
      Width = 693
      Height = 232
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Width = 271
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CORREOELECTRONICO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DIRECCION'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NUMERO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VECINDARIO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CIUDAD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODIGOPOSTAL'
          Visible = False
        end>
    end
  end
  inherited pnButton: TPanel
    Top = 374
    Width = 697
    ExplicitTop = 374
    ExplicitWidth = 697
    inherited SpeedButton2: TSpeedButton
      Left = 174
      ExplicitLeft = 606
      ExplicitTop = 4
    end
    inherited btnIncluir: TSpeedButton
      ExplicitLeft = 512
    end
    inherited btnBorrar: TSpeedButton
      Left = 88
      ExplicitLeft = 604
      ExplicitTop = 15
    end
  end
  inherited Panel1: TPanel
    Width = 697
    ExplicitWidth = 697
    inherited SpeedButton3: TSpeedButton
      Left = 609
      ExplicitLeft = 609
    end
    inherited edtLocalizar: TEdit
      Width = 593
      ExplicitWidth = 593
    end
  end
  inherited Panel2: TPanel
    Top = 335
    Width = 697
    ExplicitTop = 335
    ExplicitWidth = 697
    inherited SpeedButton1: TSpeedButton
      Left = 609
    end
  end
  inherited FDMemPrincipal: TFDMemTable
    object FDMemPrincipalID: TFMTBCDField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      Precision = 38
      Size = 0
    end
    object FDMemPrincipalNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 100
    end
    object FDMemPrincipalCPF: TStringField
      DisplayLabel = 'C.P.F'
      FieldName = 'CPF'
      Origin = 'CPF'
    end
    object FDMemPrincipalTELEFONO: TStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
    end
    object FDMemPrincipalCORREOELECTRONICO: TStringField
      FieldName = 'CORREOELECTRONICO'
      Origin = 'CORREOELECTRONICO'
      Visible = False
      Size = 100
    end
    object FDMemPrincipalDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Origin = 'DIRECCION'
      Visible = False
      Size = 150
    end
    object FDMemPrincipalNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Visible = False
      Size = 10
    end
    object FDMemPrincipalVECINDARIO: TStringField
      FieldName = 'VECINDARIO'
      Origin = 'VECINDARIO'
      Visible = False
      Size = 60
    end
    object FDMemPrincipalCIUDAD: TStringField
      FieldName = 'CIUDAD'
      Origin = 'CIUDAD'
      Visible = False
      Size = 50
    end
    object FDMemPrincipalCODIGOPOSTAL: TStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'CODIGOPOSTAL'
      Visible = False
      Size = 25
    end
  end
end
