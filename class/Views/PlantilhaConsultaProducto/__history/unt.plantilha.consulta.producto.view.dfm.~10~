inherited frmPlantilhaConsultaProducto: TfrmPlantilhaConsultaProducto
  Caption = 'Lista de Productos'
  ClientHeight = 392
  ClientWidth = 734
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitTop = 2
  ExplicitWidth = 740
  ExplicitHeight = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnTop: TPanel
    Width = 734
    ExplicitWidth = 734
  end
  inherited pnCenter: TPanel
    Width = 734
    Height = 215
    ExplicitWidth = 734
    ExplicitHeight = 215
    inherited DBGrid1: TDBGrid
      Width = 730
      Height = 211
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Width = 395
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 81
          Visible = True
        end>
    end
  end
  inherited pnButton: TPanel
    Top = 353
    Width = 734
    ExplicitTop = 353
    ExplicitWidth = 734
    inherited SpeedButton2: TSpeedButton
      ExplicitLeft = 637
      ExplicitTop = 4
    end
    inherited btnIncluir: TSpeedButton
      ExplicitLeft = 551
      ExplicitTop = 13
    end
    inherited btnBorrar: TSpeedButton
      ExplicitLeft = 643
      ExplicitTop = 15
    end
  end
  inherited Panel1: TPanel
    Width = 734
    ExplicitWidth = 734
    inherited SpeedButton3: TSpeedButton
      Left = 646
      ExplicitLeft = 646
    end
    inherited edtLocalizar: TEdit
      Width = 630
      ExplicitWidth = 630
    end
  end
  inherited Panel2: TPanel
    Top = 314
    Width = 734
    ExplicitTop = 314
    ExplicitWidth = 734
    inherited SpeedButton1: TSpeedButton
      Left = 646
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
    object FDMemPrincipalDESCRIPCION: TStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      Visible = False
      Size = 255
    end
    object FDMemPrincipalPRECIO: TBCDField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'PRECIO'
      OnGetText = FDMemPrincipalPRECIOGetText
      Precision = 16
      Size = 2
    end
    object FDMemPrincipalCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
    end
  end
end
