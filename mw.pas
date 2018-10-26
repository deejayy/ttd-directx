unit Mw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, TcPanel;

type
  TForm1 = class(TForm)
    Panel1: TTcPanel;
    Panel3: TTcPanel;
    Panel4: TTcPanel;
    Panel5: TTcPanel;
    Panel6: TTcPanel;
    Panel7: TTcPanel;
    Panel8: TTcPanel;
    Panel9: TTcPanel;
    Panel2: TTcPanel;
    Panel10: TTcPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure PanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel9Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
  private
    { Private declarations }
  public
    MouseDown: Boolean;
    MovedX, MovedY: Integer;
    Debug: Boolean;
  end;

var
  Form1: TForm1;

implementation

uses Main, Options, Diff;

{$R *.DFM}

procedure TForm1.PanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TTcPanel(Sender).BevelOuter := bvLowered;
end;

procedure TForm1.PanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TTcPanel(Sender).BevelOuter := bvRaised;
end;

procedure TForm1.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := True;
  MovedX := X;
  MovedY := Y;
end;

procedure TForm1.Panel2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := False;
end;

procedure TForm1.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If MouseDown Then
  Begin
    Form1.Left := Form1.Left + X - MovedX;
    Form1.Top := Form1.Top + Y - MovedY;
  End;
end;

procedure TForm1.Panel9Click(Sender: TObject);
begin
  Halt;
end;

procedure TForm1.Panel7Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Panel8Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.Panel10Click(Sender: TObject);
begin
  If Debug Then Form1.Height := Form1.Height - 200 Else Form1.Height := Form1.Height + 200;
  Debug := not Debug;
end;

end.
