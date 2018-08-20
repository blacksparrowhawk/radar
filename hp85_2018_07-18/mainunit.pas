// fix dynamic DB heading string
// OBS OBS OBS  -----   uses OLE DB for LOCAL connection to DB, and ODBC for remote servers......

// To fix: clear edit rule box when changing active track, otherwise edits will be linked to wrong track_id....

// To extend::  I detta eller annat program... Define collections, ex. "Pigeons 1" och l�gg till �ljningr manuellt
// Plot collection - v�lj alla eller urval av ing�ende f�ljningar. V�lj att plotta h�jdgraf, karta el annat

unit mainunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, StrUtils, Math, Menus, SDL_rchart, ComCtrls,
  Buttons, ExtCtrls, IniFiles, DB, ADODB, SDL_dstruct, SDL_Rot3D, SDL_sdlbase;

type
  TForm_main = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Selectdataset: TMenuItem;
    Exit1: TMenuItem;
    Preferences1: TMenuItem;
    RChart1: TRChart;
    RChart2: TRChart;
    StatusBar1: TStatusBar;
    Edit1: TEdit;
    Definedataset: TMenuItem;
    Help1: TMenuItem;
    lb_tracks: TListBox;
    ADOConn: TADOConnection;
    ADOCommand1: TADOCommand;
    ADODataSet1: TADODataSet;
    cb_exclude_edited: TCheckBox;
    ADODataSet2: TADODataSet;
    btn_id: TButton;
    btn_azi: TButton;
    btn_elev: TButton;
    btn_dist: TButton;
    btn_dl: TButton;
    btn_ael: TButton;
    btn_stat: TButton;
    btn_store: TButton;
    Label2: TLabel;
    lb_editlog: TListBox;
    Label4: TLabel;
    StringArray1: TStringArray;
    btn_delsel: TButton;
    lb_sqltest: TListBox;
    ADOCommand2: TADOCommand;
    Debugmode1: TMenuItem;
    lbl_trackquality: TLabel;
    Edit2: TMenuItem;
    Removeeditingforthistrack1: TMenuItem;
    lbl_targettype: TLabel;
    lbl_targetcomment: TLabel;
    lbl_overallcomment: TLabel;
    lbl_admincomment: TLabel;
    btn_altitudeplot: TButton;
    btn_refreshlist: TButton;
    edt_TargetComment: TEdit;
    btn_updateTargetComment: TButton;
    edt_AdminComment: TEdit;
    Button1: TButton;
    Button2: TButton;
    edt_OverallComment: TEdit;
    btn_ClearSQL_log: TButton;
    cb_SelectSpecies: TComboBox;
    cb_folder: TComboBox;
    Label7: TLabel;
    cb_filnam: TComboBox;
    Label8: TLabel;
    edt_timestamp: TEdit;
    btn_updateTimestamp: TButton;
    lbl_Folder: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Rot3D1: TRot3D;
    btn_origo: TButton;
    lbl_id: TLabel;
    lb_cartesian: TListBox;
    btn_panzoom: TButton;
    btn_clear: TButton;
    cb_autoclear: TCheckBox;
    btn_delalledits: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);

    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit1Exit(Sender: TObject);

//    procedure cb_yearChange(Sender: TObject);
//    procedure cb_starttimeChange(Sender: TObject);
    procedure DefinedatasetClick(Sender: TObject);
//    procedure cb_stoptimeChange(Sender: TObject);
    procedure lb_tracksClick(Sender: TObject);
    procedure btn_idClick(Sender: TObject);
    procedure btn_aziClick(Sender: TObject);
    procedure btn_elevClick(Sender: TObject);
    procedure btn_distClick(Sender: TObject);
    procedure btn_dlClick(Sender: TObject);
    procedure btn_aelClick(Sender: TObject);
    procedure btn_statClick(Sender: TObject);
    procedure btn_storeClick(Sender: TObject);
    procedure btn_delselClick(Sender: TObject);
//    procedure cb_datasetChange(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure Debugmode1Click(Sender: TObject);
//    procedure rg_colltypeClick(Sender: TObject);
    procedure btn_altitudeplotClick(Sender: TObject);
    procedure btn_refreshlistClick(Sender: TObject);
    procedure btn_ClearSQL_logClick(Sender: TObject);
    procedure cb_folderChange(Sender: TObject);
    procedure cb_filnamChange(Sender: TObject);
    procedure btn_updateTimestampClick(Sender: TObject);
    procedure btn_origoClick(Sender: TObject);
    procedure btn_updateTargetCommentClick(Sender: TObject);
    procedure btn_clearClick(Sender: TObject);
    procedure btn_panzoomClick(Sender: TObject);
    procedure btn_delalleditsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  published

  end;

var
  Form_main: TForm_main;

implementation

uses dataset_unit;


{$R *.dfm}

 (* "global" vars *)

var  dvect : array of real;
     current_track_id : integer;
     dataset_id : integer;
     debugmode : boolean;
     first_x,first_y : integer;

procedure HandleDrawGraph(which : integer);
var  q,w : integer;
  ymax, ymin : real;
   valid_data : boolean;
   ctrlchar : string;
   scalemarg : real;
