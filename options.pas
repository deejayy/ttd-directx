unit Options;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, TcPanel, TcGroupBox;

type
  TForm2 = class(TForm)
    Panel1: TTcPanel;
    Panel2: TTcPanel;
    Panel3: TTcPanel;
    GroupBox2: TTcGroupBox;
    Panel6: TTcPanel;
    Panel7: TTcPanel;
    GroupBox3: TTcGroupBox;
    Panel8: TTcPanel;
    Panel9: TTcPanel;
    GroupBox4: TTcGroupBox;
    Panel10: TTcPanel;
    Panel11: TTcPanel;
    GroupBox5: TTcGroupBox;
    Panel12: TTcPanel;
    Panel13: TTcPanel;
    GroupBox6: TTcGroupBox;
    Panel14: TTcPanel;
    Panel15: TTcPanel;
    Panel16: TTcPanel;
    TcGroupBox1: TTcGroupBox;
    TcPanel2: TTcPanel;
    TcPanel3: TTcPanel;
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    MouseDown: Boolean;
    MovedX, MovedY: Integer;
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If TTcPanel(Sender) = Panel3 Then Close Else
  TTcPanel(Sender).BevelOuter := bvLowered;
end;

procedure TForm2.Panel3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TTcPanel(Sender).BevelOuter := bvRaised;
end;

procedure TForm2.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := True;
  MovedX := X;
  MovedY := Y;
end;

procedure TForm2.Panel2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := False;
end;

procedure TForm2.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If MouseDown Then
  Begin
    Form2.Left := Form2.Left + X - MovedX;
    Form2.Top := Form2.Top + Y - MovedY;
  End;
end;

end.
