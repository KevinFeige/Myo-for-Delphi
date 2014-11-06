unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls, Myo,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ExtCtrls,
  System.Math.Vectors;

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
    LPose: TLabel;
    LTimesPerSec: TLabel;
    BSignal: TButton;
    procedure Myo1Accelerometer(Sender: TMyo; const Time: UInt64;
      const Accelerometer: TPoint3D);
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
      const Gyroscope: TPoint3D);
    procedure Myo1Orientation(Sender: TMyo; const Time: UInt64;
      const Orientation: TVector3D);
    procedure Myo1Pair(Sender: TMyo; const Time: UInt64;
      const Version: TFirmwareVersion);
    procedure Myo1Pose(Sender: TMyo; const Time: UInt64; const Pose: TPose);
    procedure Myo1Rssi(Sender: TMyo; const Time: UInt64; const Rssi: Byte);
    procedure Myo1Unpair(Sender: TMyo; const Time: UInt64);
    procedure BSignalClick(Sender: TObject);
  private
    { Private declarations }

    Counter : Integer;
    LastTime: Single;

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

procedure TMainForm.BSignalClick(Sender: TObject);
begin
  Myo1.RequestRSSI;
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

  procedure HorizAxisDateTime(const AChart:TChart; DateTime:Boolean);
  var t : Integer;
  begin
    for t := 0 to AChart.SeriesCount-1 do
        AChart[t].XValues.DateTime:=DateTime;

    if DateTime then
       AChart.Axes.Bottom.DateTimeFormat:='hh:nn:ss.z';
  end;

const
  MinutesPerDay = 24*60;
begin
  TimeSize:=1/(2*MinutesPerDay);

  HorizAxisDateTime(Chart1,True);
  HorizAxisDateTime(Chart2,True);
  HorizAxisDateTime(Chart3,True);
end;

procedure TMainForm.Myo1Accelerometer(Sender: TMyo; const Time: UInt64;
  const Accelerometer: TPoint3D);
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
  LPose.Caption:='';
  LTimesPerSec.Caption:='';
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
  LPose.Caption:='';
  LTimesPerSec.Caption:='';

  StopRun:=True;
end;

procedure TMainForm.Myo1Gyroscope(Sender: TMyo; const Time: UInt64;
  const Gyroscope: TPoint3D);
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
  const Orientation: TVector3D);
var tmp : TDateTime;
begin
  Inc(Counter);

  if TeeTickCount-LastTime>1000 then
  begin
    LTimesPerSec.Caption:=IntToStr(Counter)+' per sec.';
    Counter:=0;
    LastTime:=TeeTickCount;
  end;

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

  function PoseToString(const APose:TPose):String;
  begin
    case Pose of
      TPose.Rest:       result:='Rest';
      TPose.Fist:       result:='Fist';
      TPose.WaveIn:     result:='Wave In';
      TPose.WaveOut:    result:='Wave Out';
   TPose.FingersSpread: result:='Fingers Spread';
      TPose.Reserved1:  result:='Reserved 1';
    TPose.ThumbToPinky: result:='Thumb to Pinky';
      TPose.Unknown:    result:='Unknown';
    end;
  end;

begin
  LPose.Caption:=PoseToString(Pose);
end;

procedure TMainForm.Myo1Rssi(Sender: TMyo; const Time: UInt64;
  const Rssi: Byte);
begin
  BSignal.Caption:='Signal: '+IntToStr(Rssi);
end;

procedure TMainForm.Myo1Unpair(Sender: TMyo; const Time: UInt64);
begin
  LPaired.Caption:='Unpaired';
  LPose.Caption:='';
  LTimesPerSec.Caption:='';
end;

end.
