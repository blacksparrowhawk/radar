program HP85_edit_2018;

uses
  Forms,
  mainunit in 'mainunit.pas' {Form_main},
  dataset_unit in 'dataset_unit.pas' {frm_dataset};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(Tfrm_dataset, frm_dataset);
  Application.Run;
end.
