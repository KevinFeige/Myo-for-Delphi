// Ported to Delphi from C++ by @davidberneda
// david@steema.com
//
// Sources:
// https://github.com/davidberneda/Myo-for-Delphi

unit MyoComponent;
{$I TeeDefs.inc}

{$IFDEF D17}
{$SCOPEDENUMS ON}
{$ENDIF}

interface

uses
  Classes, SysUtils
  {$IFDEF D20}
  , System.Math.Vectors
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  ,MyoDLL
  {$ENDIF}
  {$IFDEF MACOS}
    {$IFDEF IOS}
    ,MyoiOS
    {$ELSE}
    ,MyoDLL
    {$ENDIF}
  {$ENDIF}
  {$IFDEF ANDROID}
  ,Androidapi.JNIBridge, Androidapi.JNI.JavaTypes, MyoAndroid
  {$ENDIF}
  ;

type
  EMyoException = class(Exception);
  EMyoArgumentException = class(EMyoException);

  {$IFNDEF MSWINDOWS}
  Float=Single;
  {$ENDIF}

  TFirmwareVersion = record
  {$IFDEF D9}
  public
  {$ENDIF}
    Major,
    Minor,
    Patch,
    Hardware : UInt32;

  {$IFDEF D9}
    function ToString:String;
  {$ENDIF}
  end;

  // Possible directions for Myo's +x axis relative to a user's arm.
  TXDirection = ({$IFDEF D9}Unknown{$ELSE}dirUnknown{$ENDIF}, TowardWrist, TowardElbow);

  {$IFNDEF D20}
  TVector3D = record
    X,Y,Z,W : Float;
  end;
  {$ENDIF}

  {$IFNDEF D20}
  TPoint3D = record
    X,Y,Z : Float;
  end;
  {$ENDIF}

  {$IFDEF D11}
  TQuaternionHelper = record helper for TVector3D
  public
    function Angles:TPoint3D;
  end;
  {$ENDIF}

  {$IFNDEF D9}
  TArm = (armUnknown, armLeft, armRight);
  {$ELSE}
  TArm = (Unknown,Left,Right);
  {$ENDIF}

  TVibrationType = (Short,Medium,Long);

  TPose = (Rest, Fist, WaveIn, WaveOut, FingersSpread, DoubleTap, {$IFDEF D9}Unknown{$ELSE}poseUnknown{$ENDIF});

  TRssi = Byte;

  TMyo = class;

  TArmEvent = procedure(Sender:TMyo; const Time:UInt64; const Arm:TArm; const XDirection:TXDirection) of object;
  TPairEvent = procedure(Sender:TMyo; const Time:UInt64; const Version:TFirmwareVersion) of object;
  TUnpairEvent = procedure(Sender:TMyo; const Time:UInt64) of object;

  TLockEvent = procedure(Sender:TMyo; const Time:UInt64) of object;

  TOrientationEvent = procedure(Sender:TMyo; const Time:UInt64; const Orientation:TVector3D) of object;
  TAccelerometerEvent = procedure(Sender:TMyo; const Time:UInt64; const Accelerometer:TPoint3D) of object;
  TGyroscopeEvent = procedure(Sender:TMyo; const Time:UInt64; const Gyroscope:TPoint3D) of object;

  TPoseEvent = procedure(Sender:TMyo; const Time:UInt64; const Pose:TPose) of object;

  TRssiEvent = procedure(Sender:TMyo; const Time:UInt64; const Rssi:TRssi) of object;

  {$IFDEF D16}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 (*or pidOSX32
              {$IFDEF D18}or pidiOSSimulator or pidiOSDevice{$ENDIF}
              *)
              {$IFDEF D19}or pidAndroid{$ENDIF}
              )]
  {$ENDIF}
  TMyo = class(TComponent)
  {$IFDEF ANDROID}
  private
    type
      TListener = class(TJavaLocal, JDeviceListener)
      private
        [Weak]FMyo : TMyo;

        function GetVersion:TFirmwareVersion;
      public
        procedure onAccelerometerData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
        procedure onArmSync(P1: JMyo; P2: Int64; P3: JArm; P4: JXDirection); cdecl;
        procedure onArmUnsync(P1: JMyo; P2: Int64); cdecl;
        procedure onAttach(P1: JMyo; P2: Int64); cdecl;
        procedure onConnect(P1: JMyo; P2: Int64); cdecl;
        procedure onDetach(P1: JMyo; P2: Int64); cdecl;
        procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
        procedure onGyroscopeData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
        procedure onLock(P1: JMyo; P2: Int64); cdecl;
        procedure onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;
        procedure onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;
        procedure onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
        procedure onUnlock(P1: JMyo; P2: Int64); cdecl;
      end;
  {$ENDIF}

  private
    FActive : Boolean;

    {$IFNDEF ANDROID}
    FError : Pointer;
    {$ENDIF}

    FHub : {$IFDEF ANDROID}JHub{$ELSE}{$IFDEF IOS}TLMHub{$ELSE}libmyo_hub_t{$ENDIF}{$ENDIF};
    FMyo : {$IFDEF ANDROID}JMyo{$ELSE}{$IFDEF IOS}TLMMyo{$ELSE}libmyo_myo_t{$ENDIF}{$ENDIF};

    {$IFDEF ANDROID}
    FListener : TListener;
    {$ENDIF}

    FArm : TArm;
    FXDirection : TXDirection;

    FIdentifier : String;

    FOnArmSync : TArmEvent;

    FOnConnect,
    FOnPair : TPairEvent;

    FOnArmUnsync,
    FOnDisconnect,
    FOnUnpair : TUnpairEvent;

    FOnOrientation : TOrientationEvent;
    FOnAccelerometer : TAccelerometerEvent;
    FOnGyroscope : TGyroscopeEvent;
    FOnLock : TLockEvent;
    FOnPose : TPoseEvent;
    FOnRssi : TRssiEvent;
    FOnUnlock : TLockEvent;

    IIdentifier : {$IFDEF ANDROID}JString{$ELSE}{$IFDEF MSWINDOWS}AnsiString{$ELSE}String{$ENDIF}{$ENDIF};

    {$IFDEF MSWINDOWS}
    IStopRun : Boolean;
    IThread : TThread;
    {$ENDIF}

    procedure CheckMyo;
    function GetMyoName:String;
    procedure InnerRun(const Duration: Integer; const OnlyOnce:Boolean=False);

    {$IFDEF ANDROID}
    function GetMyoFirmware:String;
    {$ELSE}
    procedure DeviceEvent(event:libmyo_event_t);
    procedure WaitForMyo(const ATimeoutMsec:Integer=10000);
    {$ENDIF}

    procedure SetActive(const Value:Boolean);
    procedure SetArmUnknown;
  protected
    property Myo:{$IFDEF ANDROID}JMyo{$ELSE}libmyo_myo_t{$ENDIF} read FMyo;
  public
    {$IFDEF ANDROID}
    Constructor Create(AOwner:TComponent); override;
    {$ENDIF}

    Destructor Destroy; override;

    procedure Connect(AIdentifier:String=''; const ATimeoutMsec:Integer=10000);
    procedure Disconnect(const ATime:Int64=0);

    function Orientation(const AOrientation:TVector3D):TPoint3D;
    procedure RequestRSSI;
    procedure Run; overload;
    procedure Run(const Duration:Integer; const OnlyOnce:Boolean=False); overload;

    class function Version(const AVersion:TFirmwareVersion):String;

    procedure Vibrate(const AType:TVibrationType);

    property Arm:TArm read FArm default {$IFDEF D9}TArm.Unknown{$ELSE}armUnknown{$ENDIF};

    {$IFDEF ANDROID}
    property Firmware:String read GetMyoFirmware;
    {$ENDIF}

    property MyoName:String read GetMyoName;
    property XDirection:TXDirection read FXDirection default {$IFDEF D9}TXDirection.Unknown{$ELSE}dirUnknown{$ENDIF};
  published
    property Active:Boolean read FActive write SetActive default False;
    property Identifier:String read FIdentifier write FIdentifier;

    property OnAccelerometer:TAccelerometerEvent read FOnAccelerometer write FOnAccelerometer;
    property OnArmUnsynchronized:TUnpairEvent read FOnArmUnsync write FOnArmUnsync;
    property OnArmSynchronized:TArmEvent read FOnArmSync write FOnArmSync;
    property OnConnect:TPairEvent read FOnConnect write FOnConnect;
    property OnDisconnect:TUnpairEvent read FOnDisconnect write FOnDisconnect;
    property OnGyroscope : TGyroscopeEvent read FOnGyroscope write FOnGyroscope;
    property OnLock:TLockEvent read FOnLock write FOnLock;
    property OnOrientation : TOrientationEvent read FOnOrientation write FOnOrientation;
    property OnPair:TPairEvent read FOnPair write FOnPair;
    property OnPose:TPoseEvent read FOnPose write FOnPose;
    property OnRssi:TRssiEvent read FOnRssi write FOnRssi;
    property OnUnlock:TLockEvent read FOnUnlock write FOnUnlock;
    property OnUnpair:TUnpairEvent read FOnUnpair write FOnUnpair;
  end;

