unit dataset_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ExtCtrls, DB;

type
  Tfrm_dataset = class(TForm)
    edt_datasetname: TEdit;
    lbl_dataset: TLabel;
    btn_ok: TButton;
    btn_cancel: TButton;
    ADOCommand1: TADOCommand;
    Timer1: TTimer;
    ADODataSet1: TADODataSet;
    procedure edt_datasetnameChange(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dataset: Tfrm_dataset;


implementation

uses mainunit;

{$R *.dfm}

procedure Tfrm_dataset.edt_datasetnameChange(Sender: TObject);
begin
 btn_ok.Enabled:=true;
end;

procedure Tfrm_dataset.btn_cancelClick(Sender: TObject);
begin
 edt_datasetname.Text:='';
 Visible:=false;
end;

procedure Tfrm_dataset.btn_okClick(Sender: TObject);
var sql : string;
    count,i : integer;
begin
 sql:='INSERT INTO dataset (dataset_name) VALUES(''';
 sql:=sql+edt_datasetname.Text+''')';
// lbl_dataset.Caption:=sql;
 ADOCommand1.CommandText:=sql;
 ADOcommand1.Execute(count);
 If count>0 then begin
  Timer1.Enabled:=true;
  ShowMessage('Dataset added!');
 end;
 // update lb_dataset
(*
  sql:='SELECT * FROM dataset';ADODataset1.CommandText:=sql; ADOdataset1.Active:=true;
 // Form_main.lb_sqltest.Items.Add(sql);
 // ADOCommand1.CommandText:=sql;
 // ADODataset1.Recordset:=ADOCommand1.Execute;
  count:=ADOdataset1.RecordCount;
  ADOdataset1.Recordset.MoveFirst;
  Form_main.cb_dataset.Items.Clear;
  for i:=0 to count-1 do
   begin
    Form_main.cb_dataset.Items.Add(String(ADOdataset1.Recordset.Fields.Item['dataset_name'].Value));
 //   Form_main.lb_sqltest.Items.Add(String(ADOdataset1.Recordset.Fields.Item['dataset_name'].Value));
    ADOdataset1.Recordset.MoveNext;
   end;
   *)
end;

procedure Tfrm_dataset.Timer1Timer(Sender: TObject);
begin
 edt_datasetname.Text:='';
 Visible:=false;
 Timer1.Enabled:=false;
end;

procedure Tfrm_dataset.FormCreate(Sender: TObject);
begin
 edt_datasetname.TabOrder:=0;
end;

end.
