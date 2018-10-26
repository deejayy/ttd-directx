program Sprite2;

uses
  Windows,
  Forms,
  Main in 'Main.pas' {MainForm},
  Mw in 'Mw.pas',
  Options in 'Options.pas' {Form2},
  Diff in 'Diff.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