implementation

uses
  Math
  {$IFDEF MSWINDOWS}
  {$IFDEF D9}
  ,AnsiStrings
  {$ENDIF}

  (*
  {$IFDEF FMX}
  ,FMX.Forms
  {$ELSE}
  ,VCL.Forms
  {$ENDIF}
  *)

  {$ENDIF}
  {$IFDEF ANDROID}
  ,Androidapi.Helpers, Androidapi.JNI.GraphicsContentViewText
  ,Androidapi.JNI.Bluetooth
  {$ENDIF}
  ;

{$IFNDEF ANDROID}
{$IFNDEF IOS}
procedure CheckError(const AError:Pointer);
var tmp : String;
begin
  if AError<>nil then
  begin
    case libmyo_error_kind(AError) of
      libmyo_error,
      libmyo_error_runtime:
            begin
                tmp:=libmyo_error_cstring(AError);
                libmyo_free_error_details(AError);
                raise EMyoException.Create('Myo Error: '+tmp);
            end;
      libmyo_error_invalid_argument:
            begin
                tmp:=libmyo_error_cstring(AError);
                libmyo_free_error_details(AError);
                raise EMyoArgumentException.Create('Myo Invalid Argument: '+tmp);
            end;
      libmyo_success: ;
    end;
  end;
