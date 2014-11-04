unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls, Myo,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Chart2: TChart;
    GyroX: TFastLineSeries;
    GyroY: TFastLineSeries;
    GyroZ: TFastLineSeries;
    BConnect: TButton;
    Myo1: TMyo;
    BVibrate: TButton;
    CBLegends: TCheckBox;
    LiveCharts: TCheckBox;
    LArm: TLabel;
    Label2: TLabel;
    LVersion: TLabel;
    Chart1: TChart;
    AccelX: TFastLineSeries;
    AccelY: TFastLineSeries;
    AccelZ: TFastLineSeries;
    Chart3: TChart;
    OrientX: TFastLineSeries;
    OrientY: TFastLineSeries;
    OrientZ: TFastLineSeries;
    OrientW: TFastLineSeries;
    LPaired: TLabel;
    procedure Myo1Accelerometer(Sender: TMyo; const Time: UInt64;
      const Accelerometer: TVector3);
    procedure BVibrateClick(Sender: TObject);
    procedure CBLegendsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BConnectClick(Sender: TObject);
    procedure Myo1ArmLost(Sender: TMyo; const Time: UInt64);
    procedure Myo1ArmRecognized(Sender: TMyo; const Time: UInt64;
      const Arm: TArm; const XDirection: TXDirection);
    procedure Myo1Connect(Sender: TMyo; const Time: UInt64;
      const Version: TFirmwareVersion);
    procedure Myo1Disconnect(Sender: TMyo; const Time: UInt64);
    procedure Myo1Gyroscope(Sender: TMyo; const Time: UInt64;
      const Gyroscope: TVector3);
    procedure Myo1Orientation(Sender: TMyo; const Time: UInt64;
      const Orientation: TOrientation);
    procedure Myo1Pair(Sender: TMyo; const Time: UInt64;
      const Version: TFirmwareVersion);
    procedure Myo1Pose(Sender: TMyo; const Time: UInt64; const Pose: TPose);
    procedure Myo1Rssi(Sender: TMyo; const Time: UInt64; const Rssi: Byte);
    procedure Myo1Unpair(Sender: TMyo; const Time: UInt64);
  private
    { Private declarations }

    TimeSize : TDateTime;

    StopRun : Boolean;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.BConnectClick(Sender: TObject);
begin
  BConnect.Enabled:=False;

  if Myo1.Active then
  begin
    Myo1.Active:=False;
    StopRun:=True;
  end
  else
  begin
    Myo1.Active:=True;

    StopRun:=False;

    repeat
        // In each iteration of our main loop, we run the Myo event loop for a set number of milliseconds.
        // In this case, we wish to update our display 20 times a second, so we run for 1000/20 milliseconds.
        Myo1.Run(1000 div 50);
        Application.ProcessMessages;

    until StopRun or Application.Terminated;
  end;
end;

procedure TMainForm.BVibrateClick(Sender: TObject);
begin
  Myo1.Vibrate(TVibrationType.Short);
end;

procedure TMainForm.CBLegendsClick(Sender: TObject);
begin
  Chart1.Legend.Visible:=CBLegends.Checked;
  Chart2.Legend.Visible:=CBLegends.Checked;
  Chart3.Legend.Visible:=CBLegends.Checked;
end;

procedure TMainForm.FormCreate(Sender: TObject);
const
  MinutesPerDay = 24*60;
begin
  TimeSize:=1/(2*MinutesPerDay);

  AccelX.XValues.DateTime:=True;
  AccelY.XValues.DateTime:=True;
  AccelZ.XValues.DateTime:=True;

  GyroX.XValues.DateTime:=True;
  GyroY.XValues.DateTime:=True;
  GyroZ.XValues.DateTime:=True;

  OrientX.XValues.DateTime:=True;
  OrientY.XValues.DateTime:=True;
  OrientZ.XValues.DateTime:=True;
  OrientW.XValues.DateTime:=True;

  Chart1.Axes.Bottom.DateTimeFormat:='hh:nn:ss.z';
  Chart2.Axes.Bottom.DateTimeFormat:='hh:nn:ss.z';
  Chart3.Axes.Bottom.DateTimeFormat:='hh:nn:ss.z';
end;

procedure TMainForm.Myo1Accelerometer(Sender: TMyo; const Time: UInt64;
  const Accelerometer: TVector3);
var tmp : TDateTime;
begin
  if LiveCharts.Checked then
  begin
    tmp:=Now;

    AccelX.AddXY(tmp,Accelerometer.X);
    AccelY.AddXY(tmp,Accelerometer.Y);
    AccelZ.AddXY(tmp,Accelerometer.Z);

    AccelX.GetHorizAxis.SetMinMax(tmp-TimeSize,tmp);
  end;
end;

procedure TMainForm.Myo1ArmLost(Sender: TMyo; const Time: UInt64);
begin
  LArm.Caption:='Arm: Unknown';
end;

procedure TMainForm.Myo1ArmRecognized(Sender: TMyo; const Time: UInt64;
  const Arm: TArm; const XDirection: TXDirection);
begin
  case Arm of
    TArm.Left: LArm.Caption:='Arm: Left';
   TArm.Right: LArm.Caption:='Arm: Right';
  else
    LArm.Caption:='Arm: Unknown';
  end;
end;

procedure TMainForm.Myo1Connect(Sender: TMyo; const Time: UInt64;
  const Version: TFirmwareVersion);
begin
  BConnect.Caption:='Disconnect';
  BConnect.Enabled:=True;

  BVibrate.Enabled:=True;
  LVersion.Caption:=Version.ToString;
end;

procedure TMainForm.Myo1Disconnect(Sender: TMyo; const Time: UInt64);
begin
  BConnect.Caption:='Connect';
  BConnect.Enabled:=True;

  BVibrate.Enabled:=False;
  LVersion.Caption:='';

  StopRun:=True;
end;

procedure TMainForm.Myo1Gyroscope(Sender: TMyo; const Time: UInt64;
  const Gyroscope: TVector3);
var tmp : TDateTime;
begin
  if LiveCharts.Checked then
  begin
    tmp:=Now;

    GyroX.AddXY(tmp,Gyroscope.X);
    GyroY.AddXY(tmp,Gyroscope.Y);
    GyroZ.AddXY(tmp,Gyroscope.Z);

    GyroX.GetHorizAxis.SetMinMax(tmp-TimeSize,tmp);
  end;
end;

procedure TMainForm.Myo1Orientation(Sender: TMyo; const Time: UInt64;
  const Orientation: TOrientation);
var tmp : TDateTime;
begin
  if LiveCharts.Checked then
  begin
    tmp:=Now;

    OrientX.AddXY(tmp,Orientation.X);
    OrientY.AddXY(tmp,Orientation.Y);
    OrientZ.AddXY(tmp,Orientation.Z);
    OrientW.AddXY(tmp,Orientation.W);

    OrientX.GetHorizAxis.SetMinMax(tmp-TimeSize,tmp);
  end;
end;

procedure TMainForm.Myo1Pair(Sender: TMyo; const Time: UInt64;
  const Version: TFirmwareVersion);
begin
  LPaired.Caption:='Paired';
end;

procedure TMainForm.Myo1Pose(Sender: TMyo; const Time: UInt64;
  const Pose: TPose);
begin
  //
end;

procedure TMainForm.Myo1Rssi(Sender: TMyo; const Time: UInt64;
  const Rssi: Byte);
begin
  //
end;

procedure TMainForm.Myo1Unpair(Sender: TMyo; const Time: UInt64);
begin
  LPaired.Caption:='Unpaired';
end;

end.
