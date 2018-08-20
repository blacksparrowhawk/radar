unit loadfileunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QFileCtrls, StdCtrls;

var  dtafilepath : string;

type
  TForm_loadfile = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fRawDtaFileName : string;
    procedure setRawDtaFileName(filename : string);
  public
    { Public declarations }
  published
    property RawDtaFileName  : string
      read  fRawDtaFileName
      write setRawDtaFileName;
  end;

var
  Form_loadfile: TForm_loadfile;

implementation

uses mainunit;

{$R *.dfm}

procedure TForm_Loadfile.setRawDtaFileName(filename : string);
begin
 fRawDtaFileName := filename;
end;

procedure TForm_loadfile.FormCreate(Sender: TObject);

begin
  // comment
end;

procedure TForm_loadfile.ListBox1Click(Sender: TObject);
begin
//  Form_main.datafilename:=dtafilepath+'\'+Listbox1.Items[Listbox1.ItemIndex];
  Form_main.datafilename:=Form_main.DataFilePath+'\'+Listbox1.Items[Listbox1.ItemIndex];
  Label1.Caption:=IntToStr(Listbox1.ItemIndex);
  { specify the file (as above) close this form
    make the file load raw data in the other form }
end;

procedure TForm_loadfile.FormShow(Sender: TObject);
var    datdir : TDirectory;
     myClient : IDirectoryClient;
            n : integer;

begin
 Listbox1.Clear;
 dtafilepath:=Form_main.DataFilePath;
// dtafilepath := 'C:\data\ber05\Copy of 882\balloontracks';
 Label1.Caption:=dtafilepath;
 datdir:=TDirectory.Create(myClient);
 datdir.Location:=dtafilepath;
 datdir.IncludeParentDir:=false;
 datdir.FileMask:='*.wind;*.track;*.lof;*.lov';
 datdir.Sort;
 for n:=0 to datdir.Count-1 do
   Listbox1.Items.Add(datdir.Caption(n));
 datdir.Free;
 Label1.Caption:=fRawDtaFileName;
end;

end.
