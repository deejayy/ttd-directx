{$HINTS OFF}
{$WARNINGS OFF}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, DXClass, DXSprite, DXInput, DXDraws,
  DXSounds, MMSystem, Wave, TcPanel;

type
  TMainForm = class(TDXForm)
    DXTimer: TDXTimer;
    DXDraw: TDXDraw;
    DXSpriteEngine: TDXSpriteEngine;
    DXInput: TDXInput;
    ImageList: TDXImageList;
    DXWaveList: TDXWaveList;
    DXSound: TDXSound;
    TcPanel1: TTcPanel;
    TcPanel2: TTcPanel;
    TcPanel3: TTcPanel;
    TcPanel4: TTcPanel;
    TcPanel5: TTcPanel;
    TcPanel6: TTcPanel;
    TcPanel7: TTcPanel;
    TcPanel8: TTcPanel;
    TcPanel9: TTcPanel;
    TcPanel10: TTcPanel;
    TcPanel11: TTcPanel;
    TcPanel12: TTcPanel;
    TcPanel13: TTcPanel;
    TcPanel14: TTcPanel;
    TcPanel15: TTcPanel;
    TcPanel16: TTcPanel;
    TcPanel17: TTcPanel;
    TcPanel18: TTcPanel;
    TcPanel19: TTcPanel;
    TcPanel20: TTcPanel;
    TcPanel21: TTcPanel;
    TcPanel22: TTcPanel;
    TcPanel23: TTcPanel;
    TcPanel24: TTcPanel;
    TcPanel25: TTcPanel;
    TcPanel26: TTcPanel;
    TcPanel27: TTcPanel;
    TcPanel28: TTcPanel;
    TcPanel29: TTcPanel;
    TcPanel30: TTcPanel;
    TcPanel31: TTcPanel;
    TcPanel32: TTcPanel;
    TcPanel33: TTcPanel;
    TcPanel34: TTcPanel;
    TcPanel35: TTcPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DXDrawFinalize(Sender: TObject);
    procedure DXDrawInitialize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DXTimerTimer(Sender: TObject; LagCount: Integer);
    procedure DXTimerActivate(Sender: TObject);
    procedure DXTimerDeactivate(Sender: TObject);
    procedure DXDrawClick(Sender: TObject);
    procedure DXDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TcPanel1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FMoveMode: Boolean;
    MapW, MapH: Integer;
    SoftScroll: Boolean;
    Rw1, Rw2, Rw3, Rw4: Boolean;
    SpX, SpY: Double;
    MovedX, MovedY: Integer;
  end;

var
  MainForm: TMainForm;

implementation

uses Mw;

{$R *.DFM}

type

  TLandElement = class(TImageSprite)
  public

  end;

  TRailWay = class(TImageSprite)
  public

  end;

  TBorderSprite = class(TImageSprite)
  public

  end;

var

  LandElement: TLandElement;
  RailWay: TRailWay;
  BorderSprite: TBorderSprite;

procedure TMainForm.DXTimerActivate(Sender: TObject);
begin
  Caption := Application.Title;
end;

procedure TMainForm.DXTimerDeactivate(Sender: TObject);
begin
  Caption := Application.Title + ' [Pause]';
end;

procedure TMainForm.DXTimerTimer(Sender: TObject; LagCount: Integer);
begin
  if not DXDraw.CanDraw then exit;

  DXInput.Update;

  DXSpriteEngine.Move(LagCount);
  DXSpriteEngine.Dead;

  {  Description  }
  DXDraw.Surface.Fill(0);
  DXSpriteEngine.Draw;

  DXDraw.Flip;
end;

procedure TMainForm.DXDrawFinalize(Sender: TObject);
begin
  DXTimer.Enabled := False;
end;

procedure TMainForm.DXDrawInitialize(Sender: TObject);
begin
  DXTimer.Enabled := True;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var I: Integer;
begin
  RandomIze;
  {  Application end  }
(*  if Key=VK_ESCAPE then
    Close;*)

  {  Screen mode change  }
  if (ssAlt in Shift) and (Key=VK_RETURN) then
  begin
    DXDraw.Finalize;

    if doFullScreen in DXDraw.Options then
    begin
      StoreWindow;

//      DXDraw.Cursor := crDefault;
      BorderStyle := bsSizeable;
      DXDraw.Options := DXDraw.Options - [doFullScreen];
    end else
    begin
      ReStoreWindow;

//      DXDraw.Cursor := crNone;
      BorderStyle := bsNone;
      DXDraw.Options := DXDraw.Options + [doFullScreen];
    end;

    DXDraw.Initialize;
  end;