begin

   valid_data:=true;
   SetLength(dvect,Form_main.StringGrid1.RowCount);
     for q:=0 to Form_main.StringGrid1.RowCount-1 do
      begin
         ctrlchar:=AnsiUpperCase(Form_main.StringGrid1.Cells[6,q]);
        if (ctrlchar[1]='D') then
          valid_data:=false;
        if (AnsiUpperCase(Form_main.StringGrid1.Cells[6,q])='E') then
          valid_data:=true;
        if ((valid_data) AND (ctrlchar[1]<>'S')) then
         begin
          if (which=4) then // if altitude
           dvect[q]:=StrToFloat(Form_main.StringGrid1.Cells[3,q])*sin(DegToRad(StrToFloat(Form_main.StringGrid1.Cells[2,q])))
          else
           dvect[q]:=StrToFloat(Form_main.StringGrid1.Cells[which,q]); // If not altitude
         end
        else
         dvect[q]:=-20000;    // dirty...  flag value for deleted data...
      end;
     Form_main.RChart1.Scale1X.RangeLow:=StrToInt(Form_main.StringGrid1.Cells[0,0]);  // Set Xmin to value of 1st cell in col 1
     Form_main.RChart1.Scale1X.RangeHigh:=Form_main.RChart1.Scale1X.RangeLow+Form_main.StringGrid1.RowCount-1; // Set Xmin to value of 1st cell in col 1 + number of rows -1
     With Form_main.RChart1.Scale1Y do
      Case which of
        1 : begin {Azimuth}
               RangeLow:=-2;  RangeHigh:=360;   Caption:='[deg.]';
               Form_main.RChart1.Caption:='Azimuth';   scalemarg:=3;
            end;
        2 : begin {Elevation}
               RangeLow:=-3; RangeHigh:=91;    Caption:='[deg.]';
               Form_main.RChart1.Caption:='Elevation'; scalemarg:=0.5;
            end;
        3 : begin {Distance}
               RangeLow:=-2;  RangeHigh:=25000; Caption:='[m]';
               Form_main.RChart1.Caption:='Distance';  scalemarg:=50;
            end;
        4 : begin {Altitude}
               RangeLow:=-2;  RangeHigh:=4000; Caption:='[m]';
               Form_main.RChart1.Caption:='Altitude';  scalemarg:=10;
            end
         else scalemarg:=1;
      end;

     Form_main.RChart1.ClearGraf;
     Form_main.RChart2.Scale1Y.Caption:=Form_main.RChart1.Scale1Y.Caption;
     Form_main.RChart2.Caption:=Form_main.RChart1.Caption;
    // Form_main.RChart1.DataColor:=clFuchsia;
     q:=0;
     // Move chart1 cursor to first datapoint
     if dvect[0]>-20000 then
      Form_main.RChart1.MoveTo(StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[0])
     else
      begin
       q:=0;
       repeat
        inc(q);
       until (dvect[q]>-20000);
       Form_main.RChart1.MoveTo(q+StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[q]);
      end;

     // Draw chart1 dataline
     for w:= q to Form_main.StringGrid1.RowCount-1 do          //2
      begin
          if (dvect[w]=-20000) then
            Form_main.RChart1.DataColor:=clYellow
          else begin
            Form_main.RChart1.DrawTo(w+StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[w]);
            Form_main.RChart1.DataColor:=clRed;
          end;
      end; {for w ...}

     Form_main.RChart1.ShowGrafNewOnly;

     Form_main.RChart1.Scale1X.RangeLow:=StrToInt(Form_main.StringGrid1.Cells[0,0]);  // get Xmin from first ID
     Form_main.RChart1.Scale1X.RangeHigh:=Form_main.RChart1.Scale1X.RangeLow+Form_main.StringGrid1.RowCount-1;
     ymax:=-20000; ymin:=10000;

     // Calculate scaling for lower chart
     for w:= q to Form_main.StringGrid1.RowCount-1 do
      begin
       if dvect[w]>ymax then ymax:=dvect[w];
       if ((dvect[w]<ymin) AND (dvect[w]>-20000))then ymin:=dvect[w];
      end;
     Form_main.RChart2.Scale1Y.RangeLow:=ymin-scalemarg;
     Form_main.RChart2.Scale1Y.RangeHigh:=ymax+scalemarg;
     Form_main.RChart2.Scale1X.RangeLow:=Form_main.RChart1.Scale1X.RangeLow;
     Form_main.RChart2.Scale1X.RangeHigh:=Form_main.RChart1.Scale1X.RangeHigh;
     Form_main.RChart2.ClearGraf;
     Form_main.RChart2.DataColor:=clRed;

     // Move chart2 cursor to first datapoint
     if dvect[0]>-20000 then
      Form_main.RChart2.MoveTo(StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[0])
     else
      begin
       q:=0;
       repeat
        inc(q);
       until (dvect[q]>-20000);
       Form_main.RChart2.MoveTo(q+StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[q]);
      end;

     // Draw chart2 dataline
     for w:= q to Form_main.StringGrid1.RowCount-1 do
      begin
(*        If (dvect[w]>-20000) then
           Form_main.RChart2.DrawTo(w+StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[w])
        else
           Form_main.RChart2.MoveTo(w+StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[w]); *)
       if (dvect[w]=-20000) then
          Form_main.RChart2.DataColor:=clBlack
       else begin
         Form_main.RChart2.DrawTo(w+StrToInt(Form_main.StringGrid1.Cells[0,0]),dvect[w]);
         Form_main.RChart2.DataColor:=clRed;
       end;
      end; {for w ...}

     // Plot tickmarks in chart2 ?
     Form_main.RChart2.DataColor:=clRed;
     Form_main.RChart2.ShowGraf;
end;


procedure TForm_main.FormCreate(Sender: TObject);

type
  Latin1String = type AnsiString(28591);
  Win1252String = type AnsiString(1252);

  var AppIniFile : TIniFile;
    i,count : integer;
    sql : string;
//    tmpstr : string;
    tmpstr : Win1252String;
//     tmpstr : Widestring;
    tmpstrAnsi : AnsiString;
    tmpstrWin : Win1252String;
    tmpstrUTF : UTF8string;
    tmpstrLat : Latin1String;

    begin
  AppIniFile := TIniFile.Create('trackfile.ini');
  debugmode:=false;
  debugmode:=true;
  btn_ClearSQL_log.Visible:=false;
  AppIniFile.Free;
  dataset_id:=1;
  //rg_colltype.ItemIndex:=0;
  current_track_id:=0;
  Rot3D1.CentX:=Trunc(Rot3d1.Width/2);
  Rot3D1.CentY:=Trunc(Rot3d1.Height/2);
  Rot3D1.SetViewAngles(180,0,0);

(*
  sql:='SELECT * FROM dataset';
//  ADOConn.ConnectionString:='Provider=PostgreSQL.1;Password=radar;User ID=radar;Data Source=localhost;Location=radar2006;Extended Properties=""';
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  if count>0 then begin
  ADOdataset1.Recordset.MoveFirst;
  for i:=0 to count-1 do
   begin
    cb_dataset.Items.Add(String(ADOdataset1.Recordset.Fields.Item['dataset_name'].Value));
    ADOdataset1.Recordset.MoveNext;
   end;

  end;
   *)
  sql:='SELECT distinct folder from track order by folder';
//  ADOConn.ConnectionString:='Provider=PostgreSQL.1;Password=radar;User ID=radar;Data Source=localhost;Location=radar2006;Extended Properties=""';
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  if count>0 then begin
  ADOdataset1.Recordset.MoveFirst;
  for i:=0 to count-1 do
   begin
    cb_folder.Items.Add(String(ADOdataset1.Recordset.Fields.Item['folder'].Value));
    ADOdataset1.Recordset.MoveNext;
   end;
  end;


  sql:='SELECT distinct date_part(''year'',starttime) as year FROM track WHERE true ';
 // if cb_excludecrap.Checked then sql:=sql+'AND track_quality!=''C'' ';
 // sql:=sql+' AND collection_type=';
 // if (rg_colltype.ItemIndex=0) then sql:=sql+'''B''' else sql:=sql+'''W''';
  sql:=sql+' ORDER BY year asc';
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  ADOdataset1.Recordset.MoveFirst;
(*  for i:=0 to count-1 do
   begin
    cb_year.Items.Add(String(ADOdataset1.Recordset.Fields.Item['year'].Value));
    ADOdataset1.Recordset.MoveNext;
   end;
   *)
  // cb_year.Itemindex:=0;
  // Add items to select species box
  sql:='SELECT DISTINCT identification FROM track ORDER BY identification';
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  ADOdataset1.Recordset.MoveFirst;
  for i:=0 to count-1 do
   begin
    tmpstr:=UTF8toAnsi(ADOdataset1.Recordset.Fields.Item['identification'].Value);
//    tmpstrUTF:=String(ADOdataset1.Recordset.Fields.Item['identification'].Value);
//    tmpstrLat:= Latin1String(tmpstrUTF);
//    tmpstr:=Utf8ToAnsi(ADOdataset1.Recordset.Fields.Item['identification'].Value);
//    tmpstr:=tmpstr+' '+tmpstr.
//    cb_SelectSpecies.Items.Add(tmpstrLat);
    cb_SelectSpecies.Items.Add(tmpstr);
    ADOdataset1.Recordset.MoveNext;
   end;
  if cb_SelectSpecies.Items.Encoding <> nil then
    cb_SelectSpecies.Items.Add(cb_SelectSpecies.Items.Encoding.EncodingName);
  NullStrictConvert:=false; // Prevents reading of NULL from db cause exception