end;
{$ENDIF}
{$ENDIF}

{ TMyo }

{$IFDEF ANDROID}
Constructor TMyo.Create(AOwner:TComponent);
begin
  inherited;
  FHub:=TJHub.JavaClass.getInstance;
end;

function TMyo.GetMyoFirmware:String;
begin
  CheckMyo;

  result:=JStringToString(FMyo.getFirmwareVersion.toString);
end;
{$ENDIF}

Destructor TMyo.Destroy;
begin
  {$IFDEF MSWINDOWS}
  IStopRun:=True;

  if Assigned(IThread) then
  begin
    IThread.Terminate;
    IThread:=nil;
  end;
  {$ENDIF}

  if FHub<>nil then
  begin
    {$IFDEF ANDROID}
    if Assigned(FListener) then
    begin
      FHub.removeListener(FListener);
      FListener.Free;

      FHub.shutdown;
    end;

    FHub:=nil;

    {$ELSE}
    libmyo_shutdown_hub(FHub, FError);
    CheckError(FError);
    {$ENDIF}
  end;

  inherited;
end;

procedure TMyo.Connect(AIdentifier:String=''; const ATimeoutMsec:Integer=10000);
{$IFDEF ANDROID}
var tmpContext : JContext;
{$ENDIF}
{$IFDEF MACOS}
var M : TMarshaller;
{$ENDIF}
begin
  {$IFDEF ANDROID}
  tmpContext:=SharedActivityContext;