//  if Key=VK_PAUSE then DXTimer.Enabled := not DXTimer.Enabled;

  if (Shift = []) then
    Begin
    if Key=VK_F1 then
      if DXTimer.Enabled then
      begin
        TcPanel1.OnClick(Sender);
      end
      else
        TcPanel1.OnClick(Sender);
      begin

      end;

    if isLeft in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 2 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + I * 4;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + 8;
            DXTimerTimer(Sender, 0);
            For I := 2 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + I * 4;
                DXTimerTimer(Sender, 0);
              End;
          End
        Else DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + 32;
      end;

    if isRight in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 2 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - I * 4;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - 8;
            DXTimerTimer(Sender, 0);
            For I := 2 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - I * 4;
                DXTimerTimer(Sender, 0);
              End
          End
        Else DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - 32;
      end;

    if isUp in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 2 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + I * 4;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + 8;
            DXTimerTimer(Sender, 0);
            For I := 2 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + I * 4;
                DXTimerTimer(Sender, 0);
              End
          End
        Else DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + 32;
      end;

    if isDown in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 2 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - I * 4;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - 8;
            DXTimerTimer(Sender, 0);
            For I := 2 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - I * 4;
                DXTimerTimer(Sender, 0);
              End
          End
        Else DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - 32;
      end;
    End;

  if (Shift = [ssShift]) then
    Begin
    if isLeft in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 3 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + I * 8;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + 32;
            DXTimerTimer(Sender, 0);
            For I := 3 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + I * 8;
                DXTimerTimer(Sender, 0);
              End;
          End
        Else DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + 128;
      end;

    if isRight in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 3 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - I * 8;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - 32;
            DXTimerTimer(Sender, 0);
            For I := 3 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - I * 8;
                DXTimerTimer(Sender, 0);
              End
          End
        Else DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X - 128;
      end;

    if isUp in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 3 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + I * 8;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + 32;
            DXTimerTimer(Sender, 0);
            For I := 3 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + I * 8;
                DXTimerTimer(Sender, 0);
              End
          End
        Else DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + 128;
      end;

    if isDown in MainForm.DXInput.States then
      begin
        If SoftScroll Then
          Begin
            For I := 1 To 3 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - I * 8;
                DXTimerTimer(Sender, 0);
              End;
            DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - 32;
            DXTimerTimer(Sender, 0);
            For I := 3 DownTo 1 Do
              Begin
                DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - I * 8;
                DXTimerTimer(Sender, 0);
              End
          End
        Else DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y - 128;
      end;
    End;
end;

procedure TMainForm.DXDrawClick(Sender: TObject);
begin
  If Rw1 Then
    With TLandElement.Create(DXSpriteEngine.Engine) Do
      Begin
        If Mouse.CursorPos.X - DXSpriteEngine.Engine.WorldX - MainForm.Left - BorderSprite.X < 32 Then
          Image := ImageList.Items.Find('rw1-0')
        Else Image := ImageList.Items.Find('rw0-1');
        X := BorderSprite.X;
        Y := BorderSprite.Y - (Image.Height - 32);
//        Z := 5 + Abs(Round(Y));
        Z := 3;  
        Width := Image.Width;
        Height := Image.Height;
      End;
      
  If Rw2 Then
    With TLandElement.Create(DXSpriteEngine.Engine) Do
      Begin
        Image := ImageList.Items.Find('rw2');
        X := BorderSprite.X;
        Y := BorderSprite.Y - (Image.Height - 32);
        Z := 3;
        Width := Image.Width;
        Height := Image.Height;
      End;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i, j: Integer;
begin
  Randomize;

  ImageList.Items.MakeColorTable;

  DXDraw.ColorTable := ImageList.Items.ColorTable;
  DXDraw.DefColorTable := ImageList.Items.ColorTable;
  DXDraw.UpdatePalette;

  SoftScroll := False;
  MapW := 10;
  MapH := 10;

  for i:=0 to MapW do
  for j:=0 to MapH do
    with TLandElement.Create(DXSpriteEngine.Engine) do
    begin
      Image := ImageList.Items.Find('greenland');
      X := (I + J) * 32;
      Y := (MapW - I + J) * 16;
      Z := 2;
      Width := Image.Width;
      Height := Image.Height;
    end;

  BorderSprite := TBorderSprite.Create(DXSpriteEngine.Engine);
  with TBorderSprite(BorderSprite) do
  begin
    Image := ImageList.Items.Find('border');
    Z := 10;
    Width := Image.Width;
    Height := Image.Height;
//    Visible := False;
  end;

end;

Procedure TMainForm.DXDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var Bx, By, Cx, Cy: Integer;
    Sp: TLandElement;
    I, J: Integer;
Begin
  Bx := Round(X - DXSpriteEngine.Engine.WorldX);
  By := Round(Y - DXSpriteEngine.Engine.WorldY);
  Cx := Bx - (Bx mod 32);
  Cy := By - (By mod 16);

  for i:=0 to MapW do
  for j:=0 to MapH do
    If (Bx - 2 * By < (I - MapW / 2 + 1) * 64) And
       (Bx + 2 * By < (J + MapH / 2 + 1) * 64) And
       (Bx - 2 * By > (I - MapW / 2) * 64) And
       (Bx + 2 * By > (J + MapH / 2) * 64) Then
    Begin
      BorderSprite.X := (I + J) * 32;
      BorderSprite.Y := (MapW - I + J) * 16;
    End;

  If ssRight in Shift Then
   Begin
    DXSpriteEngine.Engine.X := DXSpriteEngine.Engine.X + Bx - MovedX;
    DXSpriteEngine.Engine.Y := DXSpriteEngine.Engine.Y + By - MovedY;
   End;
End;

procedure TMainForm.DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MovedX := Round(X - DXSpriteEngine.Engine.WorldX);
  MovedY := Round(Y - DXSpriteEngine.Engine.WorldY);
end;

procedure TMainForm.TcPanel1Click(Sender: TObject);
begin
  If TcPanel1.BevelOuter = bvRaised Then
    TcPanel1.BevelOuter := bvLowered
  Else TcPanel1.BevelOuter := bvRaised; 

  DXTimer.Enabled := not DXTimer.Enabled;
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Case Key of
    '1': Begin
           Rw1 := True;
           Rw2 := False;
           Rw3 := False;
           Rw4 := False;
         End; // 1
    '2': Begin
           Rw1 := False;
           Rw2 := True;
           Rw3 := False;
           Rw4 := False;
         End; // 2
    '3': Begin
           Rw1 := False;
           Rw2 := False;
           Rw3 := True;
           Rw4 := False;
         End; // 3
    '4': Begin
           Rw1 := False;
           Rw2 := False;
           Rw3 := False;
           Rw4 := True;
         End; // 4
  End; // Case
end;

End.