end;


procedure TForm_main.FormResize(Sender: TObject);
var cli_hei : integer;
    diag_area : integer;
begin
  cli_hei:=Form_main.ClientHeight-Statusbar1.Height-2;
//  StringGrid1.Height:=trunc(cli_hei/2)-StringGrid1.Top;
//  StringGrid1.Width:=Form_main.ClientWidth-StringGrid1.Left;

  RChart1.Left:=1;
  RChart1.Top:=StringGrid1.Top+StringGrid1.Height+112;
  RChart1.Width:=Form_main.ClientWidth-2;
  diag_area:=Form_main.ClientHeight-(StringGrid1.Top+StringGrid1.Height+StatusBar1.Height+80);
  RChart1.Height:=trunc(diag_area/2);

  RChart2.Left:=RChart1.Left;
  RChart2.Top:=RChart1.Top+RChart1.Height+1;
  RChart2.Width:=RChart1.Width;
  RChart2.Height:=RChart1.Height;
  StatusBar1.Panels[0].Width:=Trunc(ClientWidth/4);
  StatusBar1.Panels[1].Width:=Trunc(ClientWidth/4);
  StatusBar1.Panels[2].Width:=Trunc(ClientWidth/4);
  StatusBar1.Panels[3].Width:=Trunc(ClientWidth/4);

end;

procedure TForm_main.FormClose(Sender: TObject; var Action: TCloseAction);
var AppIniFile : TIniFile;
begin
  AppIniFile := TIniFile.Create('trackfile.ini');
  AppIniFile.Free;
  try
   { }
  finally
  end;
end;

procedure TForm_main.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm_main.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  StringGrid1.Canvas.TextRect(Rect,Rect.Left+1,Rect.Top,StringGrid1.Cells[ACol,ARow]);
end;

procedure TForm_main.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow : Integer; var CanSelect: Boolean);

var
  R : TRect;

begin
  if (ACol IN [1,2,3,6]) then begin   // do not allow edit for ID,dL or aeL
    R := StringGrid1.CellRect(ACol, ARow);
    R.Left := R.Left + StringGrid1.Left;
    R.Right := R.Right + StringGrid1.Left;
    R.Top := R.Top + StringGrid1.Top;
    R.Bottom := R.Bottom + StringGrid1.Top;
    Edit1.Left := R.Left + 1;
    Edit1.Top := R.Top + 1;
    Edit1.Width := (R.Right + 1) - R.Left;
    Edit1.Height := (R.Bottom + 1) - R.Top;
   {Show the Edit}
    Edit1.Visible := True;
    Edit1.SetFocus;
    Edit1.Text:=StringGrid1.Cells[Acol,Arow];
    CanSelect:=true;
  end;
end;


procedure TForm_main.Edit1Exit(Sender: TObject);
var logrec : string;
begin
 If (StrComp(PChar(StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row]),PChar(Edit1.Text))<>0) then
  begin  {Get the Edit content and place in the grid}
   if StringGrid1.Col=6 then  // Special case for edit action column
    begin
     Edit1.Text:=Trim(Edit1.Text); If (Edit1.Text='') then Edit1.Text:='-'; // ... or crash ...
     if ((Edit1.Text[1] IN ['D','d','E','e','S','s','-']) AND (StrLen(PChar(Edit1.Text))=1))then
      begin
       StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row] :=Edit1.Text;
      // StringGrid1.Rows[StringGrid1.Row].QuoteChar:='Q';
      end
     else
       ShowMessage('Invalid Edit code!! Must be only one character ("s","d","e" or "-" ');
    end // end if action column
   else // otherwise, just replace grid cell content with edit
     StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row] :=Edit1.Text;

   case StringGrid1.Col of
//     1 : logrec:=StringGrid1.Cells[0,StringGrid1.Row]+' Azi '+Edit1.Text;
     1 : logrec:=StringGrid1.Cells[0,StringGrid1.Row]+' Azi '+StringReplace(Edit1.Text,',','.',[rfReplaceAll,rfIgnoreCase]);
     2 : logrec:=StringGrid1.Cells[0,StringGrid1.Row]+' Ele '+StringReplace(Edit1.Text,',','.',[rfReplaceAll,rfIgnoreCase]);
     3 : logrec:=StringGrid1.Cells[0,StringGrid1.Row]+' Dist '+StringReplace(Edit1.Text,',','.',[rfReplaceAll,rfIgnoreCase]);
     6 : begin
          if ((Edit1.Text[1] IN ['d','D']) AND (StrLen(PChar(Edit1.Text))=1)) then
            logrec:=StringGrid1.Cells[0,StringGrid1.Row]+' start delete '+Edit1.Text else
          if ((Edit1.Text[1] IN ['e','E']) AND (StrLen(PChar(Edit1.Text))=1)) then
            logrec:=StringGrid1.Cells[0,StringGrid1.Row]+' end delete '+Edit1.Text else
          if ((Edit1.Text[1] IN ['s','S']) AND (StrLen(PChar(Edit1.Text))=1)) then
            logrec:=StringGrid1.Cells[0,StringGrid1.Row]+' line delete '+Edit1.Text;
         end;
   end;
   if (Length(logrec)>0) then
      lb_editlog.Items.Add(logrec);  // f�r in editeringinstruktion i lb_editlog
   // Avsnittet nedan var borttaget i denna version (men varf�r)?
   (*
   if (Edit1.Text<>'-') then
    if ((Edit1.Text<>'-') AND (StrLen(PChar(Edit1.Text))=1)) then
     begin
       if (StrLen(PChar(Edit1.Text))=1) then // this is an action
         begin
           logrec:=StringGrid1.Cells[0,StringGrid1.Row]+logrec+Edit1.Text;
           lb_editlog.Items.Add(logrec);
         end;
     end;
    *)
  end; // end if content has changed
  Edit1.Visible := False;
  StringGrid1.SetFocus;