//  if not TJBluetoothAdapter.JavaClass.getDefaultAdapter.isEnabled then
//     raise EMyoException.Create('Error Bluetooh is not enabled.');

  if FIdentifier='' then
     IIdentifier:=tmpContext.getPackageName
  else
     IIdentifier:=StringToJString(FIdentifier);

  //TThread.Queue(nil,procedure
  //  begin
      if not FHub.init(tmpContext,IIdentifier) then
         raise EMyoException.Create('Error Myo not paired or connected.');
  //  end);

  if not Assigned(FListener) then
  begin
    FListener:=TListener.Create;
    FListener.FMyo:=Self;
  end;

  FHub.addListener(FListener);

  FHub.attachToAdjacentMyo; // pairWithAnyMyo;

  FActive:=True;

  {$ELSE}
  if FIdentifier='' then
     IIdentifier:={$IFDEF MSWINDOWS}AnsiString{$ENDIF}('com.steema.myo')
  else
     IIdentifier:={$IFDEF MSWINDOWS}AnsiString{$ENDIF}(FIdentifier);

  {$IFDEF MSWINDOWS}
  if libmyo_init_hub(FHub, PAnsiChar(IIdentifier), FError) <> libmyo_success then
  {$ELSE}
  {$IFDEF MACOS}
  if libmyo_init_hub(FHub, M.AsAnsi(IIdentifier).ToPointer, FError) <> libmyo_success then
  {$ENDIF}
  {$ENDIF}
     CheckError(FError);

  waitForMyo(ATimeoutMsec);
  {$ENDIF}

  CheckMyo;
end;

procedure TMyo.CheckMyo;
begin
  if not Assigned(FMyo) then
     raise EMyoException.Create('Error Myo not paired or connected.');
end;

function TMyo.GetMyoName:String;
begin
  CheckMyo;

  result:={$IFDEF ANDROID}JStringToString(FMyo.getName){$ELSE}''{$ENDIF};
end;

procedure TMyo.RequestRSSI;
begin
  CheckMyo;

  {$IFDEF MSWINDOWS}
  libmyo_request_rssi(FMyo,FError);
  CheckError(FError);
  {$ENDIF}

  {$IFDEF ANDROID}
  FMyo.requestRSSI;
  {$ENDIF}
end;

procedure TMyo.Vibrate(const AType:TVibrationType);
begin
  CheckMyo;

  {$IFDEF MSWINDOWS}
  case AType of
    {$IFDEF D9}TVibrationType.{$ENDIF}Short: libmyo_vibrate(FMyo,libmyo_vibration_short,FError);
   {$IFDEF D9}TVibrationType.{$ENDIF}Medium: libmyo_vibrate(FMyo,libmyo_vibration_medium,FError);
  else
    libmyo_vibrate(FMyo,libmyo_vibration_long,FError);
  end;

  CheckError(FError);
  {$ENDIF}

  {$IFDEF ANDROID}
  case AType of
    TVibrationType.Short: FMyo.Vibrate(TJMyo_VibrationType.JavaClass.SHORT);
   TVibrationType.Medium: FMyo.Vibrate(TJMyo_VibrationType.JavaClass.MEDIUM);
  else
    FMyo.Vibrate(TJMyo_VibrationType.JavaClass.LONG);
  end;
  {$ENDIF}
end;

{$IFNDEF ANDROID}
type
  TMyoHandler=function(user_data:Pointer; event:libmyo_event_t):libmyo_handler_result_t;

function HandlerContinue(user_data:Pointer; event:libmyo_event_t):libmyo_handler_result_t; cdecl;
begin
  TMyo(user_data).DeviceEvent(event);
  result:=libmyo_handler_continue;
