unit MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, MyoComponent,
  FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMXTee.Engine, FMXTee.Series,
  FMXTee.Procs, FMXTee.Chart, DateUtils, System.Math.Vectors, FMX.Types3D,
  FMX.MaterialSources, FMX.Controls3D, FMX.Objects3D, FMX.Viewport3D;

type
  TMainForm = class(TForm)
    Myo1: TMyo;
    Layout1: TLayout;
    BVibrate: TButton;
    BConnect: TButton;
    Text1: TText;
    LArm: TLabel;
    LPaired: TLabel;
    Chart1: TChart;
    AccelX: TFastLineSeries;
    AccelY: TFastLineSeries;
    AccelZ: TFastLineSeries;
    Chart2: TChart;
    GyroX: TFastLineSeries;
    GyroY: TFastLineSeries;
    GyroZ: TFastLineSeries;
    Chart3: TChart;
    OrientX: TFastLineSeries;
    OrientY: TFastLineSeries;
    OrientZ: TFastLineSeries;
    OrientW: TFastLineSeries;
    LiveCharts: TCheckBox;
    CBLegends: TCheckBox;
    Text2: TText;
    LTimesPerSec: TText;
    LPose: TText;
    Viewport3D1: TViewport3D;
    Cone1: TCone;
    Light1: TLight;
    LightMaterialSource1: TLightMaterialSource;
    BSignal: TButton;
    procedure BConnectClick(Sender: TObject);
    procedure BVibrateClick(Sender: TObject);
    procedure Myo1Connect(Sender: TMyo; const Time: UInt64;
      const Version: TFirmwareVersion);
    procedure Myo1Disconnect(Sender: TMyo; const Time: UInt64);
    procedure Myo1Pair(Sender: TMyo; const Time: UInt64;
      const Version: TFirmwareVersion);
    procedure Myo1Unpair(Sender: TMyo; const Time: UInt64);
    procedure Myo1Pose(Sender: TMyo; const Time: UInt64; const Pose: TPose);
    procedure Myo1Rssi(Sender: TMyo; const Time: UInt64; const Rssi: Byte);
    procedure Myo1Orientation(Sender: TMyo; const Time: UInt64;
      const Orientation: TVector3D);
    procedure FormCreate(Sender: TObject);
    procedure CBLegendsChange(Sender: TObject);
    procedure Myo1Gyroscope(Sender: TMyo; const Time: UInt64;
      const Gyroscope: TPoint3D);
    procedure Myo1Accelerometer(Sender: TMyo; const Time: UInt64;
      const Accelerometer: TPoint3D);
    procedure BSignalClick(Sender: TObject);
    procedure LiveChartsChange(Sender: TObject);
    procedure Myo1ArmUnsynchronized(Sender: TMyo; const Time: UInt64);
    procedure Myo1ArmSynchronized(Sender: TMyo; const Time: UInt64;
      const Arm: TArm; const XDirection: TXDirection);
  private
    { Private declarations }

    Counter : Integer;
    LastTime: Single;
    TimeSize : TDateTime;

    StopRun : Boolean;

    procedure DoDisconnect;
  protected
     procedure DoIdle; virtual;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.BVibrateClick(Sender: TObject);
begin
  Myo1.Vibrate(TVibrationType.Short);
end;

procedure TMainForm.CBLegendsChange(Sender: TObject);
begin
  Chart1.Legend.Visible:=CBLegends.IsChecked;
  Chart2.Legend.Visible:=CBLegends.IsChecked;
  Chart3.Legend.Visible:=CBLegends.IsChecked;
end;

procedure TMainForm.DoIdle;
begin
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

  {$IFDEF ANDROID}
  Chart1.Visible:=False;
  Chart2.Visible:=False;
  Chart3.Visible:=False;
  {$ENDIF}

  HorizAxisDateTime(Chart1,True);
  HorizAxisDateTime(Chart2,True);
  HorizAxisDateTime(Chart3,True);
end;

procedure TMainForm.LiveChartsChange(Sender: TObject);
begin
  {$IFDEF ANDROID}
  Chart1.Visible:=True;
  Chart2.Visible:=True;
  Chart3.Visible:=True;
  {$ENDIF}
end;

procedure TMainForm.DoDisconnect;
begin
  BConnect.Text:='Connect';
  BConnect.Enabled:=True;

  BVibrate.Enabled:=False;
  Text1.Text:='';

  LArm.Text:='Arm: Unknown';
  LPose.Text:='';
end;