end;
(*
procedure TForm_main.cb_yearChange(Sender: TObject);
var i, count : integer;
    selectedyear : string;
    sql : string;
begin
  selectedyear:=cb_year.Items[cb_year.Itemindex];

  sql:='SELECT starttime FROM track WHERE date_part(''year'',starttime)='+selectedyear;
 // if cb_excludecrap.Checked then sql:=sql+' AND track_quality!=''C'' ';
  sql:=sql+' AND collection_type=';
  if (rg_colltype.ItemIndex=0) then sql:=sql+'''B''' else sql:=sql+'''W''';
  sql:=sql+' ORDER BY starttime asc';

  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  Statusbar1.Panels[3].Text:='Track Count: '+IntToStr(count);
  ADOdataset1.Recordset.MoveFirst;
  cb_starttime.Items.Clear;
  for i:=0 to count-1 do
   begin
    cb_starttime.Items.Add(String(ADOdataset1.Recordset.Fields.Item['starttime'].Value));
    ADOdataset1.Recordset.MoveNext;
   end;
  // cb_starttime.ItemIndex:=0;

end;
*)
(*
procedure TForm_main.cb_starttimeChange(Sender: TObject);
var i, count : integer;
    selectedstarttime : string;
    mysql : string;
begin
  selectedstarttime:=cb_starttime.Items[cb_starttime.Itemindex];
  mysql:='SELECT starttime FROM track WHERE starttime>='''+selectedstarttime+''' ORDER BY starttime asc';
  ADOCommand1.CommandText:=mysql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  Statusbar1.Panels[3].Text:='Track Count: '+IntToStr(count);
  ADOdataset1.Recordset.Sort;
  ADOdataset1.Recordset.MoveFirst;
  cb_stoptime.Items.Clear;
  for i:=0 to count-1 do
   begin
    cb_stoptime.Items.Add(String(ADOdataset1.Recordset.Fields.Item['starttime'].Value));
    ADOdataset1.Recordset.MoveNext;
   end;
  cb_stoptime.Items.Add('<select stoptime>');
  cb_stoptime.ItemIndex:=count;
end;
*)
procedure TForm_main.DefinedatasetClick(Sender: TObject);
begin
  frm_dataset.visible:=true;
end;
(*
procedure TForm_main.cb_stoptimeChange(Sender: TObject);
var    selectedstarttime,selectedstoptime : string;
       i, count : integer;
       mysql : string;
       track_id, editcount : string;
       lb_string : string;
begin
//  selectedstarttime:=cb_starttime.Items[cb_starttime.Itemindex];
  selectedstoptime:=cb_stoptime.Items[cb_stoptime.Itemindex];
  mysql:='SELECT track_id,starttime FROM track WHERE collection_type=';
  if (rg_colltype.itemindex=0) then mysql:=mysql+'''B'' ' else
  mysql:=mysql+'''W'' ';
 // if (cb_excludecrap.Checked=true) then mysql:=mysql+' AND track_quality<>''C''';
  // TODO : s�tt samma villkor p� selectboxar f�r datumavgr�nsning!
  mysql:=mysql+' AND starttime>='''+selectedstarttime+''' AND starttime<='''+selectedstoptime+'''';
  if cb_exclude_edited.Checked then mysql:=mysql+' AND track_id NOT IN (SELECT distinct track_id FROM trackedit WHERE dataset_id='+IntToStr(dataset_id)+') ';
  mysql:=mysql+' ORDER BY starttime asc';
  lb_sqltest.Items.Add(mysql);
  ADOCommand1.CommandText:=mysql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  Statusbar1.Panels[3].Text:='Track Count: '+IntToStr(count);
  ADOdataset1.Recordset.Sort;
  if count>0 then ADOdataset1.Recordset.MoveFirst;
  lb_tracks.Items.Clear;
  for i:=0 to count-1 do
   begin
    track_id:=String(ADOdataset1.Recordset.Fields.Item['track_id'].Value);
    mysql:='SELECT count* from trackedit where track_id='+track_id+' AND dataset_id='+IntToStr(dataset_id);
    ADOCommand1.CommandText:=mysql;
    ADOdataset2.Recordset:=ADOCommand1.Execute;
    editcount:=(String(ADOdataset2.Recordset.Fields.Item['count'].Value));
    lb_string:=String(ADOdataset1.Recordset.Fields.Item['starttime'].Value);
    lb_string:=lb_string+' [ID:'+track_id+'] [edit: '+editcount+']';
    lb_tracks.Items.Add(lb_string);
    ADOdataset1.Recordset.MoveNext;
   end;
 // cb_stoptime.ItemIndex:=count-1;

end;
*)

procedure TForm_main.lb_tracksClick(Sender: TObject);
var starttime,sql,sql2,track_id_list, track_id_db : string;
    q,rcount,row, editcount : integer;
    comment,edtTmpStr : string;
    editrecords : array of integer;
    ListRowItems: TArray<String>;
    x,y,z : integer;
    oldcoords : array[0..1] of real;
    first_valid_point : boolean;

function in_editrecords (id:string):boolean;
var q : integer;
begin
 in_editrecords:=false;
 for q:=0 to High(editrecords) do
  if (StrToInt(id)=editrecords[q]) then in_editrecords:=true;
end;

begin
 //    TODO:
 first_valid_point := true;
 lb_editlog.Items.Clear;
 lb_cartesian.Items.Clear;
 if (cb_autoclear.Checked) then begin Rot3D1.Clear; Rot3D1.MakeVisible; end;
 Form_main.RChart1.ClearGraf;Form_main.RChart2.ClearGraf;
 btn_store.Enabled:=true; btn_altitudeplot.Enabled:=true;
 editcount:=0; edt_timestamp.Text:='';track_id_list:=''; track_id_db:='';
 edt_Targetcomment.Text:='No data';
 edt_OverallComment.Text:='No data';edt_AdminComment.Text:='No data';
 first_x:=0; first_y:=0;
 ListRowItems := lb_tracks.Items[lb_tracks.Itemindex].Split([' ']);
 track_id_list:=ListRowItems[0];
 edt_timestamp.Text:=ListRowItems[7]+' '+ListRowItems[8];

 sql:='SELECT track_id, target_comment, overall_comment, admin_comment, target_type, track_quality,';
 sql:=sql+' time_str, identification, interval_t FROM track WHERE track_id='''+track_id_list+'''';
 // if (debugmode) then
 lb_sqltest.Items.Add('1: '+sql);
 ADOCommand1.CommandText:=sql; ADODataset1.Recordset:=ADOCommand1.Execute;
 track_id_db:=String(ADOdataset1.Recordset.Fields.Item['track_id'].Value);

 if (StrToInt(trim(track_id_list))<>StrToInt(trim(track_id_db))) then begin ShowMessage('Mismatch in track_id ('+track_id_list+':'+track_id_db+')') end;

 edt_Targetcomment.Text:=String(ADOdataset1.Recordset.Fields.Item['target_comment'].Value);
 edt_OverallComment.Text:=String(ADOdataset1.Recordset.Fields.Item['overall_comment'].Value);
 edt_AdminComment.Text:=String(ADOdataset1.Recordset.Fields.Item['admin_comment'].Value);

 current_track_id:=StrToInt(track_id_db);

 lbl_trackquality.Caption:='Track quality: '+String(ADOdataset1.Recordset.Fields.Item['track_quality'].Value);
 lbl_targettype.Caption:='Target type: '+String(ADOdataset1.Recordset.Fields.Item['target_type'].Value);
 lbl_id.Caption:='Identification: '+String(ADOdataset1.Recordset.Fields.Item['identification'].Value);

// sql:='SELECT * FROM trackpoint WHERE track_id='+track_id+' ORDER BY trackpoint_id ASC';  // gamla
 sql:='SELECT * FROM trackpoint WHERE track_id='+track_id_db+' AND read IS NULL ORDER BY trackpoint_id ASC'; // hack f�r HP85
 lb_sqltest.Items.Add('2:'+sql);
 ADOCommand1.CommandText:=sql;
 ADODataset1.Recordset:=ADOCommand1.Execute;
 ADOdataset1.Recordset.MoveFirst;
 rcount:=ADOdataset1.RecordCount;

 // Check for number of delete edits (?)
 sql2:='SELECT count(*) FROM trackedit WHERE trackpoint_id IS NOT NULL AND dataset_id='+IntToStr(dataset_id)+' AND deleted=true AND track_id='+track_id_db;
 lb_sqltest.Items.Add('3:'+sql2);
 ADOCommand1.CommandText:=sql2;
 ADODataset2.Recordset:=ADOCommand1.Execute;
 editcount:=StrToInt(String(ADODataset2.Recordset.Fields.Item['count'].Value));

 if (editcount>0) then  // there has been edits
  begin
   sql2:='SELECT trackpoint_id FROM trackedit WHERE trackpoint_id IS NOT NULL AND dataset_id='+IntToStr(dataset_id)
         +' AND deleted=true AND track_id='+track_id_db+' ORDER by trackpoint_id ASC';
   lb_sqltest.Items.Add('4:'+sql2+'  | editcount is '+IntToStr(editcount));
   ADOCommand1.CommandText:=sql2;
   ADODataset2.Recordset:=ADOCommand1.Execute;
   SetLength(editrecords,editcount);
   ADODataset2.Recordset.MoveFirst;
   edtTmpStr:='';
   for q:=0 to editcount-1 do
    begin
     editrecords[q]:=ADODataset2.Recordset.Fields.Item['trackpoint_id'].Value;
     ADODataset2.Recordset.MoveNext;
    end;
  end;

  // List edits that have been made - this wa added 2012-04
  sql2:='SELECT count(*) FROM trackedit WHERE trackpoint_id IS NOT NULL AND dataset_id='+IntToStr(dataset_id)+' AND track_id='+track_id_db;
  lb_sqltest.Items.Add('5: sql: '+sql2);
  ADOCommand1.CommandText:=sql2;
  ADODataset2.Recordset:=ADOCommand1.Execute;
  editcount:=StrToInt(String(ADODataset2.Recordset.Fields.Item['count'].Value));
  lb_sqltest.Items.Add('5: editcount: '+IntToStr(editcount));
  if (editcount>0) then
   begin
    sql2:='SELECT * FROM trackedit WHERE trackpoint_id IS NOT NULL AND dataset_id='+IntToStr(dataset_id)+' AND track_id='+track_id_db+' ORDER by trackpoint_id ASC';
    lb_sqltest.Items.Add('6:'+sql2+'  | editcount is '+IntToStr(editcount));
    ADOCommand1.CommandText:=sql2;
    ADODataset2.Recordset:=ADOCommand1.Execute;
    ADODataset2.Recordset.MoveFirst;
    lb_sqltest.Items.Add('Recordcount:'+IntToStr(ADODataset2.RecordCount));
    edtTmpStr:='';
//    for q:=0 to editcount-1 do
    for q:=0 to ADODataset2.RecordCount-1 do
     begin
      edtTmpStr:='* '+String(ADODataset2.Recordset.Fields.Item['trackpoint_id'].Value);
      edtTmpStr:=edtTmpStr+' '+String(ADODataset2.Recordset.Fields.Item['datachange_type'].Value);
      if (String(ADODataset2.Recordset.Fields.Item['deleted'].Value)='True') then
        edtTmpStr:=edtTmpStr+' line delete s';
   // typecast...   edtTmpStr:=edtTmpStr+' '+ADODataset2.Recordset.Fields.Item['new_value'].Value;
      edtTmpStr:=trim(edtTmpStr);
      lb_sqltest.Items.Add('5: edtTmpStr: '+edtTmpStr);
      If (length(edtTmpStr)>0) then lb_editlog.Items.Add(edtTmpStr);
      ADODataset2.Recordset.MoveNext;
   //   Label5.Caption:=IntToStr(q);
     end;
   end;
  // end addition 2012-04
 StatusBar1.Panels[2].Text:='Count: '+IntToStr(rcount);
 With StringGrid1 do
  begin
   TopRow:=0;
   Visible:=true;
   ColCount:=7;
   RowCount:=rcount;
   Canvas.Font.Name:='Verdana';
   Font.Size:=12;
   Font.Style:=[fsBold];
   ColWidths[0]:=60;
   ColWidths[1]:=50;
   ColWidths[2]:=50;
   ColWidths[3]:=50;
   ColWidths[4]:=25;
   ColWidths[5]:=25;
   ColWidths[6]:=30;
  end;
  // ADOdataset1.Active:=true;
  StatusBar1.Panels[2].Text:=StatusBar1.Panels[2].Text+' StringGrid.Rowcount:'+IntToStr(StringGrid1.RowCount);
(*  StringGrid1.Cells[0,0]:=String(ADOdataset1.Recordset.Fields.Item['trackpoint_id'].Value);
  StringGrid1.Cells[1,0]:=String(ADOdataset1.Recordset.Fields.Item['azimuth'].Value);
  StringGrid1.Cells[2,0]:=String(ADOdataset1.Recordset.Fields.Item['elevation'].Value);
  StringGrid1.Cells[3,0]:=String(ADOdataset1.Recordset.Fields.Item['distance'].Value);
  StringGrid1.Cells[4,0]:=String(ADOdataset1.Recordset.Fields.Item['dist_locked'].Value)[1];
  StringGrid1.Cells[5,0]:=String(ADOdataset1.Recordset.Fields.Item['aziele_locked'].Value)[1];
  StringGrid1.Cells[6,0]:='-';
  x:=round(StrToInt(String(ADOdataset1.Recordset.Fields.Item['distance'].Value))*cos(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['elevation'].Value))*pi/180)*sin(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['azimuth'].Value))*pi/180));
  y:=round(StrToInt(String(ADOdataset1.Recordset.Fields.Item['distance'].Value))*cos(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['elevation'].Value))*pi/180)*cos(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['azimuth'].Value))*pi/180));
  lb_cartesian.Items.Add('0: X:'+IntToStr(x)+' Y:'+IntToStr(y));
  Rot3D1.MarkAt(x,y,0,39);
  oldcoords[0]:=x; oldcoords[1]:=y;
  first_x:=x; first_y:=y;
  Rot3D1.MakeVisible; *)
  for row:= 0 to rcount-1 do
    begin
    // ADOdataset1.Recordset.MoveNext;
   //  ADOdataset1.FieldValues['trackpoint_id';]
     StringGrid1.Cells[0,row]:=String(ADOdataset1.Recordset.Fields.Item['trackpoint_id'].Value);
     StringGrid1.Cells[1,row]:=String(ADOdataset1.Recordset.Fields.Item['azimuth'].Value);
     StringGrid1.Cells[2,row]:=String(ADOdataset1.Recordset.Fields.Item['elevation'].Value);
     StringGrid1.Cells[3,row]:=String(ADOdataset1.Recordset.Fields.Item['distance'].Value);
     StringGrid1.Cells[4,row]:=String(ADOdataset1.Recordset.Fields.Item['dist_locked'].Value)[1];
     StringGrid1.Cells[5,row]:=String(ADOdataset1.Recordset.Fields.Item['aziele_locked'].Value)[1];

     // Check if this point is deleted...
     if in_editrecords(String(ADOdataset1.Recordset.Fields.Item['trackpoint_id'].Value)) then
      StringGrid1.Cells[6,row]:='s'
     else
      begin
        StringGrid1.Cells[6,row]:='-';
        x:=round(StrToInt(String(ADOdataset1.Recordset.Fields.Item['distance'].Value))*cos(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['elevation'].Value))*pi/180)*sin(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['azimuth'].Value))*pi/180));
        y:=round(StrToInt(String(ADOdataset1.Recordset.Fields.Item['distance'].Value))*cos(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['elevation'].Value))*pi/180)*cos(StrToFloat(String(ADOdataset1.Recordset.Fields.Item['azimuth'].Value))*pi/180));
        lb_cartesian.Items.Add('0: X:'+IntToStr(x)+' Y:'+IntToStr(y));
        Rot3D1.MarkAt(x,y,0,16);
        if (first_valid_point=true) then
         begin
           first_valid_point:=false;
           first_x:=x; first_y:=y;
           // Rot3D1.MakeVisible;
         end
        else
         Rot3D1.Line(oldcoords[0],oldcoords[1],0,x,y,0);
        oldcoords[0]:=x;  oldcoords[1]:=y;
        Rot3D1.MakeVisible;
      end;
       ADOdataset1.Recordset.MoveNext;
    end;
  Rot3D1.MarkAt(0,-100,0,124);
  Rot3D1.MarkAt(500,-100,0,124);
  Rot3D1.MakeVisible;
  btn_azi.Enabled:=true; btn_elev.Enabled:=true; btn_dist.Enabled:=true;

end;    // TForm_main.lb_tracksClick

procedure TForm_main.btn_aziClick(Sender: TObject);
begin
 HandleDrawGraph(1);
end;

procedure TForm_main.btn_ClearSQL_logClick(Sender: TObject);
begin
 lb_sqltest.Items.Clear;
end;

procedure TForm_main.btn_elevClick(Sender: TObject);
begin
 HandleDrawGraph(2);
end;

procedure TForm_main.btn_origoClick(Sender: TObject);
begin
  Rot3D1.MouseAction:=maZoom;
  Rot3D1.CentX:=Trunc(Rot3d1.Width/2);
  Rot3D1.CentY:=Trunc(Rot3d1.Height/2);
  Rot3D1.SetViewAngles(180,0,0);
  if (btn_origo.Caption='Track Start') then
   begin
    Rot3D1.SetOrigins(0,0,0);
    btn_origo.Caption:='Radar';
    Rot3D1.RemoveLastItem;
    Rot3D1.RemoveLastItem;
    Rot3D1.MarkAt(0,-100,0,124);
    Rot3D1.MarkAt(500,-100,0,124);
   end
   else
   begin
    Rot3D1.SetOrigins(first_x,first_y,0);
    lb_cartesian.Items.Add('first_x: '+IntToStr(first_x)+' first_y:'+IntToStr(first_y));
    btn_origo.Caption:='Track Start';
    Rot3D1.RemoveLastItem;
    Rot3D1.RemoveLastItem;
    Rot3D1.MarkAt(first_x,(-100+first_y),0,124);
    Rot3D1.MarkAt((500+first_x),(-100+first_y),0,124);
//    Rot3D1.RemoveFirstItem;  // Ingen bra id�, kommer att t�mma grafen :-)
   end;
  Rot3D1.MakeVisible;

//  oldcoords[0]:=true_x;oldcoords[1]:=true_y;oldcoords[2]:=true_z;           // store new values into oldcoords
(* // Move centre of image between first datapoint or radar
   With Rot3D1 do
  begin
   If RG_origo.ItemIndex=0 then
     begin
      SetOrigins(0,0,0);
     end
   else
     begin
      SetOrigins(first_x,first_y,first_z);
     end;
   MakeVisible; // Not necessary, but will redraw faster...
  end;
 *)
end;

procedure TForm_main.btn_panzoomClick(Sender: TObject);
begin
  If btn_panzoom.Caption='Pan' then
  begin
   btn_panzoom.Caption:='Zoom'; Rot3D1.MouseAction:=maPan;
  end
 else
  begin
   btn_panzoom.Caption:='Pan';  Rot3D1.MouseAction:=maZoom;
  end;
 Rot3d1.MakeVisible;
end;

procedure TForm_main.btn_clearClick(Sender: TObject);
begin
  Rot3D1.Clear;
  Rot3D1.CentX:=Trunc(Rot3d1.Width/2);
  Rot3D1.CentY:=Trunc(Rot3d1.Height/2);
  Rot3D1.SetViewAngles(180,0,0);
  Rot3D1.Update;
  Rot3D1.MakeVisible;
end;

procedure TForm_main.btn_distClick(Sender: TObject);
begin
 HandleDrawGraph(3);
end;

procedure TForm_main.btn_altitudeplotClick(Sender: TObject);
begin
 HandleDrawGraph(4);
end;

procedure TForm_main.btn_idClick(Sender: TObject);
begin
 Showmessage('Cant graph or edit ID');
end;

procedure TForm_main.btn_dlClick(Sender: TObject);
begin
 Showmessage('Cant graph or edit distance Locked');
end;

procedure TForm_main.btn_aelClick(Sender: TObject);
begin
 Showmessage('Cant graph or edit azimuth/elevation Locked');
end;

procedure TForm_main.btn_statClick(Sender: TObject);
begin
 Showmessage('Edit in cells:   D = start delete    E = end delete    S = delete only current row');
end;

procedure TForm_main.btn_storeClick(Sender: TObject);
var   sql,sql1,sql2,start_del_id,end_del_id : string;
      i, j, q, start_del_id_int,end_del_id_int : integer;
      subs : Tstrings;
      rows : integer;
      must_loop_delete : boolean;
      reply_count : integer;
      tmpstr : string;
      trackpoints : array of integer;
begin
 // List index out of bounds h�r n�nstans, bara n�r det finns rader
 reply_count:=0; end_del_id_int:=0; start_del_id_int:=0; must_loop_delete:=false; btn_altitudeplot.Enabled:=false;
 lb_sqltest.Items.Add('-- New track selected - edits:'+IntToStr(lb_editlog.Items.Count)); StatusBar1.Panels[1].Text:='RowCount: '+IntToStr(StringGrid1.RowCount);
 ADOConn.CursorLocation:=clUseServer; // ?
 // Nytt avsnitt h�r som tar bort rader som b�rjar med asterisk
if lb_editlog.Items.Count>0 then
  begin
     (*
    // Check if any *-marked items have been removed -> then delete instruction in DB shoudl be removed
    sql2:='SELECT trackpoint_id FROM trackedit WHERE track_id='+IntToStr(current_track_id)+' AND deleted=true ORDER by trackpoint_id ASC';
    ADOCommand1.CommandText:=sql2;
    ADODataset2.Recordset:=ADOCommand1.Execute;
    if ADODataset2.RecordCount>0 then

    ADODataset2.Recordset.MoveFirst;
    SetLength(trackpoints,ADODataset2.RecordCount);
    for q:=0 to ADODataset2.RecordCount-1 do
     begin
  //    tmpstr:=IntToStr(q)+': '+String(ADODataset2.Recordset.Fields.Item['trackpoint_id'].Value);
      trackpoints[q]:=StrToInt(String(ADODataset2.Recordset.Fields.Item['trackpoint_id'].Value));
      lb_sqltest.Items.Add('X: trackpoint_id in DB: '+IntToStr(trackpoints[q]));
      ADODataset2.Recordset.MoveNext;
     end;
        *)
     //  Here below: Check for old already existing edits that shall remain (starts with '*') and remove them from editlog list
     j:=0;
     for i:=0 to lb_editlog.Items.Count-1 do
     begin
       if lb_editlog.Items[j][1]='*' then     // borde det inte vara "i" ist�llet f�r "0" ???
        lb_editlog.Items.Delete(j) else           //    -"-
        inc(j);
     end;

     // Here below: Check for old existing edits that shall be removed
     for i:=0 to lb_editlog.Items.Count-1 do
      begin

       if lb_editlog.Items[0][1]='D' then    //     change from 0 to i
        begin
         subs:=TstringList.Create; subs.Clear;
         q:=ExtractStrings([' '],[' '],PChar(lb_editlog.Items[0]),subs);  // split by space      change from 0 to i
         if (subs[0]='D') then
          begin
           if subs[1]='*' then
            begin
             tmpstr:=IntToStr(StrToInt(subs[2]));     // Can be trackpoint_id OR "*"
            end
           else
            tmpstr:=IntToStr(StrToInt(subs[1]));
          end;
         subs.Free;
         lb_editlog.Items.Delete(0);  // Change from 0 to i
         sql2:='DELETE FROM trackedit WHERE trackpoint_id='+tmpstr+' AND track_id='+IntToStr(current_track_id);  // track_id beh�vs!!!
         ADOCommand1.CommandText:=sql2;
         ADODataset2.Recordset:=ADOCommand1.Execute;
        end;
      end; // for i:=

  end;
 // Slut p� avsnitt som tar bort rader som b�rjar med asterisk

 // Label1.Caption:='lb_editlog.Items.Count '+IntToStr(lb_editlog.Items.Count);

 if lb_editlog.Items.Count=0 then // no edits have been made, but we'd like to "touch" the track to show that it's been inspected.
  begin
   sql1:='INSERT INTO trackedit (dataset_id,track_id,datachange_type) VALUES ('+IntToStr(dataset_id)+','+IntToStr(current_track_id)+',''N'')';
   lb_sqltest.Items.Add(sql1+'('+IntToStr(reply_count)+') No edits on this track'); // Why spell out reply count?
   ADOCommand2.CommandText:=sql1;
   ADOCommand2.Execute(reply_count);
  // store  dataset_id, track_id, trackpoint_id=0 and datachange_type='N'
  end
 else
  begin  // There are edits on this track
     // todo: remove empty rows from lb_editlog
     // todo: if row/item start with * it should be ignored (is existing edit)
    rows:=lb_editlog.Items.Count;
    StringArray1.Resize(4,rows);     // StringList[col,row]  strange indexing: start at 0 for col, but at 1 for rows (!!)
    for i:=0 to rows-1 do          // put listbox content into stringarray for sorting
     begin
       subs:=TstringList.Create; subs.Clear;
       q:=ExtractStrings([' '],[' '],PChar(lb_editlog.Items[i]),subs);  // split by space
       Stringarray1[0,i+1]:=subs[0];     // subs[0] is ok!
       Stringarray1[1,i+1]:=subs[1];
       Stringarray1[2,i+1]:=subs[2];
       if subs.Count>3 then
        Stringarray1[3,i+1]:=subs[3];   // not all log rows have 4 items
       subs.Free;
     end;
     StringArray1.Sort(0,-1,true); // sort by ID
     lb_editlog.Items.Clear;    // clear listbox
     for i:=0 to rows-1 do      // put back data to listbox
      lb_editlog.Items.Add(Stringarray1[0,i+1]+' '+Stringarray1[1,i+1]+' '+Stringarray1[2,i+1]+' '+Stringarray1[3,i+1]);
    //debug Label2.Caption:=Stringarray1[0,1]+' - '+Stringarray1[1,1]+' - '+Stringarray1[2,1]+' - '+Stringarray1[3,1];
     // insert lb_editlog into database and clear all about this rtack (or jump to next)
     for i:=0 to rows-1 do
//     for i:=0 to 0 do
      begin
       subs:=TstringList.Create; subs.Clear;
       q:=ExtractStrings([' '],[' '],PChar(lb_editlog.Items[i]),subs);
       sql1:='INSERT INTO trackedit (dataset_id,track_id,trackpoint_id,deleted,datachange_type,new_value) VALUES(';
       sql1:=sql1+IntToStr(dataset_id)+','+IntToStr(current_track_id)+','+subs[0]+',';
       if (subs[1]='line') then sql2:='true,NULL,NULL)';
       if subs[1]='Azi'  then begin sql2:='false,''A'','+subs[2]+')'; end;     // TODO: string replace , with .
       if subs[1]='Ele'  then begin sql2:='false,''E'','+subs[2]+')';  end;
       if subs[1]='Dist' then begin sql2:='false,''D'','+subs[2]+')';  end;
       if subs[1]='start' then
        begin
          start_del_id:=subs[0];  start_del_id_int:=StrToInt(start_del_id);
          must_loop_delete:=true;
         // sql2:='true,NULL,NULL)';
        end;
       if ((subs[1]='end') OR ((i=rows-1) AND must_loop_delete)) then   // funkar inte, det loopas inte om inte end �r taggad...
        begin
         end_del_id:=subs[0];
         end_del_id_int:=StrToInt(end_del_id); // Dec(end_del_id_int);
         end_del_id:=IntToStr(end_del_id_int);
         for j:=start_del_id_int to end_del_id_int do
          begin // run queries to mark all that shall be marked as deleted
           sql1:='INSERT INTO trackedit (dataset_id,track_id,trackpoint_id,deleted) VALUES (';
           sql1:=sql1+IntToStr(dataset_id)+','+IntToStr(current_track_id)+','+IntToStr(j)+',true)';
           ADOCommand2.CommandText:=sql1;
           ADOCommand2.Execute(reply_count);
           lb_sqltest.Items.Add('Loop delete ]'+IntToStr(j)+']: '+sql1);
          end;
         must_loop_delete:=false;
        end // end if subs=end
       else
        begin
          if not must_loop_delete then begin
          // execute "single action" query
           sql:=sql1+' '+sql2;
//           sql:='INSERT INTO trackedit (dataset_id,track_id,trackpoint_id,deleted,datachange_type,new_value) VALUES (3,831,103542,true,NULL,NULL)';
//           lb_sqltest.Items.Add(sql);
           ADOCommand2.CommandText:=sql;
           ADOCommand2.Execute(reply_count);
           sql:=sql+' ('+IntToStr(reply_count)+')';
           lb_sqltest.Items.Add(sql);
          end;
        end; // if subs= end ELSE
      end; // for i:=0 to rows-1 do

  end;  //   end There are edits on this track
  for i:=0 to StringGrid1.RowCount-1 do
   for j:=0 to StringGrid1.ColCount-1 do
    StringGrid1.Cells[i,j]:=''; StringGrid1.Visible:=false; lb_editlog.Items.Clear;
 ADOConn.CursorLocation:=clUseClient;
// cb_excludetrack.Checked:=false;
 btn_store.Enabled:=false;
end;


procedure TForm_main.btn_updateTargetCommentClick(Sender: TObject);
var sql : string;
    reply_count : integer;
begin
  ADOConn.CursorLocation:=clUseServer;
  sql:='UPDATE track SET target_comment='''+edt_targetComment.Text+''' WHERE track_id='+IntToStr(current_track_id);
  lb_sqltest.Items.Add('# '+sql);
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  ADOConn.CursorLocation:=clUseClient; // Restore cursor handling
end;

procedure TForm_main.btn_updateTimestampClick(Sender: TObject);
// Updates timestamp in track table: A way to add clocktime to timestamps that only have date
var sql : string;
    reply_count : integer;
begin
 ADOConn.CursorLocation:=clUseServer; // To get rid of "No columns defined in rowset" error..
 if (edt_timestamp.Text<>'') then // Better: Check for a valid datetime! Otoh; throws exception...
  begin
   sql:='UPDATE track SET starttime='''+edt_timestamp.Text+''' WHERE track_id='+IntToStr(current_track_id);
   ADOCommand2.CommandText:=sql;
   ADOCommand2.Execute;
   lb_sqltest.Items.Add(sql+' ('+IntToStr(reply_count)+') --'); //
   ADOConn.CursorLocation:=clUseClient; // Restore cursor handling
  end;
  btn_refreshlistClick(Sender); // Refresh list of files
end;

procedure TForm_main.Button1Click(Sender: TObject);
var sql : string;
    reply_count : integer;
begin
  ADOConn.CursorLocation:=clUseServer;
  sql:='UPDATE track SET admin_comment='''+edt_adminComment.Text+''' WHERE track_id='+IntToStr(current_track_id);
  lb_sqltest.Items.Add('# '+sql);
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  ADOConn.CursorLocation:=clUseClient; // Restore cursor handling
end;

procedure TForm_main.Button2Click(Sender: TObject);
var sql : string;
    reply_count : integer;
begin
  ADOConn.CursorLocation:=clUseServer;
  sql:='UPDATE track SET overall_comment='''+edt_overallComment.Text+''' WHERE track_id='+IntToStr(current_track_id);
  lb_sqltest.Items.Add('# '+sql);
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  ADOConn.CursorLocation:=clUseClient; // Restore cursor handling
end;

(*************** Deletes ALL edit instrucktions in trackedit table for current track  **************)
procedure TForm_main.btn_delalleditsClick(Sender: TObject);
var sql : string;
begin
  ADOConn.CursorLocation:=clUseServer; // Alter cursor handling to avoid no rowset error
  sql:='DELETE FROM trackedit WHERE track_id='+IntToStr(current_track_id); // To be continued ...
  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  ADOConn.CursorLocation:=clUseClient; // Restore cursor handling
  lb_tracksClick(Sender);
end;

procedure TForm_main.btn_delselClick(Sender: TObject);
var i : integer;
   sql : string;
begin
 With lb_editlog do
   for i:=-1 + Items.Count downto 0 do
    if Selected[i] then
    begin
        Items[i]:='D'+Copy(Items[i],2,20); // Replaces '*' with a 'D'
    end;
end;
(*
procedure TForm_main.cb_datasetChange(Sender: TObject);
var sql, selected_dataset : string;
begin
  selected_dataset:=cb_dataset.Items[cb_dataset.Itemindex];
  sql:='SELECT dataset_id FROM dataset WHERE dataset_name='''+selected_dataset+''' ';
  lb_sqltest.Items.Add(sql);

  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  dataset_id:=ADOdataset1.FieldValues['dataset_id'];
 // count:=ADOdataset1.RecordCount;
 // ADOdataset1.Recordset.MoveFirst;
 StatusBar1.Panels[0].Text:='Dataset ID: '+IntToStr(dataset_id);
// cb_year.Enabled:=true;
end;
*)
procedure TForm_main.cb_filnamChange(Sender: TObject);
var sql, selected_filnam, selected_folder,trackString : string;
    count, i : integer;
begin
  lb_tracks.Clear;
  selected_folder:=cb_folder.Items[cb_folder.Itemindex];
  selected_filnam:=cb_filnam.Items[cb_filnam.Itemindex];
  // select track_id from track where folder='ol79v' and filnam='K1' order by track_id;
  sql:='SELECT * FROM track WHERE folder='''+selected_folder+''' AND filnam='''+selected_filnam+''' ORDER BY track_id ';
  lb_sqltest.Items.Add(sql);

  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  if count>0 then begin
  ADOdataset1.Recordset.MoveFirst;
  for i:=0 to count-1 do
   begin
    trackString:=String(ADOdataset1.Recordset.Fields.Item['track_id'].Value);
    trackString:=trackString+'     '+String(ADOdataset1.Recordset.Fields.Item['rec'].Value);
    trackString:=trackString+'  '+String(ADOdataset1.Recordset.Fields.Item['starttime'].Value);
    trackString:=trackString+'  '+String(ADOdataset1.Recordset.Fields.Item['identification'].Value);
    if (String(ADOdataset1.Recordset.Fields.Item['target_count'].Value)<>'-9') then
       trackString:=trackString+'  '+String(ADOdataset1.Recordset.Fields.Item['target_count'].Value);
    lb_tracks.Items.Add(trackString);
    ADOdataset1.Recordset.MoveNext;
   end;
  end;
end;

procedure TForm_main.cb_folderChange(Sender: TObject);
var sql, selected_folder : string;
    count, i : integer;
begin
  cb_filnam.Clear;  // ??
  cb_filnam.Items.Clear;
  selected_folder:=cb_folder.Items[cb_folder.Itemindex];
  sql:='SELECT DISTINCT filnam FROM track WHERE folder='''+selected_folder+''' ORDER BY filnam ';
  lb_sqltest.Items.Add(sql);

  ADOCommand1.CommandText:=sql;
  ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  if count>0 then begin
  ADOdataset1.Recordset.MoveFirst;
  for i:=0 to count-1 do
   begin
    cb_filnam.Items.Add(String(ADOdataset1.Recordset.Fields.Item['filnam'].Value));
    ADOdataset1.Recordset.MoveNext;
   end;
  end;
end;

procedure TForm_main.Help1Click(Sender: TObject);
begin
  ShowMessage('Begin by selecting a dataset, define a new if needed. Choose Bird or Wind tracks. '+
  'Filter out set of trackings by date (1 - year, 2 - starttime, 3 - stoptime). '+
  'Click a track to load it. Inspect variables in charts by clicking headings. '+
  'Edit. ALWAYS follow a D (start delete) with an E (end delete), even in end of trackings! '+
  'Inspect again. Click Store when you are done with a track. Select next track');
end;

procedure TForm_main.Debugmode1Click(Sender: TObject);
begin
 If (debugmode) then
  begin
   debugmode:=false;
   debugmode1.Checked:=false;
   lb_sqltest.Visible:=false;
   lb_sqltest.Align:=alNone;
   RChart2.Visible:=true;
   btn_ClearSQL_log.Visible:=false;
   lb_cartesian.Visible:=false;
  end
 else
  begin
   debugmode:=true;
   debugmode1.Checked:=true;
   RChart2.Visible:=false;
   lb_sqltest.Visible:=true;
   lb_sqltest.Align:=alBottom;
   lb_sqltest.Height:=200;
   btn_ClearSQL_log.Visible:=true;
   lb_cartesian.Visible:=true;
  end;
end;
(*
procedure TForm_main.rg_colltypeClick(Sender: TObject);
begin
 if (rg_colltype.ItemIndex=1) then btn_altitudeplot.Enabled:=true
 else btn_altitudeplot.Enabled:=false;
end;
*)


procedure TForm_main.btn_refreshlistClick(Sender: TObject);
begin
 lb_tracks.Clear;
 cb_filnamChange(Sender);
end;

end.