end;

function HandlerStop(user_data:Pointer; event:libmyo_event_t):libmyo_handler_result_t; cdecl;
begin
  TMyo(user_data).DeviceEvent(event);
  result:=libmyo_handler_stop;
end;
{$ENDIF}

procedure TMyo.Run;
begin
  {$IFDEF MSWINDOWS}
  CheckMyo;

  {$IFDEF D9}
  IThread:=TThread.CreateAnonymousThread(procedure
  begin
    IStopRun:=False;

    repeat
      IThread.Synchronize(IThread,procedure
         begin
           InnerRun(1000 div 50);
         end);

    until (not Assigned(IThread)) or IThread.Finished or IStopRun {or Application.Terminated};

    //if not Application.Terminated then
       Disconnect;
  end);

  IThread.Start;
  {$ELSE}
  IThread.Resume;
  {$ENDIF}
  {$ENDIF}
end;

procedure TMyo.InnerRun(const Duration: Integer; const OnlyOnce:Boolean=False);
begin
  {$IFDEF MSWINDOWS}
  if not IStopRun then
  {$ENDIF}
  begin
    {$IFDEF ANDROID}
    //FHub.run;
    {$ELSE}
    if OnlyOnce then
       libmyo_run(FHub, Duration, @HandlerStop, Self, FError)
    else
       libmyo_run(FHub, Duration, @HandlerContinue, Self, FError);

    CheckError(FError);
    {$ENDIF}
  end;
end;

procedure TMyo.Run(const Duration: Integer; const OnlyOnce:Boolean=False);
begin
  CheckMyo;
  InnerRun(Duration,OnlyOnce);
end;

class function TMyo.Version(const AVersion:TFirmwareVersion):String;
begin
  with AVersion do
    result:=IntToStr(Major)+'.'+IntToStr(Minor)+'.'+
            IntToStr(Patch)+'.'+IntToStr(Hardware);
end;

procedure TMyo.SetActive(const Value: Boolean);
begin
  if Value then
     Connect
  else
     Disconnect;
end;

{$IFNDEF ANDROID}
{$IFNDEF IOS}
function HandlerWait(user_data:Pointer; event:libmyo_event_t):libmyo_handler_result_t; cdecl;
begin
  if libmyo_event_get_type(event) = libmyo_event_paired then
  begin
    TMyo(user_data).FMyo:=libmyo_event_get_myo(event);
    result:=libmyo_handler_stop;
  end
  else
     result:=libmyo_handler_continue;
end;

procedure TMyo.WaitForMyo(const ATimeoutMsec: Integer);
var tmp : libmyo_result_t;
begin
  repeat
    tmp:=libmyo_run(FHub, ATimeoutMsec, @HandlerWait, Self, FError);
    CheckError(FError);
  until tmp = libmyo_success;
end;

