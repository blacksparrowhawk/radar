object Form_loadfile: TForm_loadfile
  Left = 254
  Top = 197
  Width = 184
  Height = 468
  Caption = 'Select a file'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 416
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 175
    Height = 409
    Constraints.MaxWidth = 175
    Constraints.MinWidth = 175
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
end
