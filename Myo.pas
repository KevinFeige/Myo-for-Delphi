// Ported to Delphi from C++ by @davidberneda
// david@steema.com
unit Myo;
{$I TeeDefs.inc}

{$SCOPEDENUMS ON}

interface

uses
  Classes, SysUtils,
  //System.Math.Vectors,
  MyoDLL;

type
  EMyoException = class(Exception);
  EMyoArgumentException = class(EMyoException);

  TFirmwareVersion = record
  public
    Major,
    Minor,
    Patch,
    Hardware : UInt32;

    function ToString:String;
  end;

  // Possible directions for Myo's +x axis relative to a user's arm.
  TXDirection = (TowardWrist, TowardElbow, Unknown);

  TOrientation = record  // TVector3D
    X,Y,Z,W : Float;
  end;

  TVector3 = record  // TPoint3D
    X,Y,Z : Float;
  end;

  TAccelerometer = TVector3;
  TGyroscope = TVector3;

  TArm = (Left,Right,Unknown);

  TVibrationType = (Short,Medium,Long);

  TPose = (Rest, Fist, WaveIn, WaveOut, FingersSpread, Reserved1, ThumbToPinky, Unknown);

  TRssi = Byte;

  TMyo = class;

  TArmRecognizedEvent = procedure(Sender:TMyo; const Time:UInt64; const Arm:TArm; const XDirection:TXDirection) of object;
  TPairEvent = procedure(Sender:TMyo; const Time:UInt64; const Version:TFirmwareVersion) of object;
  TUnpairEvent = procedure(Sender:TMyo; const Time:UInt64) of object;

  TOrientationEvent = procedure(Sender:TMyo; const Time:UInt64; const Orientation:TOrientation) of object;
  TAccelerometerEvent = procedure(Sender:TMyo; const Time:UInt64; const Accelerometer:TAccelerometer) of object;
  TGyroscopeEvent = procedure(Sender:TMyo; const Time:UInt64; const Gyroscope:TGyroscope) of object;

  TPoseEvent = procedure(Sender:TMyo; const Time:UInt64; const Pose:TPose) of object;

  TRssiEvent = procedure(Sender:TMyo; const Time:UInt64; const Rssi:TRssi) of object;

  {$IFDEF D16}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 (*or pidOSX32
              {$IFDEF D18}or pidiOSSimulator or pidiOSDevice{$ENDIF}
              {$IFDEF D19}or pidAndroid{$ENDIF}
              *)
              )]
  {$ENDIF}
  TMyo = class(TComponent)
  private
    FActive : Boolean;

    FError : Pointer;
    FHub : libmyo_hub_t;

    FMyo : libmyo_myo_t;

    FIdentifier : String;

    FOnArm : TArmRecognizedEvent;

    FOnConnect,
    FOnPair : TPairEvent;

    FOnArmLost,
    FOnDisconnect,
    FOnUnpair : TUnpairEvent;

    FOnOrientation : TOrientationEvent;
    FOnAccelerometer : TAccelerometerEvent;
    FOnGyroscope : TGyroscopeEvent;
    FOnPose : TPoseEvent;
    FOnRssi : TRssiEvent;

    IIdentifier : AnsiString;

    procedure CheckMyo;
    procedure DeviceEvent(event:libmyo_event_t);
    procedure SetActive(const Value:Boolean);
    procedure WaitForMyo(const ATimeoutMsec:Integer=10000);
  protected
    property Myo:libmyo_myo_t read FMyo;
  public
    Destructor Destroy; override;

    procedure Connect(AIdentifier:String=''; const ATimeoutMsec:Integer=10000);
    procedure Disconnect;
    procedure RequestRSSI;
    procedure Run(const Duration:Integer; const OnlyOnce:Boolean=False);
    procedure Vibrate(const AType:TVibrationType);
  published
    property Active:Boolean read FActive write SetActive default False;
    property Identifier:String read FIdentifier write FIdentifier;

    property OnAccelerometer:TAccelerometerEvent read FOnAccelerometer write FOnAccelerometer;
    property OnArmLost:TUnpairEvent read FOnArmLost write FOnArmLost;
    property OnArmRecognized:TArmRecognizedEvent read FOnArm write FOnArm;
    property OnConnect:TPairEvent read FOnConnect write FOnConnect;
    property OnDisconnect:TUnpairEvent read FOnDisconnect write FOnDisconnect;
    property OnGyroscope : TGyroscopeEvent read FOnGyroscope write FOnGyroscope;
    property OnOrientation : TOrientationEvent read FOnOrientation write FOnOrientation;
    property OnPair:TPairEvent read FOnPair write FOnPair;
    property OnPose:TPoseEvent read FOnPose write FOnPose;
    property OnRssi:TRssiEvent read FOnRssi write FOnRssi;
    property OnUnpair:TUnpairEvent read FOnUnpair write FOnUnpair;
  end;

implementation

uses
  AnsiStrings;

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

{ TMyo }

Destructor TMyo.Destroy;
begin
  if FHub<>nil then
  begin
    libmyo_shutdown_hub(FHub, FError);
    CheckError(FError);
  end;

  inherited;
end;