procedure TMyo.DeviceEvent(event:libmyo_event_t);

  function GetOrientation:TVector3D;
  begin
    result.X:=libmyo_event_get_orientation(event, libmyo_orientation_x);
    result.Y:=libmyo_event_get_orientation(event, libmyo_orientation_y);
    result.Z:=libmyo_event_get_orientation(event, libmyo_orientation_z);
    result.W:=libmyo_event_get_orientation(event, libmyo_orientation_w);
  end;

  function GetAccelerometer:TPoint3D;
  begin
    result.X:=libmyo_event_get_accelerometer(event, 0);
    result.Y:=libmyo_event_get_accelerometer(event, 1);
    result.Z:=libmyo_event_get_accelerometer(event, 2);
  end;

  function GetGyroscope:TPoint3D;
  begin
    result.X:=libmyo_event_get_gyroscope(event, 0);
    result.Y:=libmyo_event_get_gyroscope(event, 1);
    result.Z:=libmyo_event_get_gyroscope(event, 2);
  end;

  function GetVersion:TFirmwareVersion;
  begin
    result.Major:=libmyo_event_get_firmware_version(event,libmyo_version_major);
    result.Minor:=libmyo_event_get_firmware_version(event,libmyo_version_minor);
    result.Patch:=libmyo_event_get_firmware_version(event,libmyo_version_patch);
    result.Hardware:=libmyo_event_get_firmware_version(event,libmyo_version_hardware_rev);
  end;

  function GetArm:TArm;
  begin
    case libmyo_event_get_arm(event) of
      libmyo_arm_right: result:={$IFDEF D9}TArm.Right{$ELSE}armRight{$ENDIF};
       libmyo_arm_left: result:={$IFDEF D9}TArm.Left{$ELSE}armLeft{$ENDIF};
    else
      result:={$IFDEF D9}TArm.Unknown{$ELSE}armUnknown{$ENDIF};
    end;
  end;

  function GetXDirection:TXDirection;
  begin
    case libmyo_event_get_x_direction(event) of
      libmyo_x_direction_toward_wrist: result:={$IFDEF D9}TXDirection.{$ENDIF}TowardWrist;
      libmyo_x_direction_toward_elbow: result:={$IFDEF D9}TXDirection.{$ENDIF}TowardElbow;
    else
      result:={$IFDEF D9}TXDirection.Unknown{$ELSE}dirUnknown{$ENDIF};
    end;
  end;

  function GetPose:TPose;
  begin
    case libmyo_event_get_pose(event) of
          libmyo_pose_rest: result:={$IFDEF D9}TPose.{$ENDIF}Rest;
          libmyo_pose_fist: result:={$IFDEF D9}TPose.{$ENDIF}Fist;
       libmyo_pose_wave_in: result:={$IFDEF D9}TPose.{$ENDIF}WaveIn;
      libmyo_pose_wave_out: result:={$IFDEF D9}TPose.{$ENDIF}WaveOut;
libmyo_pose_fingers_spread: result:={$IFDEF D9}TPose.{$ENDIF}FingersSpread;
    libmyo_pose_double_tap: result:={$IFDEF D9}TPose.{$ENDIF}DoubleTap;
    else
       result:={$IFDEF D9}TPose.Unknown{$ELSE}poseUnknown{$ENDIF};
    end;
  end;

var time : UInt64;
begin
  time:=libmyo_event_get_timestamp(event);

  case libmyo_event_get_type(event) of
      libmyo_event_paired:
           if Assigned(FOnPair) then
              FOnPair(Myo, time, GetVersion);

      libmyo_event_unpaired:
        begin
          Disconnect(time);

          if Assigned(FOnUnpair) then
             FOnUnpair(Myo, time);
        end;

      libmyo_event_connected:
        begin
          FActive:=True;

          if Assigned(FOnConnect) then
             FOnConnect(Myo, time, GetVersion);
        end;

      libmyo_event_disconnected: Disconnect(time);

      libmyo_event_arm_synced:
         begin
           FArm:=GetArm;
           FXDirection:=GetXDirection;

           if Assigned(FOnArmSync) then
              FOnArmSync(Myo, time, FArm, FXDirection);
         end;

      libmyo_event_arm_unsynced:
         begin
           SetArmUnknown;

           if Assigned(FOnArmUnsync) then
              FOnArmUnsync(Myo, time);
         end;

      libmyo_event_orientation:
          begin
            if Assigned(FOnOrientation) then
               FOnOrientation(Myo, time, GetOrientation);

            if Assigned(FOnAccelerometer) then
               FOnAccelerometer(Myo, time, GetAccelerometer);

            if Assigned(FOnGyroscope) then
               FOnGyroscope(Myo, time, GetGyroscope);
          end;

      libmyo_event_pose:
          if Assigned(FOnPose) then
             FOnPose(Myo, time, GetPose);

      libmyo_event_rssi:
          if Assigned(FOnRssi) then
             FOnRssi(Myo, time, libmyo_event_get_rssi(event));

      libmyo_event_locked:
          if Assigned(FOnLock) then
             FOnLock(Myo, time);

      libmyo_event_unlocked:
          if Assigned(FOnUnlock) then
             FOnUnlock(Myo, time);
  end;
