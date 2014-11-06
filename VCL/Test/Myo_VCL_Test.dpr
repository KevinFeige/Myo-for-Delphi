program Myo_VCL_Test;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Myo for Delphi VCL';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
