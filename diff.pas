unit Diff;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TcPanel, NewLabel;

type
  TForm3 = class(TForm)
    Panel1: TTcPanel;
    Panel2: TTcPanel;
    Panel3: TTcPanel;
    Panel4: TTcPanel;
    Panel5: TTcPanel;
    Panel6: TTcPanel;
    Panel7: TTcPanel;
    Panel8: TTcPanel;
    Panel9: TTcPanel;
    Panel10: TTcPanel;
    Label1: TNewLabel;
    Panel11: TTcPanel;
    Panel12: TTcPanel;
    Label2: TNewLabel;
    Panel13: TTcPanel;
    Panel14: TTcPanel;
    Label3: TNewLabel;
    Panel15: TTcPanel;
    Panel16: TTcPanel;
    Label4: TNewLabel;
    Panel17: TTcPanel;
    Panel18: TTcPanel;
    Label5: TNewLabel;
    Panel19: TTcPanel;
    Panel20: TTcPanel;
    Label6: TNewLabel;
    Panel21: TTcPanel;
    Panel22: TTcPanel;
    Label7: TNewLabel;
    Panel23: TTcPanel;
    Panel24: TTcPanel;
    Label8: TNewLabel;
    Panel25: TTcPanel;
    Panel26: TTcPanel;
    Label9: TNewLabel;
    Panel27: TTcPanel;
    Panel28: TTcPanel;
    Label10: TNewLabel;
    Panel29: TTcPanel;
    Panel30: TTcPanel;
    Label11: TNewLabel;
    Panel31: TTcPanel;
    Panel32: TTcPanel;
    Label12: TNewLabel;
    Panel33: TTcPanel;
    Panel34: TTcPanel;
    Label13: TNewLabel;
    Panel35: TTcPanel;
    Panel36: TTcPanel;
    Label14: TNewLabel;
    Panel37: TTcPanel;
    Panel38: TTcPanel;
    Label15: TNewLabel;
    Panel39: TTcPanel;
    Panel40: TTcPanel;
    Label16: TNewLabel;
    Panel41: TTcPanel;
    Panel42: TTcPanel;
    Label17: TNewLabel;
    Panel43: TTcPanel;
    procedure Panel9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel9MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel5Click(Sender: TObject);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
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
  Form3: TForm3;

implementation

uses Options;

{$R *.DFM}

procedure TForm3.Panel9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TTcPanel(Sender).BevelOuter := bvLowered;
end;

procedure TForm3.Panel9MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TTcPanel(Sender).BevelOuter := bvRaised;
end;

procedure TForm3.Panel5Click(Sender: TObject);
begin
  Panel5.BevelOuter := bvRaised;
  Panel6.BevelOuter := bvRaised;
  Panel7.BevelOuter := bvRaised;
  Panel8.BevelOuter := bvRaised;
  TTcPanel(Sender).BevelOuter := bvLowered;
  Panel5.Color := $0010B8E8;
  Panel6.Color := $0010B8E8;
  Panel7.Color := $0010B8E8;
  Panel8.Color := $0010B8E8;
  TTcPanel(Sender).Color := $0000D4FC;
end;

procedure TForm3.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

procedure TForm3.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := True;
  MovedX := X;
  MovedY := Y;
end;

procedure TForm3.Panel2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := False;
end;

procedure TForm3.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If MouseDown Then
  Begin
    Form3.Left := Form3.Left + X - MovedX;
    Form3.Top := Form3.Top + Y - MovedY;
  End;
end;

end.