end;
{$ENDIF}
{$ENDIF}

procedure TMyo.SetArmUnknown;
begin
  FArm:={$IFDEF D9}TArm.Unknown{$ELSE}armUnknown{$ENDIF};
  FXDirection:={$IFDEF D9}TXDirection.Unknown{$ELSE}dirUnknown{$ENDIF};
end;

procedure TMyo.Disconnect(const ATime:Int64=0);
begin
  FActive:=False;
  FMyo:=nil;

  SetArmUnknown;

  {$IFDEF MSWINDOWS}
  IStopRun:=True;

  if Assigned(IThread) then
  begin
    IThread.Terminate;
    IThread:=nil;
  end;
  {$ENDIF}

  if Assigned(FOnDisconnect) then
     FOnDisconnect(Self, ATime);
end;

{$IFNDEF D9}
function VectorAngles(const AVector:TVector3D):TPoint3D;
begin

end;
{$ENDIF}

function TMyo.Orientation(const AOrientation: TVector3D): TPoint3D;
begin
  result:={$IFDEF D9}AOrientation.Angles{$ELSE}VectorAngles(AOrientation){$ENDIF};

  if FXDirection={$IFDEF D9}TXDirection.{$ENDIF}TowardElbow then
  begin
    result.X:=-1*result.X; // Roll
    result.Y:=-1*result.Y; // Pitch
  end;
end;

{ TFirmwareVersion }

{$IFDEF D9}
function TFirmwareVersion.ToString: String;
begin
  result:=Major.ToString+'.'+Minor.ToString+'.'+Patch.ToString+' '+Hardware.ToString;
end;
{$ENDIF}

{$IFDEF ANDROID}
function TMyo.TListener.GetVersion:TFirmwareVersion;
begin
  // FMyo.getFirmwareVersionString ?

  // Problem: How to obtain JFirmwareVersion here?
  result.Major:=0;
  result.Minor:=0;
  result.Patch:=0;
  result.Hardware:=0;
end;

procedure TMyo.TListener.onAccelerometerData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;

  function GetAccelerometer:TPoint3D;
  begin
    result.X:=P3.x;
    result.Y:=P3.y;
    result.Z:=P3.z;
  end;

begin
  if Assigned(FMyo.FOnAccelerometer) then
     FMyo.FOnAccelerometer(FMyo, P2, GetAccelerometer);
end;

procedure TMyo.TListener.onAttach(P1: JMyo; P2: Int64); cdecl;
begin
  onConnect(P1,P2);
end;

procedure TMyo.TListener.onArmUnsync(P1: JMyo; P2: Int64); cdecl;
begin
  FMyo.FArm:=TArm.Unknown;
  FMyo.FXDirection:=TXDirection.Unknown;

  if Assigned(FMyo.FOnArmUnsync) then
     FMyo.FOnArmUnsync(FMyo, P2);
end;

procedure TMyo.TListener.onArmSync(P1: JMyo; P2: Int64; P3: JArm; P4: JXDirection); cdecl;

  function GetArm:TArm;
  begin
    if P3=TJArm.JavaClass.LEFT then
       result:=TArm.Left
    else
    if P3=TJArm.JavaClass.RIGHT then
       result:=TArm.Right
    else
       result:=TArm.Unknown;
  end;

  function GetXDirection:TXDirection;
  begin
    if P4=TJXDirection.JavaClass.TOWARD_WRIST then
       result:=TXDirection.TowardWrist
    else
    if P4=TJXDirection.JavaClass.TOWARD_ELBOW then
       result:=TXDirection.TowardElbow
    else
       result:=TXDirection.Unknown;
  end;

