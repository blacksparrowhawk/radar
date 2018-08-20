object Form_main: TForm_main
  Left = 111
  Top = 60
  Caption = 'Radar Track viewer and editor v.  2018-06-24 for HP85 data'
  ClientHeight = 822
  ClientWidth = 1312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 326
    Top = 273
    Width = 329
    Height = 13
    Caption = 
      'Actions:    D: start delete     E: end delete     S: delete only' +
      ' current row'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 671
    Top = 76
    Width = 55
    Height = 13
    Caption = 'Edit actions'
  end
  object lbl_trackquality: TLabel
    Left = 170
    Top = 306
    Width = 64
    Height = 13
    Caption = 'Track quality:'
  end
  object lbl_targettype: TLabel
    Left = 300
    Top = 306
    Width = 57
    Height = 13
    Caption = 'Target type:'
  end
  object lbl_targetcomment: TLabel
    Left = 17
    Top = 333
    Width = 80
    Height = 13
    Caption = 'Target comment:'
  end
  object lbl_overallcomment: TLabel
    Left = 17
    Top = 348
    Width = 82
    Height = 13
    Caption = 'Overall comment:'
  end
  object lbl_admincomment: TLabel
    Left = 17
    Top = 363
    Width = 78
    Height = 13
    Caption = 'Admin comment:'
  end
  object Label7: TLabel
    Left = 326
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Point interval (s)'
  end
  object Label8: TLabel
    Left = 671
    Top = 35
    Width = 47
    Height = 13
    Caption = 'Editera tid'
  end
  object lbl_Folder: TLabel
    Left = 8
    Top = 3
    Width = 29
    Height = 13
    Caption = 'Folder'
  end
  object Label9: TLabel
    Left = 71
    Top = 3
    Width = 36
    Height = 13
    Caption = 'Filnamn'
  end
  object Label10: TLabel
    Left = 127
    Top = 3
    Width = 30
    Height = 13
    Caption = 'Taxon'
  end
  object lbl_id: TLabel
    Left = 17
    Top = 306
    Width = 63
    Height = 13
    Caption = 'Identification:'
  end
  object StringGrid1: TStringGrid
    Left = 326
    Top = 48
    Width = 339
    Height = 225
    ColCount = 1
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    Visible = False
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
  end
  object RChart1: TRChart
    Left = -8
    Top = 389
    Width = 833
    Height = 153
    AvoidDuplicateMarks = False
    AllocSize = 1000
    AutoRedraw = False
    MarginRight = 20
    MarginTop = 20
    MarginBottom = 40
    RRim = 20
    TRim = 20
    BRim = 40
    BackGroundImg.IncludePath = False
    BackGroundImg.FillMode = bfStretch
    BackGroundImg.AreaMode = bamNone
    BackGroundImg.AreaColor = 14540253
    BackGroundImg.AreaLeft = -1.000000000000000000
    BackGroundImg.AreaRight = 1.000000000000000000
    BackGroundImg.AreaTop = 1.000000000000000000
    BackGroundImg.AreaBottom = -1.000000000000000000
    ClassDefault = 0
    GridStyle = gsPoints
    Isometric = False
    DataColor = clYellow
    ChartColor = clBlack
    GridColor = clGray
    JointLayers.L01xControlledBy = 1
    JointLayers.L01yControlledBy = 1
    JointLayers.L02xControlledBy = 2
    JointLayers.L02yControlledBy = 2
    JointLayers.L03xControlledBy = 3
    JointLayers.L03yControlledBy = 3
    JointLayers.L04xControlledBy = 4
    JointLayers.L04yControlledBy = 4
    JointLayers.L05xControlledBy = 5
    JointLayers.L05yControlledBy = 5
    JointLayers.L06xControlledBy = 6
    JointLayers.L06yControlledBy = 6
    JointLayers.L07xControlledBy = 7
    JointLayers.L07yControlledBy = 7
    JointLayers.L08xControlledBy = 8
    JointLayers.L08yControlledBy = 8
    JointLayers.L09xControlledBy = 9
    JointLayers.L09yControlledBy = 9
    JointLayers.L10xControlledBy = 10
    JointLayers.L10yControlledBy = 10
    JointLayers.L11xControlledBy = 11
    JointLayers.L11yControlledBy = 11
    JointLayers.L12xControlledBy = 12
    JointLayers.L12yControlledBy = 12
    JointLayers.L13xControlledBy = 13
    JointLayers.L13yControlledBy = 13
    JointLayers.L14xControlledBy = 14
    JointLayers.L14yControlledBy = 14
    JointLayers.L15xControlledBy = 15
    JointLayers.L15yControlledBy = 15
    JointLayers.L16xControlledBy = 16
    JointLayers.L16yControlledBy = 16
    Caption = ''
    CaptionPosX = 0
    CaptionPosY = -16
    CaptionAlignment = taRightJustify
    CaptionAnchorHoriz = cahChartRight
    CaptionAnchorVert = cavChartTop
    CrossHair1.Color = clBlack
    CrossHair1.Layer = 1
    CrossHair1.Mode = chOff
    CrossHair1.LineType = psSolid
    CrossHair1.LineWid = 1
    CrossHair2.Color = clBlack
    CrossHair2.Layer = 2
    CrossHair2.Mode = chOff
    CrossHair2.LineType = psSolid
    CrossHair2.LineWid = 1
    CrossHair3.Color = clBlack
    CrossHair3.Layer = 3
    CrossHair3.Mode = chOff
    CrossHair3.LineType = psSolid
    CrossHair3.LineWid = 1
    CrossHair4.Color = clBlack
    CrossHair4.Layer = 4
    CrossHair4.Mode = chOff
    CrossHair4.LineType = psSolid
    CrossHair4.LineWid = 1
    MouseAction = maZoomWind
    MouseCursorFixed = True
    Scale1X.Caption = 'Tick'
    Scale1X.CaptionPosX = 0
    Scale1X.CaptionPosY = 22
    Scale1X.CaptionAlignment = taCenter
    Scale1X.CaptionAnchor = uaSclCenter
    Scale1X.ColorScale = clBlack
    Scale1X.DateFormat.TimeFormat = tfHHMMSS
    Scale1X.DateFormat.DateSeparator = '-'
    Scale1X.DateFormat.TimeSeparator = ':'
    Scale1X.DateFormat.YearLength = ylYYYY
    Scale1X.DateFormat.MonthName = True
    Scale1X.DateFormat.DateOrder = doDDMMYY
    Scale1X.DateFormat.DateForTime = dtOnePerDay
    Scale1X.DecPlaces = -2
    Scale1X.Font.Charset = DEFAULT_CHARSET
    Scale1X.Font.Color = clWindowText
    Scale1X.Font.Height = -11
    Scale1X.Font.Name = 'MS Sans Serif'
    Scale1X.Font.Style = []
    Scale1X.Logarithmic = False
    Scale1X.LabelType = ftNum
    Scale1X.MinTicks = 3
    Scale1X.MinRange = 0.000000000100000000
    Scale1X.RangeHigh = 1.000000000000000000
    Scale1X.ShortTicks = True
    Scale1X.ScalePos = 0
    Scale1X.Visible = True
    Scale1X.ScaleLocation = slBottom
    Scale1Y.CaptionPosX = 0
    Scale1Y.CaptionPosY = -16
    Scale1Y.CaptionAlignment = taLeftJustify
    Scale1Y.CaptionAnchor = uaSclTopLft
    Scale1Y.ColorScale = clBlack
    Scale1Y.DateFormat.TimeFormat = tfHHMMSS
    Scale1Y.DateFormat.DateSeparator = '-'
    Scale1Y.DateFormat.TimeSeparator = ':'
    Scale1Y.DateFormat.YearLength = ylYYYY
    Scale1Y.DateFormat.MonthName = True
    Scale1Y.DateFormat.DateOrder = doDDMMYY
    Scale1Y.DateFormat.DateForTime = dtOnePerDay
    Scale1Y.DecPlaces = -2
    Scale1Y.Font.Charset = DEFAULT_CHARSET
    Scale1Y.Font.Color = clWindowText
    Scale1Y.Font.Height = -11
    Scale1Y.Font.Name = 'MS Sans Serif'
    Scale1Y.Font.Style = []
    Scale1Y.Logarithmic = False
    Scale1Y.LabelType = ftNum
    Scale1Y.MinTicks = 3
    Scale1Y.MinRange = 0.000000000100000000
    Scale1Y.RangeHigh = 1.000000000000000000
    Scale1Y.ShortTicks = True
    Scale1Y.ScalePos = 0
    Scale1Y.Visible = True
    Scale1Y.ScaleLocation = slLeft
    Scale2X.CaptionPosX = 10
    Scale2X.CaptionPosY = 100
    Scale2X.CaptionAlignment = taCenter
    Scale2X.CaptionAnchor = uaSclCenter
    Scale2X.ColorScale = clMaroon
    Scale2X.DateFormat.TimeFormat = tfHHMMSS
    Scale2X.DateFormat.DateSeparator = '-'
    Scale2X.DateFormat.TimeSeparator = ':'
    Scale2X.DateFormat.YearLength = ylYYYY
    Scale2X.DateFormat.MonthName = True
    Scale2X.DateFormat.DateOrder = doDDMMYY
    Scale2X.DateFormat.DateForTime = dtOnePerDay
    Scale2X.DecPlaces = -2
    Scale2X.Font.Charset = DEFAULT_CHARSET
    Scale2X.Font.Color = clWindowText
    Scale2X.Font.Height = -11
    Scale2X.Font.Name = 'MS Sans Serif'
    Scale2X.Font.Style = []
    Scale2X.Logarithmic = False
    Scale2X.LabelType = ftNum
    Scale2X.MinTicks = 3
    Scale2X.MinRange = 0.000000000100000000
    Scale2X.RangeHigh = 1.000000000000000000
    Scale2X.ShortTicks = True
    Scale2X.ScalePos = 0
    Scale2X.Visible = False
    Scale2X.ScaleLocation = slBottom
    Scale2Y.CaptionPosX = 10
    Scale2Y.CaptionPosY = 100
    Scale2Y.CaptionAlignment = taRightJustify
    Scale2Y.CaptionAnchor = uaSclTopLft
    Scale2Y.ColorScale = clMaroon
    Scale2Y.DateFormat.TimeFormat = tfHHMMSS
    Scale2Y.DateFormat.DateSeparator = '-'
    Scale2Y.DateFormat.TimeSeparator = ':'
    Scale2Y.DateFormat.YearLength = ylYYYY
    Scale2Y.DateFormat.MonthName = True
    Scale2Y.DateFormat.DateOrder = doDDMMYY
    Scale2Y.DateFormat.DateForTime = dtOnePerDay
    Scale2Y.DecPlaces = -2
    Scale2Y.Font.Charset = DEFAULT_CHARSET
    Scale2Y.Font.Color = clWindowText
    Scale2Y.Font.Height = -11
    Scale2Y.Font.Name = 'MS Sans Serif'
    Scale2Y.Font.Style = []
    Scale2Y.Logarithmic = False
    Scale2Y.LabelType = ftNum
    Scale2Y.MinTicks = 3
    Scale2Y.MinRange = 0.000000000100000000
    Scale2Y.RangeHigh = 1.000000000000000000
    Scale2Y.ShortTicks = True
    Scale2Y.ScalePos = 0
    Scale2Y.Visible = False
    Scale2Y.ScaleLocation = slLeft
    Scale3X.CaptionPosX = 10
    Scale3X.CaptionPosY = 100
    Scale3X.CaptionAlignment = taCenter
    Scale3X.CaptionAnchor = uaSclCenter
    Scale3X.ColorScale = clGreen
    Scale3X.DateFormat.TimeFormat = tfHHMMSS
    Scale3X.DateFormat.DateSeparator = '-'
    Scale3X.DateFormat.TimeSeparator = ':'
    Scale3X.DateFormat.YearLength = ylYYYY
    Scale3X.DateFormat.MonthName = True
    Scale3X.DateFormat.DateOrder = doDDMMYY
    Scale3X.DateFormat.DateForTime = dtOnePerDay
    Scale3X.DecPlaces = -2
    Scale3X.Font.Charset = DEFAULT_CHARSET
    Scale3X.Font.Color = clWindowText
    Scale3X.Font.Height = -11
    Scale3X.Font.Name = 'MS Sans Serif'
    Scale3X.Font.Style = []
    Scale3X.Logarithmic = False
    Scale3X.LabelType = ftNum
    Scale3X.MinTicks = 3
    Scale3X.MinRange = 0.000000000100000000
    Scale3X.RangeHigh = 1.000000000000000000
    Scale3X.ShortTicks = True
    Scale3X.ScalePos = 0
    Scale3X.Visible = False
    Scale3X.ScaleLocation = slBottom
    Scale3Y.CaptionPosX = 10
    Scale3Y.CaptionPosY = 100
    Scale3Y.CaptionAlignment = taRightJustify
    Scale3Y.CaptionAnchor = uaSclTopLft
    Scale3Y.ColorScale = clGreen
    Scale3Y.DateFormat.TimeFormat = tfHHMMSS
    Scale3Y.DateFormat.DateSeparator = '-'
    Scale3Y.DateFormat.TimeSeparator = ':'
    Scale3Y.DateFormat.YearLength = ylYYYY
    Scale3Y.DateFormat.MonthName = True
    Scale3Y.DateFormat.DateOrder = doDDMMYY
    Scale3Y.DateFormat.DateForTime = dtOnePerDay
    Scale3Y.DecPlaces = -2
    Scale3Y.Font.Charset = DEFAULT_CHARSET
    Scale3Y.Font.Color = clWindowText
    Scale3Y.Font.Height = -11
    Scale3Y.Font.Name = 'MS Sans Serif'
    Scale3Y.Font.Style = []
    Scale3Y.Logarithmic = False
    Scale3Y.LabelType = ftNum
    Scale3Y.MinTicks = 3
    Scale3Y.MinRange = 0.000000000100000000
    Scale3Y.RangeHigh = 1.000000000000000000
    Scale3Y.ShortTicks = True
    Scale3Y.ScalePos = 0
    Scale3Y.Visible = False
    Scale3Y.ScaleLocation = slLeft
    Scale4X.CaptionPosX = 10
    Scale4X.CaptionPosY = 100
    Scale4X.CaptionAlignment = taCenter
    Scale4X.CaptionAnchor = uaSclCenter
    Scale4X.ColorScale = clOlive
    Scale4X.DateFormat.TimeFormat = tfHHMMSS
    Scale4X.DateFormat.DateSeparator = '-'
    Scale4X.DateFormat.TimeSeparator = ':'
    Scale4X.DateFormat.YearLength = ylYYYY
    Scale4X.DateFormat.MonthName = True
    Scale4X.DateFormat.DateOrder = doDDMMYY
    Scale4X.DateFormat.DateForTime = dtOnePerDay
    Scale4X.DecPlaces = -2
    Scale4X.Font.Charset = DEFAULT_CHARSET
    Scale4X.Font.Color = clWindowText
    Scale4X.Font.Height = -11
    Scale4X.Font.Name = 'MS Sans Serif'
    Scale4X.Font.Style = []
    Scale4X.Logarithmic = False
    Scale4X.LabelType = ftNum
    Scale4X.MinTicks = 3
    Scale4X.MinRange = 0.000000000100000000
    Scale4X.RangeHigh = 1.000000000000000000
    Scale4X.ShortTicks = True
    Scale4X.ScalePos = 0
    Scale4X.Visible = False
    Scale4X.ScaleLocation = slBottom
    Scale4Y.CaptionPosX = 10
    Scale4Y.CaptionPosY = 100
    Scale4Y.CaptionAlignment = taRightJustify
    Scale4Y.CaptionAnchor = uaSclTopLft
    Scale4Y.ColorScale = clOlive
    Scale4Y.DateFormat.TimeFormat = tfHHMMSS
    Scale4Y.DateFormat.DateSeparator = '-'
    Scale4Y.DateFormat.TimeSeparator = ':'
    Scale4Y.DateFormat.YearLength = ylYYYY
    Scale4Y.DateFormat.MonthName = True
    Scale4Y.DateFormat.DateOrder = doDDMMYY
    Scale4Y.DateFormat.DateForTime = dtOnePerDay
    Scale4Y.DecPlaces = -2
    Scale4Y.Font.Charset = DEFAULT_CHARSET
    Scale4Y.Font.Color = clWindowText
    Scale4Y.Font.Height = -11
    Scale4Y.Font.Name = 'MS Sans Serif'
    Scale4Y.Font.Style = []
    Scale4Y.Logarithmic = False
    Scale4Y.LabelType = ftNum
    Scale4Y.MinTicks = 3
    Scale4Y.MinRange = 0.000000000100000000
    Scale4Y.RangeHigh = 1.000000000000000000
    Scale4Y.ShortTicks = True
    Scale4Y.ScalePos = 0
    Scale4Y.Visible = False
    Scale4Y.ScaleLocation = slLeft
    ShadowStyle = ssFlying
    ShadowColor = clGrayText
    ShadowBakColor = clBtnFace
    TextFontStyle = []
    TextBkStyle = tbClear
    TextBkColor = clWhite
    TextAlignment = taCenter
  end
  object RChart2: TRChart
    Left = -8
    Top = 565
    Width = 833
    Height = 160
    AvoidDuplicateMarks = False
    AllocSize = 1000
    AutoRedraw = False
    MarginRight = 20
    MarginTop = 20
    MarginBottom = 40
    RRim = 20
    TRim = 20
    BRim = 40
    BackGroundImg.IncludePath = False
    BackGroundImg.FillMode = bfStretch
    BackGroundImg.AreaMode = bamNone
    BackGroundImg.AreaColor = 14540253
    BackGroundImg.AreaLeft = -1.000000000000000000
    BackGroundImg.AreaRight = 1.000000000000000000
    BackGroundImg.AreaTop = 1.000000000000000000
    BackGroundImg.AreaBottom = -1.000000000000000000
    ClassDefault = 0
    GridStyle = gsPoints
    Isometric = False
    DataColor = clRed
    ChartColor = clBlack
    GridColor = clGray
    JointLayers.L01xControlledBy = 1
    JointLayers.L01yControlledBy = 1
    JointLayers.L02xControlledBy = 2
    JointLayers.L02yControlledBy = 2
    JointLayers.L03xControlledBy = 3
    JointLayers.L03yControlledBy = 3
    JointLayers.L04xControlledBy = 4
    JointLayers.L04yControlledBy = 4
    JointLayers.L05xControlledBy = 5
    JointLayers.L05yControlledBy = 5
    JointLayers.L06xControlledBy = 6
    JointLayers.L06yControlledBy = 6
    JointLayers.L07xControlledBy = 7
    JointLayers.L07yControlledBy = 7
    JointLayers.L08xControlledBy = 8
    JointLayers.L08yControlledBy = 8
    JointLayers.L09xControlledBy = 9
    JointLayers.L09yControlledBy = 9
    JointLayers.L10xControlledBy = 10
    JointLayers.L10yControlledBy = 10
    JointLayers.L11xControlledBy = 11
    JointLayers.L11yControlledBy = 11
    JointLayers.L12xControlledBy = 12
    JointLayers.L12yControlledBy = 12
    JointLayers.L13xControlledBy = 13
    JointLayers.L13yControlledBy = 13
    JointLayers.L14xControlledBy = 14
    JointLayers.L14yControlledBy = 14
    JointLayers.L15xControlledBy = 15
    JointLayers.L15yControlledBy = 15
    JointLayers.L16xControlledBy = 16
    JointLayers.L16yControlledBy = 16
    Caption = ''
    CaptionPosX = 0
    CaptionPosY = -16
    CaptionAlignment = taRightJustify
    CaptionAnchorHoriz = cahChartRight
    CaptionAnchorVert = cavChartTop
    CrossHair1.Color = clBlack
    CrossHair1.Layer = 1
    CrossHair1.Mode = chOff
    CrossHair1.LineType = psSolid
    CrossHair1.LineWid = 1
    CrossHair2.Color = clBlack
    CrossHair2.Layer = 2
    CrossHair2.Mode = chOff
    CrossHair2.LineType = psSolid
    CrossHair2.LineWid = 1
    CrossHair3.Color = clBlack
    CrossHair3.Layer = 3
    CrossHair3.Mode = chOff
    CrossHair3.LineType = psSolid
    CrossHair3.LineWid = 1
    CrossHair4.Color = clBlack
    CrossHair4.Layer = 4
    CrossHair4.Mode = chOff
    CrossHair4.LineType = psSolid
    CrossHair4.LineWid = 1
    MouseAction = maZoomWind
    MouseCursorFixed = True
    Scale1X.Caption = 'Auto scale Y axis'
    Scale1X.CaptionPosX = 0
    Scale1X.CaptionPosY = 22
    Scale1X.CaptionAlignment = taCenter
    Scale1X.CaptionAnchor = uaSclCenter
    Scale1X.ColorScale = clBlack
    Scale1X.DateFormat.TimeFormat = tfHHMMSS
    Scale1X.DateFormat.DateSeparator = '-'
    Scale1X.DateFormat.TimeSeparator = ':'
    Scale1X.DateFormat.YearLength = ylYYYY
    Scale1X.DateFormat.MonthName = True
    Scale1X.DateFormat.DateOrder = doDDMMYY
    Scale1X.DateFormat.DateForTime = dtOnePerDay
    Scale1X.DecPlaces = -2
    Scale1X.Font.Charset = DEFAULT_CHARSET
    Scale1X.Font.Color = clWindowText
    Scale1X.Font.Height = -11
    Scale1X.Font.Name = 'MS Sans Serif'
    Scale1X.Font.Style = []
    Scale1X.Logarithmic = False
    Scale1X.LabelType = ftNum
    Scale1X.MinTicks = 3
    Scale1X.MinRange = 0.000000000100000000
    Scale1X.RangeHigh = 1.000000000000000000
    Scale1X.ShortTicks = True
    Scale1X.ScalePos = 0
    Scale1X.Visible = True
    Scale1X.ScaleLocation = slBottom
    Scale1Y.CaptionPosX = 0
    Scale1Y.CaptionPosY = -16
    Scale1Y.CaptionAlignment = taLeftJustify
    Scale1Y.CaptionAnchor = uaSclTopLft
    Scale1Y.ColorScale = clBlack
    Scale1Y.DateFormat.TimeFormat = tfHHMMSS
    Scale1Y.DateFormat.DateSeparator = '-'
    Scale1Y.DateFormat.TimeSeparator = ':'
    Scale1Y.DateFormat.YearLength = ylYYYY
    Scale1Y.DateFormat.MonthName = True
    Scale1Y.DateFormat.DateOrder = doDDMMYY
    Scale1Y.DateFormat.DateForTime = dtOnePerDay
    Scale1Y.DecPlaces = -2
    Scale1Y.Font.Charset = DEFAULT_CHARSET
    Scale1Y.Font.Color = clWindowText
    Scale1Y.Font.Height = -11
    Scale1Y.Font.Name = 'MS Sans Serif'
    Scale1Y.Font.Style = []
    Scale1Y.Logarithmic = False
    Scale1Y.LabelType = ftNum
    Scale1Y.MinTicks = 3
    Scale1Y.MinRange = 0.000000000100000000
    Scale1Y.RangeHigh = 1.000000000000000000
    Scale1Y.ShortTicks = True
    Scale1Y.ScalePos = 0
    Scale1Y.Visible = True
    Scale1Y.ScaleLocation = slLeft
    Scale2X.CaptionPosX = 10
    Scale2X.CaptionPosY = 100
    Scale2X.CaptionAlignment = taCenter
    Scale2X.CaptionAnchor = uaSclCenter
    Scale2X.ColorScale = clMaroon
    Scale2X.DateFormat.TimeFormat = tfHHMMSS
    Scale2X.DateFormat.DateSeparator = '-'
    Scale2X.DateFormat.TimeSeparator = ':'
    Scale2X.DateFormat.YearLength = ylYYYY
    Scale2X.DateFormat.MonthName = True
    Scale2X.DateFormat.DateOrder = doDDMMYY
    Scale2X.DateFormat.DateForTime = dtOnePerDay
    Scale2X.DecPlaces = -2
    Scale2X.Font.Charset = DEFAULT_CHARSET
    Scale2X.Font.Color = clWindowText
    Scale2X.Font.Height = -11
    Scale2X.Font.Name = 'MS Sans Serif'
    Scale2X.Font.Style = []
    Scale2X.Logarithmic = False
    Scale2X.LabelType = ftNum
    Scale2X.MinTicks = 3
    Scale2X.MinRange = 0.000000000100000000
    Scale2X.RangeHigh = 1.000000000000000000
    Scale2X.ShortTicks = True
    Scale2X.ScalePos = 0
    Scale2X.Visible = False
    Scale2X.ScaleLocation = slBottom
    Scale2Y.CaptionPosX = 10
    Scale2Y.CaptionPosY = 100
    Scale2Y.CaptionAlignment = taRightJustify
    Scale2Y.CaptionAnchor = uaSclTopLft
    Scale2Y.ColorScale = clMaroon
    Scale2Y.DateFormat.TimeFormat = tfHHMMSS
    Scale2Y.DateFormat.DateSeparator = '-'
    Scale2Y.DateFormat.TimeSeparator = ':'
    Scale2Y.DateFormat.YearLength = ylYYYY
    Scale2Y.DateFormat.MonthName = True
    Scale2Y.DateFormat.DateOrder = doDDMMYY
    Scale2Y.DateFormat.DateForTime = dtOnePerDay
    Scale2Y.DecPlaces = -2
    Scale2Y.Font.Charset = DEFAULT_CHARSET
    Scale2Y.Font.Color = clWindowText
    Scale2Y.Font.Height = -11
    Scale2Y.Font.Name = 'MS Sans Serif'
    Scale2Y.Font.Style = []
    Scale2Y.Logarithmic = False
    Scale2Y.LabelType = ftNum
    Scale2Y.MinTicks = 3
    Scale2Y.MinRange = 0.000000000100000000
    Scale2Y.RangeHigh = 1.000000000000000000
    Scale2Y.ShortTicks = True
    Scale2Y.ScalePos = 0
    Scale2Y.Visible = False
    Scale2Y.ScaleLocation = slLeft
    Scale3X.CaptionPosX = 10
    Scale3X.CaptionPosY = 100
    Scale3X.CaptionAlignment = taCenter
    Scale3X.CaptionAnchor = uaSclCenter
    Scale3X.ColorScale = clGreen
    Scale3X.DateFormat.TimeFormat = tfHHMMSS
    Scale3X.DateFormat.DateSeparator = '-'
    Scale3X.DateFormat.TimeSeparator = ':'
    Scale3X.DateFormat.YearLength = ylYYYY
    Scale3X.DateFormat.MonthName = True
    Scale3X.DateFormat.DateOrder = doDDMMYY
    Scale3X.DateFormat.DateForTime = dtOnePerDay
    Scale3X.DecPlaces = -2
    Scale3X.Font.Charset = DEFAULT_CHARSET
    Scale3X.Font.Color = clWindowText
    Scale3X.Font.Height = -11
    Scale3X.Font.Name = 'MS Sans Serif'
    Scale3X.Font.Style = []
    Scale3X.Logarithmic = False
    Scale3X.LabelType = ftNum
    Scale3X.MinTicks = 3
    Scale3X.MinRange = 0.000000000100000000
    Scale3X.RangeHigh = 1.000000000000000000
    Scale3X.ShortTicks = True
    Scale3X.ScalePos = 0
    Scale3X.Visible = False
    Scale3X.ScaleLocation = slBottom
    Scale3Y.CaptionPosX = 10
    Scale3Y.CaptionPosY = 100
    Scale3Y.CaptionAlignment = taRightJustify
    Scale3Y.CaptionAnchor = uaSclTopLft
    Scale3Y.ColorScale = clGreen
    Scale3Y.DateFormat.TimeFormat = tfHHMMSS
    Scale3Y.DateFormat.DateSeparator = '-'
    Scale3Y.DateFormat.TimeSeparator = ':'
    Scale3Y.DateFormat.YearLength = ylYYYY
    Scale3Y.DateFormat.MonthName = True
    Scale3Y.DateFormat.DateOrder = doDDMMYY
    Scale3Y.DateFormat.DateForTime = dtOnePerDay
    Scale3Y.DecPlaces = -2
    Scale3Y.Font.Charset = DEFAULT_CHARSET
    Scale3Y.Font.Color = clWindowText
    Scale3Y.Font.Height = -11
    Scale3Y.Font.Name = 'MS Sans Serif'
    Scale3Y.Font.Style = []
    Scale3Y.Logarithmic = False
    Scale3Y.LabelType = ftNum
    Scale3Y.MinTicks = 3
    Scale3Y.MinRange = 0.000000000100000000
    Scale3Y.RangeHigh = 1.000000000000000000
    Scale3Y.ShortTicks = True
    Scale3Y.ScalePos = 0
    Scale3Y.Visible = False
    Scale3Y.ScaleLocation = slLeft
    Scale4X.CaptionPosX = 10
    Scale4X.CaptionPosY = 100
    Scale4X.CaptionAlignment = taCenter
    Scale4X.CaptionAnchor = uaSclCenter
    Scale4X.ColorScale = clOlive
    Scale4X.DateFormat.TimeFormat = tfHHMMSS
    Scale4X.DateFormat.DateSeparator = '-'
    Scale4X.DateFormat.TimeSeparator = ':'
    Scale4X.DateFormat.YearLength = ylYYYY
    Scale4X.DateFormat.MonthName = True
    Scale4X.DateFormat.DateOrder = doDDMMYY
    Scale4X.DateFormat.DateForTime = dtOnePerDay
    Scale4X.DecPlaces = -2
    Scale4X.Font.Charset = DEFAULT_CHARSET
    Scale4X.Font.Color = clWindowText
    Scale4X.Font.Height = -11
    Scale4X.Font.Name = 'MS Sans Serif'
    Scale4X.Font.Style = []
    Scale4X.Logarithmic = False
    Scale4X.LabelType = ftNum
    Scale4X.MinTicks = 3
    Scale4X.MinRange = 0.000000000100000000
    Scale4X.RangeHigh = 1.000000000000000000
    Scale4X.ShortTicks = True
    Scale4X.ScalePos = 0
    Scale4X.Visible = False
    Scale4X.ScaleLocation = slBottom
    Scale4Y.CaptionPosX = 10
    Scale4Y.CaptionPosY = 100
    Scale4Y.CaptionAlignment = taRightJustify
    Scale4Y.CaptionAnchor = uaSclTopLft
    Scale4Y.ColorScale = clOlive
    Scale4Y.DateFormat.TimeFormat = tfHHMMSS
    Scale4Y.DateFormat.DateSeparator = '-'
    Scale4Y.DateFormat.TimeSeparator = ':'
    Scale4Y.DateFormat.YearLength = ylYYYY
    Scale4Y.DateFormat.MonthName = True
    Scale4Y.DateFormat.DateOrder = doDDMMYY
    Scale4Y.DateFormat.DateForTime = dtOnePerDay
    Scale4Y.DecPlaces = -2
    Scale4Y.Font.Charset = DEFAULT_CHARSET
    Scale4Y.Font.Color = clWindowText
    Scale4Y.Font.Height = -11
    Scale4Y.Font.Name = 'MS Sans Serif'
    Scale4Y.Font.Style = []
    Scale4Y.Logarithmic = False
    Scale4Y.LabelType = ftNum
    Scale4Y.MinTicks = 3
    Scale4Y.MinRange = 0.000000000100000000
    Scale4Y.RangeHigh = 1.000000000000000000
    Scale4Y.ShortTicks = True
    Scale4Y.ScalePos = 0
    Scale4Y.Visible = False
    Scale4Y.ScaleLocation = slLeft
    ShadowStyle = ssFlying
    ShadowColor = clGrayText
    ShadowBakColor = clBtnFace
    TextFontStyle = []
    TextBkStyle = tbClear
    TextBkColor = clWhite
    TextAlignment = taCenter
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 803
    Width = 1312
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end>
  end
  object Edit1: TEdit
    Left = 364
    Top = 57
    Width = 57
    Height = 21
    TabOrder = 4
    Text = '0'
    Visible = False
    OnExit = Edit1Exit
  end
  object lb_tracks: TListBox
    Left = 2
    Top = 48
    Width = 318
    Height = 238
    ItemHeight = 13
    TabOrder = 5
    OnClick = lb_tracksClick
  end
  object cb_exclude_edited: TCheckBox
    Left = 8
    Top = 286
    Width = 181
    Height = 17
    Caption = 'Exclude previously edited tracks'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object btn_id: TButton
    Left = 327
    Top = 32
    Width = 60
    Height = 17
    Caption = 'ID'
    TabOrder = 7
    OnClick = btn_idClick
  end
  object btn_azi: TButton
    Left = 387
    Top = 32
    Width = 52
    Height = 17
    Caption = 'A&zi'
    Enabled = False
    TabOrder = 8
    OnClick = btn_aziClick
  end
  object btn_elev: TButton
    Left = 439
    Top = 32
    Width = 51
    Height = 17
    Caption = 'Ele&v'
    Enabled = False
    TabOrder = 9
    OnClick = btn_elevClick
  end
  object btn_dist: TButton
    Left = 490
    Top = 32
    Width = 50
    Height = 17
    Caption = '&Dist'
    Enabled = False
    TabOrder = 10
    OnClick = btn_distClick
  end
  object btn_dl: TButton
    Left = 541
    Top = 32
    Width = 25
    Height = 17
    Caption = 'dL'
    TabOrder = 11
    OnClick = btn_dlClick
  end
  object btn_ael: TButton
    Left = 567
    Top = 32
    Width = 25
    Height = 17
    Caption = 'aeL'
    TabOrder = 12
    OnClick = btn_aelClick
  end
  object btn_stat: TButton
    Left = 593
    Top = 32
    Width = 40
    Height = 17
    Caption = 'Action'
    TabOrder = 13
    OnClick = btn_statClick
  end
  object btn_store: TButton
    Left = 675
    Top = 246
    Width = 51
    Height = 31
    Caption = '&Store'
    Enabled = False
    TabOrder = 14
    OnClick = btn_storeClick
  end
  object lb_editlog: TListBox
    Left = 675
    Top = 95
    Width = 124
    Height = 145
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 15
  end
  object btn_delsel: TButton
    Left = 732
    Top = 246
    Width = 67
    Height = 31
    Caption = 'Delete selected'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    WordWrap = True
    OnClick = btn_delselClick
  end
  object lb_sqltest: TListBox
    Left = 0
    Top = 731
    Width = 825
    Height = 57
    ItemHeight = 13
    ScrollWidth = 1500
    TabOrder = 17
    Visible = False
  end
  object btn_altitudeplot: TButton
    Left = 439
    Top = 6
    Width = 65
    Height = 20
    Caption = '&Altitude plot'
    TabOrder = 18
    OnClick = btn_altitudeplotClick
  end
  object btn_refreshlist: TButton
    Left = 255
    Top = 23
    Width = 65
    Height = 20
    Caption = '&Refresh list'
    TabOrder = 19
    WordWrap = True
    OnClick = btn_refreshlistClick
  end
  object edt_TargetComment: TEdit
    Left = 107
    Top = 333
    Width = 531
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
  end
  object btn_updateTargetComment: TButton
    Left = 642
    Top = 333
    Width = 49
    Height = 15
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = btn_updateTargetCommentClick
  end
  object edt_AdminComment: TEdit
    Left = 107
    Top = 363
    Width = 531
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
  end
  object Button1: TButton
    Left = 642
    Top = 363
    Width = 49
    Height = 15
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 642
    Top = 348
    Width = 49
    Height = 15
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    TabOrder = 24
    OnClick = Button2Click
  end
  object edt_OverallComment: TEdit
    Left = 107
    Top = 348
    Width = 531
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
  end
  object btn_ClearSQL_log: TButton
    Left = 697
    Top = 330
    Width = 75
    Height = 25
    Caption = 'Clear SQL'
    TabOrder = 26
    OnClick = btn_ClearSQL_logClick
  end
  object cb_SelectSpecies: TComboBox
    Left = 127
    Top = 22
    Width = 122
    Height = 21
    TabOrder = 27
    Text = '< Select taxon >'
  end
  object cb_folder: TComboBox
    Left = 8
    Top = 22
    Width = 57
    Height = 21
    TabOrder = 28
    Text = 'None'
    OnChange = cb_folderChange
  end
  object cb_filnam: TComboBox
    Left = 71
    Top = 22
    Width = 50
    Height = 21
    TabOrder = 29
    Text = 'None'
    OnChange = cb_filnamChange
  end
  object edt_timestamp: TEdit
    Left = 671
    Top = 52
    Width = 128
    Height = 21
    Hint = 'Format YYYY-MM-DD HH:MM:SS'
    TabOrder = 30
  end
  object btn_updateTimestamp: TButton
    Left = 724
    Top = 31
    Width = 75
    Height = 20
    Hint = 'Uppdaterar tidst'#228'mpel i track-tabellen'
    Caption = 'Uppdatera'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    OnClick = btn_updateTimestampClick
  end
  object Rot3D1: TRot3D
    Left = 805
    Top = 8
    Width = 500
    Height = 375
    AllocSize = 1000
    CentX = 225
    CentY = 200
    ColorScheme = csSystem
    ColorCubeFrame = 4210752
    ColorCubeHidLin = 11579568
    ColorCubeFaceLow = clSilver
    ColorCubeFaceHigh = 15658734
    IsoMetric = False
    AutoOrigin = False
    AutoScale = False
    FrameStyle = fsLowered
    Magnification = 0.800000000000000000
    MouseAction = maZoom
    MouseRot3Axes = False
    BoundBoxStyle = bbNone
    BoundBoxSize = 800
    AxDir = adLeftHanded
    AxSize = 700
    AxNameX = 'E'
    AxNameY = 'N'
    AxNameZ = ' '
    ShowAxes = True
    TextFontStyle = []
    TextMarkSize = 8
    ViewAngleX = 180.000000000000000000
    ViewAngleY = 150.000000000000000000
    ViewAngleZ = 210.000000000000000000
  end
  object btn_origo: TButton
    Left = 1224
    Top = 8
    Width = 81
    Height = 24
    Caption = 'Radar'
    TabOrder = 33
    OnClick = btn_origoClick
  end
  object lb_cartesian: TListBox
    Left = 874
    Top = 445
    Width = 167
    Height = 308
    ItemHeight = 13
    TabOrder = 34
    Visible = False
  end
  object btn_panzoom: TButton
    Left = 1248
    Top = 32
    Width = 57
    Height = 24
    Caption = 'Zoom'
    TabOrder = 35
    OnClick = btn_panzoomClick
  end
  object btn_clear: TButton
    Left = 1248
    Top = 56
    Width = 57
    Height = 24
    Caption = 'Clear'
    TabOrder = 36
    OnClick = btn_clearClick
  end
  object cb_autoclear: TCheckBox
    Left = 1256
    Top = 80
    Width = 49
    Height = 27
    Caption = 'Auto Clear'
    Checked = True
    Color = clWhite
    ParentColor = False
    State = cbChecked
    TabOrder = 37
    WordWrap = True
  end
  object btn_delalledits: TButton
    Left = 732
    Top = 283
    Width = 67
    Height = 31
    Caption = 'Delete ALL edits'
    TabOrder = 38
    WordWrap = True
    OnClick = btn_delalleditsClick
  end
  object MainMenu1: TMainMenu
    Left = 742
    Top = 443
    object File1: TMenuItem
      Caption = 'File'
      object Selectdataset: TMenuItem
        Caption = 'Select a dataset'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Edit2: TMenuItem
      Caption = 'Edit'
      object Removeeditingforthistrack1: TMenuItem
        Caption = 'Remove editing for this track'
      end
    end
    object Preferences1: TMenuItem
      Caption = 'Preferences'
      object Definedataset: TMenuItem
        Caption = 'Define new dataset'
        OnClick = DefinedatasetClick
      end
      object Debugmode1: TMenuItem
        Caption = 'Debug mode'
        OnClick = Debugmode1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      OnClick = Help1Click
    end
  end
  object ADOConn: TADOConnection
    ConnectionString = 
      'Provider=PostgreSQL OLE DB Provider;Password=radar;User ID=radar' +
      ';Data Source=localhost;Location=hp85;Extended Properties=""'
    Mode = cmReadWrite
    Provider = 'PostgreSQL OLE DB Provider'
    Left = 289
    Top = 443
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConn
    Parameters = <>
    Left = 374
    Top = 443
  end
  object ADODataSet1: TADODataSet
    CacheSize = 600
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 'SELECT starttime FROM track ORDER BY starttime asc'
    Parameters = <>
    Left = 452
    Top = 443
  end
  object ADODataSet2: TADODataSet
    Connection = ADOConn
    Parameters = <>
    Left = 537
    Top = 443
  end
  object StringArray1: TStringArray
    AllocRowsBy = 10
    NrOfColumns = 1
    NrOfRows = 1
    Left = 606
    Top = 443
  end
  object ADOCommand2: TADOCommand
    Connection = ADOConn
    Parameters = <>
    Left = 668
    Top = 444
  end
end