procedure TMyo.Connect(AIdentifier:String=''; const ATimeoutMsec:Integer=10000);
begin
  if FIdentifier='' then
     IIdentifier:=AnsiString('com.embarcadero.myo')
  else
     IIdentifier:=AnsiString(FIdentifier);

  if libmyo_init_hub(FHub, PAnsiChar(IIdentifier), FError) <> libmyo_success then
     CheckError(FError);

  waitForMyo(ATimeoutMsec);
  CheckMyo;
end;

procedure TMyo.CheckMyo;
begin
  if not Assigned(FMyo) then
     raise EMyoException.Create('Error Myo not paired or connected.');
end;

procedure TMyo.RequestRSSI;
begin
  CheckMyo;
  libmyo_request_rssi(FMyo,FError);
  CheckError(FError);
end;

procedure TMyo.Vibrate(const AType:TVibrationType);
begin
  CheckMyo;

  case AType of
    TVibrationType.Short: libmyo_vibrate(FMyo,libmyo_vibration_short,FError);
   TVibrationType.Medium: libmyo_vibrate(FMyo,libmyo_vibration_medium,FError);
  else
    libmyo_vibrate(FMyo,libmyo_vibration_long,FError);
  end;

  CheckError(FError);
end;

{ THub }

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

procedure TMyo.Run(const Duration: Integer; const OnlyOnce:Boolean=False);
begin
  CheckMyo;

  if OnlyOnce then
     libmyo_run(FHub, Duration, @HandlerStop, Self, FError)
  else
     libmyo_run(FHub, Duration, @HandlerContinue, Self, FError);

  CheckError(FError);
end;

procedure TMyo.SetActive(const Value: Boolean);
begin
  if Value then
     Connect
  else
     Disconnect;
end;

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

  function GetOrientation:TOrientation;
  begin
    result.X:=libmyo_event_get_orientation(event, libmyo_orientation_x);
    result.Y:=libmyo_event_get_orientation(event, libmyo_orientation_y);
    result.Z:=libmyo_event_get_orientation(event, libmyo_orientation_z);
    result.W:=libmyo_event_get_orientation(event, libmyo_orientation_w);
  end;

  function GetAccelerometer:TAccelerometer;
  begin
    result.X:=libmyo_event_get_accelerometer(event, 0);
    result.Y:=libmyo_event_get_accelerometer(event, 1);
    result.Z:=libmyo_event_get_accelerometer(event, 2);
  end;

  function GetGyroscope:TGyroscope;
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
      libmyo_arm_right: result:=TArm.Right;
      libmyo_arm_left: result:=TArm.Left;
    else
      result:=TArm.Unknown;
    end;
  end;

  function GetXDirection:TXDirection;
  begin
    case libmyo_event_get_x_direction(event) of
      libmyo_x_direction_toward_wrist: result:=TXDirection.TowardWrist;
      libmyo_x_direction_toward_elbow: result:=TXDirection.TowardElbow;
    else
      result:=TXDirection.Unknown;
    end;
  end;

  function GetPose:TPose;
  begin
    case libmyo_event_get_pose(event) of
        libmyo_pose_rest: result:=TPose.Rest;
        libmyo_pose_fist: result:=TPose.Fist;
        libmyo_pose_wave_in: result:=TPose.WaveIn;
        libmyo_pose_wave_out: result:=TPose.WaveOut;
        libmyo_pose_fingers_spread: result:=TPose.FingersSpread;
        libmyo_pose_reserved1: result:=TPose.Reserved1;
        libmyo_pose_thumb_to_pinky: result:=TPose.ThumbToPinky;
    else
       result:=TPose.Unknown;
    end;
  end;

var time : UInt64;
begin
  time:=libmyo_event_get_timestamp(event);

  case libmyo_event_get_type(event) of
      libmyo_event_paired:
           if Assigned(FOnPair) then
              FOnPair(myo, time, GetVersion);

      libmyo_event_unpaired:
           if Assigned(FOnUnpair) then
              FOnUnpair(myo, time);

      libmyo_event_connected:
        begin
          FActive:=True;

          if Assigned(FOnConnect) then
             FOnConnect(myo, time, GetVersion);
        end;

      libmyo_event_disconnected:
        begin
          FActive:=False;

          if Assigned(FOnDisconnect) then
             FOnDisconnect(myo, time);
        end;

      libmyo_event_arm_recognized:
           if Assigned(FOnArm) then
              FOnArm(myo, time, GetArm, GetXDirection);

        libmyo_event_arm_lost:
           if Assigned(FOnArmLost) then
              FOnArmLost(myo, time);

        libmyo_event_orientation:
          begin
            if Assigned(FOnOrientation) then
               FOnOrientation(myo, time, GetOrientation);

            if Assigned(FOnAccelerometer) then
               FOnAccelerometer(myo, time, GetAccelerometer);

            if Assigned(FOnGyroscope) then
               FOnGyroscope(myo, time, GetGyroscope);
          end;

    libmyo_event_pose:
          if Assigned(FOnPose) then
             FOnPose(myo, time, GetPose);

    libmyo_event_rssi:
          if Assigned(FOnRssi) then
             FOnRssi(myo, time, libmyo_event_get_rssi(event));
  end;
end;

procedure TMyo.Disconnect;
begin
  FActive:=False;
  FMyo:=nil;
end;

{ TFirmwareVersion }

function TFirmwareVersion.ToString: String;
begin
  result:=Major.ToString+'.'+Minor.ToString+'.'+Patch.ToString+' '+Hardware.ToString;
end;

end.