begin
  FMyo.FArm:=GetArm;
  FMyo.FXDirection:=GetXDirection;

  if Assigned(FMyo.FOnArmSync) then
     FMyo.FOnArmSync(FMyo, P2, FMyo.FArm, FMyo.FXDirection);
end;

procedure TMyo.TListener.onConnect(P1: JMyo; P2: Int64); cdecl;
begin
  FMyo.FMyo:=P1;
  FMyo.FActive:=True;

  if Assigned(FMyo.FOnConnect) then
     FMyo.FOnConnect(FMyo, P2, GetVersion);
end;

procedure TMyo.TListener.onDetach(P1: JMyo; P2: Int64); cdecl;
begin
  onDisconnect(P1,P2);
end;

procedure TMyo.TListener.onDisconnect(P1: JMyo; P2: Int64); cdecl;
begin
  FMyo.Disconnect(P2);
  FMyo.FMyo:=nil;
end;

procedure TMyo.TListener.onGyroscopeData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;

  function GetGyroscope:TPoint3D;
  begin
    result.X:=P3.x;
    result.Y:=P3.y;
    result.Z:=P3.z;
  end;

begin
  if Assigned(FMyo.FOnGyroscope) then
     FMyo.FOnGyroscope(FMyo, P2, GetGyroscope);
end;

procedure TMyo.TListener.onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;

  function GetOrientation:TVector3D;
  begin
    result.X:=P3.x;
    result.Y:=P3.y;
    result.Z:=P3.z;
    result.W:=P3.w;
  end;

begin
  if Assigned(FMyo.FOnOrientation) then
     FMyo.FOnOrientation(FMyo, P2, GetOrientation);
end;

procedure TMyo.TListener.onLock(P1: JMyo; P2: Int64); cdecl;
begin
  if Assigned(FMyo.FOnLock) then
     FMyo.FOnLock(FMyo, P2);
end;

procedure TMyo.TListener.onUnlock(P1: JMyo; P2: Int64); cdecl;
begin
  if Assigned(FMyo.FOnUnlock) then
     FMyo.FOnUnlock(FMyo, P2);
end;

procedure TMyo.TListener.onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;

  function GetPose:TPose;
  begin
    if P3=TJPose.JavaClass.REST then
       result:=TPose.Rest
    else
    if P3=TJPose.JavaClass.FIST then
       result:=TPose.Fist
    else
    if P3=TJPose.JavaClass.WAVE_IN then
       result:=TPose.WaveIn
    else
    if P3=TJPose.JavaClass.WAVE_OUT then
       result:=TPose.WaveOut
    else
    if P3=TJPose.JavaClass.FINGERS_SPREAD then
       result:=TPose.FingersSpread
    else
    if P3=TJPose.JavaClass.DOUBLE_TAP then
       result:=TPose.DoubleTap
    else
       result:=TPose.Unknown;
  end;

begin
  if Assigned(FMyo.FOnPose) then
     FMyo.FOnPose(FMyo, P2, GetPose);
end;

procedure TMyo.TListener.onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
begin
  if Assigned(FMyo.FOnRssi) then
     FMyo.FOnRssi(FMyo, P2, P3);
end;
{$ENDIF}

{$IFDEF D11}
function TQuaternionHelper.Angles:TPoint3D;
const
  TwoPi = 2.0*Pi;
begin
 // From Myo Windows SDK, hello-myo.cpp sample:

 result.X:=ArcTan2(2*(W*X+Y*Z),1-2*(X*X+Y*Y));  // Roll
 result.X:=360*(result.X+Pi)/TwoPi;

 result.Y:=ArcSin(Max(-1,Min(1,2*(W*Y-Z*X))));  // Pitch
 result.Y:=360*(result.Y+(0.5*Pi))/Pi;

 result.Z:=ArcTan2(2*(W*Z+X*Y),1-2*(Y*Y+Z*Z));  // Yaw
 result.Z:=360*(result.Z+Pi)/TwoPi;
end;
{$ENDIF}

end.
