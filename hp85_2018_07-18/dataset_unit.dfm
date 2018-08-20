object frm_dataset: Tfrm_dataset
  Left = 322
  Top = 431
  BorderIcons = [biSystemMenu]
  Caption = 'Define new dataset'
  ClientHeight = 105
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_dataset: TLabel
    Left = 36
    Top = 16
    Width = 147
    Height = 13
    Caption = 'Dataset name (must be unique)'
  end
  object edt_datasetname: TEdit
    Left = 36
    Top = 32
    Width = 353
    Height = 21
    TabOrder = 0
    OnChange = edt_datasetnameChange
  end
  object btn_ok: TButton
    Left = 128
    Top = 64
    Width = 75
    Height = 25
    Caption = '&Ok'
    Enabled = False
    TabOrder = 1
    OnClick = btn_okClick
  end
  object btn_cancel: TButton
    Left = 220
    Top = 64
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = btn_cancelClick
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=MSDASQL.1;Password=radar;Persist Security Info=True;Use' +
      'r ID=radar;Extended Properties="DSN=PostgreSQL ANSI;DATABASE=d30' +
      ';SERVER=localhost;PORT=5432;SSLMODE=prefer;UID=radar;PWD=radar;R' +
      'eadOnly=0;FakeOidIndex=0;ShowOidColumn=0;RowVersioning=0;ShowSys' +
      'temTables=0;ConnSettings=;Fetch=100;Socket=8192;UnknownSizes=0;M' +
      'axVarcharSize=254;MaxLongVarcharSize=8190;Debug=0;CommLog=0;Opti' +
      'mizer=1;Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;UnknownsAsL' +
      'ongVarchar=0;BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;ExtraSysTa' +
      'blePrefixes=dd_;LFConversion=1;UpdatableCursors=0;DisallowPremat' +
      'ure=0;TrueIsMinus1=0;BI=0;ByteaAsLongVarBinary=0;UseServerSidePr' +
      'epare=0;LowerCaseIdentifier=0"'
    Parameters = <>
    Left = 40
    Top = 60
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 348
    Top = 68
  end
  object ADODataSet1: TADODataSet
    ConnectionString = 
      'Provider=PostgreSQL.1;Password=radar;User ID=radar;Data Source=l' +
      'ocalhost;Location=radarfbo20121019;Extended Properties=""'
    Parameters = <>
    Left = 91
    Top = 62
  end
end