procedure TMainForm.BConnectClick(Sender: TObject);
begin
  BConnect.Enabled:=False;

  if Myo1.Active then
     Myo1.Active:=False
  else
  begin
    try
      Myo1.Active:=True;
    except
      on Exception do
      begin
        BConnect.Enabled:=True;
        raise;
      end;
    end;

    // Thread version: Myo1.Run;

    StopRun:=False;

    repeat
        // In each iteration of our main loop, we run the Myo event loop for a set number of milliseconds.
        // In this case, we wish to update our display 20 times a second, so we run for 1000/20 milliseconds.
        Myo1.Run(1000 div 50);
        Application.ProcessMessages;

    until StopRun or Application.Terminated;

    if not Application.Terminated then
       DoDisconnect;

  end;
end;

procedure TMainForm.Myo1Accelerometer(Sender: TMyo; const Time: UInt64;
  const Accelerometer: TPoint3D);
var tmp : TDateTime;
begin
  if LiveCharts.IsChecked then
  begin
    tmp:=Now;

    AccelX.AddXY(tmp,Accelerometer.X);
    AccelY.AddXY(tmp,Accelerometer.Y);
    AccelZ.AddXY(tmp,Accelerometer.Z);

    AccelX.GetHorizAxis.SetMinMax(tmp-TimeSize,tmp);
  end;
end;

procedure TMainForm.Myo1ArmSynchronized(Sender: TMyo; const Time: UInt64;
  const Arm: TArm; const XDirection: TXDirection);
begin
  case Arm of
    TArm.Left: LArm.Text:='Arm: Left';
   TArm.Right: LArm.Text:='Arm: Right';
  else
    LArm.Text:='Arm: Unknown';
  end;
end;

procedure TMainForm.Myo1ArmUnsynchronized(Sender: TMyo; const Time: UInt64);
begin
  LArm.Text:='Arm: Unknown';
  LPose.Text:='';
  LTimesPerSec.Text:='';
end;

procedure TMainForm.Myo1Connect(Sender: TMyo; const Time: UInt64;
  const Version: TFirmwareVersion);
begin
  BConnect.Text:='Disconnect';
  BConnect.Enabled:=True;

  BVibrate.Enabled:=True;
  Text1.Text:=Version.ToString;
end;

procedure TMainForm.Myo1Disconnect(Sender: TMyo; const Time: UInt64);
begin
  DoDisconnect;
end;

procedure TMainForm.Myo1Gyroscope(Sender: TMyo; const Time: UInt64;
  const Gyroscope: TPoint3D);
var tmp : TDateTime;
begin
  if LiveCharts.IsChecked then
  begin
    tmp:=Now;

    GyroX.AddXY(tmp,Gyroscope.X);
    GyroY.AddXY(tmp,Gyroscope.Y);
    GyroZ.AddXY(tmp,Gyroscope.Z);

    GyroX.GetHorizAxis.SetMinMax(tmp-TimeSize,tmp);
  end;

  //Cone1.RotationAngle.Point:=Gyroscope;
end;

procedure TMainForm.Myo1Orientation(Sender: TMyo; const Time: UInt64;
  const Orientation: TVector3D);
var tmp : TDateTime;
begin
  Inc(Counter);

  if TeeTickCount-LastTime>1000 then
  begin
    LTimesPerSec.Text:=IntToStr(Counter)+' per sec.';
    Counter:=0;
    LastTime:=TeeTickCount;
  end;

  if LiveCharts.IsChecked then
  begin
    tmp:=Now;

    OrientX.AddXY(tmp,Orientation.X);
    OrientY.AddXY(tmp,Orientation.Y);
    OrientZ.AddXY(tmp,Orientation.Z);
    OrientW.AddXY(tmp,Orientation.W);

    OrientX.GetHorizAxis.SetMinMax(tmp-TimeSize,tmp);
  end;

  Cone1.RotationAngle.Point:=Myo1.Orientation(Orientation);
end;

procedure TMainForm.Myo1Pair(Sender: TMyo; const Time: UInt64;
  const Version: TFirmwareVersion);
begin
  LPaired.Text:='Paired';
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
    TPose.DoubleTap:    result:='Double Tap';
      TPose.Unknown:    result:='Unknown';
    end;
  end;

begin
  LPose.Text:=PoseToString(Pose);
end;

procedure TMainForm.Myo1Rssi(Sender: TMyo; const Time: UInt64;
  const Rssi: Byte);
begin
  BSignal.Text:=Rssi.ToString;
end;

procedure TMainForm.Myo1Unpair(Sender: TMyo; const Time: UInt64);
begin
  LPaired.Text:='Unpaired';
end;

procedure TMainForm.BSignalClick(Sender: TObject);
begin
  Myo1.RequestRSSI;
end;

end.
