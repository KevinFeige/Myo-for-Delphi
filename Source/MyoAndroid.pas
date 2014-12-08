{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit MyoAndroid;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Widget,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.JNI.Os,
  Androidapi.JNI.Net,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.App;

type
// ===== Forward declarations =====

  JAsyncTask = interface;//android.os.AsyncTask
  JAsyncTask_Status = interface;//android.os.AsyncTask$Status
  JPair = interface;//android.util.Pair
  JProgressBar = interface;//android.widget.ProgressBar
  JAbstractDeviceListener = interface;//com.thalmic.myo.AbstractDeviceListener
  JArm = interface;//com.thalmic.myo.Arm
  Jmyo_BuildConfig = interface;//com.thalmic.myo.BuildConfig
  JClassifierEvent = interface;//com.thalmic.myo.ClassifierEvent
  JClassifierEvent_1 = interface;//com.thalmic.myo.ClassifierEvent$1
  JClassifierEvent_ClassifierEventFormat = interface;//com.thalmic.myo.ClassifierEvent$ClassifierEventFormat
  JClassifierEvent_Type = interface;//com.thalmic.myo.ClassifierEvent$Type
  JControlCommand = interface;//com.thalmic.myo.ControlCommand
  JControlCommand_1 = interface;//com.thalmic.myo.ControlCommand$1
  JControlCommand_EmgMode = interface;//com.thalmic.myo.ControlCommand$EmgMode
  JControlCommand_SetMode = interface;//com.thalmic.myo.ControlCommand$SetMode
  JControlCommand_Unlock = interface;//com.thalmic.myo.ControlCommand$Unlock
  JControlCommand_UserAction = interface;//com.thalmic.myo.ControlCommand$UserAction
  JControlCommand_Vibration = interface;//com.thalmic.myo.ControlCommand$Vibration
  JDeviceListener = interface;//com.thalmic.myo.DeviceListener
  JFirmwareInfo = interface;//com.thalmic.myo.FirmwareInfo
  JFirmwareVersion = interface;//com.thalmic.myo.FirmwareVersion
  JBleGattCallback = interface;//com.thalmic.myo.internal.ble.BleGattCallback
  JGattCallback = interface;//com.thalmic.myo.GattCallback
  JGattCallback_InitReadChar = interface;//com.thalmic.myo.GattCallback$InitReadChar
  JGattCallback_ValueListener = interface;//com.thalmic.myo.GattCallback$ValueListener
  JGattCallback_UpdateParser = interface;//com.thalmic.myo.GattCallback$UpdateParser
  JGattConstants = interface;//com.thalmic.myo.GattConstants
  JHub = interface;//com.thalmic.myo.Hub
  JHub_1 = interface;//com.thalmic.myo.Hub$1
  JHub_2 = interface;//com.thalmic.myo.Hub$2
  JHub_3 = interface;//com.thalmic.myo.Hub$3
  JHub_InstanceHolder = interface;//com.thalmic.myo.Hub$InstanceHolder
  JHub_LockingPolicy = interface;//com.thalmic.myo.Hub$LockingPolicy
  JHub_ScanItemClickListener = interface;//com.thalmic.myo.Hub$ScanItemClickListener
  JMultiListener = interface;//com.thalmic.myo.MultiListener
  JMyo = interface;//com.thalmic.myo.Myo
  JMyo_ConnectionState = interface;//com.thalmic.myo.Myo$ConnectionState
  JMyo_UnlockType = interface;//com.thalmic.myo.Myo$UnlockType
  JMyo_VibrationType = interface;//com.thalmic.myo.Myo$VibrationType
  JMyoGatt = interface;//com.thalmic.myo.MyoGatt
  JMyoUpdateParser = interface;//com.thalmic.myo.MyoUpdateParser
  JMyoUpdateParser_1 = interface;//com.thalmic.myo.MyoUpdateParser$1
  JPose = interface;//com.thalmic.myo.Pose
  JQuaternion = interface;//com.thalmic.myo.Quaternion
  JReporter = interface;//com.thalmic.myo.Reporter
  JReporter_1 = interface;//com.thalmic.myo.Reporter$1
  JScanListener = interface;//com.thalmic.myo.ScanListener
  JScanListener_1 = interface;//com.thalmic.myo.ScanListener$1
  JScanListener_AttachMode = interface;//com.thalmic.myo.ScanListener$AttachMode
  JVector3 = interface;//com.thalmic.myo.Vector3
  JXDirection = interface;//com.thalmic.myo.XDirection
  Jble_Address = interface;//com.thalmic.myo.internal.ble.Address
  JBleFactory = interface;//com.thalmic.myo.internal.ble.BleFactory
  JBleGatt = interface;//com.thalmic.myo.internal.ble.BleGatt
  JBleManager = interface;//com.thalmic.myo.internal.ble.BleManager
  JBleManager_BleScanCallback = interface;//com.thalmic.myo.internal.ble.BleManager$BleScanCallback
  JJBBleManager = interface;//com.thalmic.myo.internal.ble.JBBleManager
  JJBBleManager_LeScanCallback = interface;//com.thalmic.myo.internal.ble.JBBleManager$LeScanCallback
  JJBBluetoothLeController = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController
  JJBBluetoothLeController_1 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$1
  J1_1 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$1$1
  J1_2 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$1$2
  J1_3 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$1$3
  J1_4 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$1$4
  J1_5 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$1$5
  J1_6 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$1$6
  JJBBluetoothLeController_2 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$2
  JJBBluetoothLeController_3 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$3
  JJBBluetoothLeController_4 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$4
  JJBBluetoothLeController_5 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$5
  JJBBluetoothLeController_6 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$6
  JJBBluetoothLeController_7 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$7
  JJBBluetoothLeController_8 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$8
  JJBBluetoothLeController_9 = interface;//com.thalmic.myo.internal.ble.JBBluetoothLeController$9
  JByteUtil = interface;//com.thalmic.myo.internal.util.ByteUtil
  JNetworkUtil = interface;//com.thalmic.myo.internal.util.NetworkUtil
  JMyoDeviceListAdapter = interface;//com.thalmic.myo.scanner.MyoDeviceListAdapter
  JMyoDeviceListAdapter_1 = interface;//com.thalmic.myo.scanner.MyoDeviceListAdapter$1
  JMyoDeviceListAdapter_Item = interface;//com.thalmic.myo.scanner.MyoDeviceListAdapter$Item
  JMyoDeviceListAdapter_RssiComparator = interface;//com.thalmic.myo.scanner.MyoDeviceListAdapter$RssiComparator
  JMyoDeviceListAdapter_ViewHolder = interface;//com.thalmic.myo.scanner.MyoDeviceListAdapter$ViewHolder
  JScanActivity = interface;//com.thalmic.myo.scanner.ScanActivity
  JScanFragment = interface;//com.thalmic.myo.scanner.ScanFragment
  JScanFragment_1 = interface;//com.thalmic.myo.scanner.ScanFragment$1
  Jscanner_Scanner = interface;//com.thalmic.myo.scanner.Scanner
  JScanner_1 = interface;//com.thalmic.myo.scanner.Scanner$1
  JScanner_2 = interface;//com.thalmic.myo.scanner.Scanner$2
  JScanner_OnMyoClickedListener = interface;//com.thalmic.myo.scanner.Scanner$OnMyoClickedListener
  JScanner_OnMyoScannedListener = interface;//com.thalmic.myo.scanner.Scanner$OnMyoScannedListener
  JScanner_OnScanningStartedListener = interface;//com.thalmic.myo.scanner.Scanner$OnScanningStartedListener
  JScanner_ScanCallback = interface;//com.thalmic.myo.scanner.Scanner$ScanCallback
  JScanCallback_1 = interface;//com.thalmic.myo.scanner.Scanner$ScanCallback$1
  JScanner_ScanListAdapter = interface;//com.thalmic.myo.scanner.Scanner$ScanListAdapter
  JVoid = interface;//java.lang.Void

// ===== Interface declarations =====

  JAsyncTaskClass = interface(JObjectClass)
    ['{73C141D6-F8D7-4FE4-BFA3-3441B6367189}']
    {class} function _GetSERIAL_EXECUTOR: JExecutor;
    {class} function _GetTHREAD_POOL_EXECUTOR: JExecutor;
    {class} function init: JAsyncTask; cdecl;
    {class} procedure execute(runnable: JRunnable); cdecl; overload;
    {class} property SERIAL_EXECUTOR: JExecutor read _GetSERIAL_EXECUTOR;
    {class} property THREAD_POOL_EXECUTOR: JExecutor read _GetTHREAD_POOL_EXECUTOR;
  end;

  [JavaSignature('android/os/AsyncTask')]
  JAsyncTask = interface(JObject)
    ['{8BC49850-F199-4620-BCFF-ACDA1D69417A}']
    function cancel(mayInterruptIfRunning: Boolean): Boolean; cdecl;
    function &get: JObject; cdecl; overload;
    function &get(timeout: Int64; unit_: JTimeUnit): JObject; cdecl; overload;
    function getStatus: JAsyncTask_Status; cdecl;
    function isCancelled: Boolean; cdecl;
  end;
  TJAsyncTask = class(TJavaGenericImport<JAsyncTaskClass, JAsyncTask>) end;

  JAsyncTask_StatusClass = interface(JEnumClass)
    ['{16452E24-44D5-4E84-990E-3C1916FB372B}']
    {class} function _GetFINISHED: JAsyncTask_Status;
    {class} function _GetPENDING: JAsyncTask_Status;
    {class} function _GetRUNNING: JAsyncTask_Status;
    {class} function valueOf(name: JString): JAsyncTask_Status; cdecl;
    {class} function values: TJavaObjectArray<JAsyncTask_Status>; cdecl;
    {class} property FINISHED: JAsyncTask_Status read _GetFINISHED;
    {class} property PENDING: JAsyncTask_Status read _GetPENDING;
    {class} property RUNNING: JAsyncTask_Status read _GetRUNNING;
  end;

  [JavaSignature('android/os/AsyncTask$Status')]
  JAsyncTask_Status = interface(JEnum)
    ['{96B0BCE7-1312-49B9-9F33-43541680B0E7}']
  end;
  TJAsyncTask_Status = class(TJavaGenericImport<JAsyncTask_StatusClass, JAsyncTask_Status>) end;

  JPairClass = interface(JObjectClass)
    ['{FC74853D-BE83-4F13-8068-CA5D73548F17}']
    {class} function init(first: JObject; second: JObject): JPair; cdecl;
    {class} function create(a: JObject; b: JObject): JPair; cdecl;
  end;

  [JavaSignature('android/util/Pair')]
  JPair = interface(JObject)
    ['{F5066B7F-AF96-45FD-AF9F-7F42F8EE8A5D}']
    function _Getfirst: JObject;
    function _Getsecond: JObject;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    property first: JObject read _Getfirst;
    property second: JObject read _Getsecond;
  end;
  TJPair = class(TJavaGenericImport<JPairClass, JPair>) end;

  JProgressBarClass = interface(JViewClass)
    ['{FED4A643-3E88-4405-9838-7AE7309D40B5}']
    {class} function init(context: JContext): JProgressBar; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JProgressBar; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyle: Integer): JProgressBar; cdecl; overload;
  end;

  [JavaSignature('android/widget/ProgressBar')]
  JProgressBar = interface(JView)
    ['{C85D5809-7381-4785-B234-DE00DC084BD6}']
    function getIndeterminateDrawable: JDrawable; cdecl;
    function getMax: Integer; cdecl;
    function getProgress: Integer; cdecl;
    function getProgressDrawable: JDrawable; cdecl;
    function getSecondaryProgress: Integer; cdecl;
    procedure incrementProgressBy(diff: Integer); cdecl;
    procedure incrementSecondaryProgressBy(diff: Integer); cdecl;
    procedure invalidateDrawable(dr: JDrawable); cdecl;
    function isIndeterminate: Boolean; cdecl;
    procedure jumpDrawablesToCurrentState; cdecl;
    procedure onRestoreInstanceState(state: JParcelable); cdecl;
    function onSaveInstanceState: JParcelable; cdecl;
    procedure postInvalidate; cdecl;
    procedure setIndeterminate(indeterminate: Boolean); cdecl;
    procedure setIndeterminateDrawable(d: JDrawable); cdecl;
    procedure setInterpolator(context: JContext; resID: Integer); cdecl;
    procedure setMax(max: Integer); cdecl;
    procedure setProgress(progress: Integer); cdecl;
    procedure setProgressDrawable(d: JDrawable); cdecl;
    procedure setSecondaryProgress(secondaryProgress: Integer); cdecl;
    procedure setVisibility(v: Integer); cdecl;
  end;
  TJProgressBar = class(TJavaGenericImport<JProgressBarClass, JProgressBar>) end;

  JAbstractDeviceListenerClass = interface(JObjectClass)
    ['{43B87609-B971-4E4C-A691-875A3FD21D00}']
    {class} function init: JAbstractDeviceListener; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/AbstractDeviceListener')]
  JAbstractDeviceListener = interface(JObject)
    ['{91A4D9DD-FDF7-4BAF-8E0B-B1CC7981D8E6}']
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
  TJAbstractDeviceListener = class(TJavaGenericImport<JAbstractDeviceListenerClass, JAbstractDeviceListener>) end;

  JArmClass = interface(JEnumClass)
    ['{D9343BEF-4CD4-4E11-971C-007C08811614}']
    {class} function _GetLEFT: JArm;
    {class} function _GetRIGHT: JArm;
    {class} function _GetUNKNOWN: JArm;
    {class} function valueOf(P1: JString): JArm; cdecl;
    {class} function values: TJavaObjectArray<JArm>; cdecl;
    {class} property LEFT: JArm read _GetLEFT;
    {class} property RIGHT: JArm read _GetRIGHT;
    {class} property UNKNOWN: JArm read _GetUNKNOWN;
  end;

  [JavaSignature('com/thalmic/myo/Arm')]
  JArm = interface(JEnum)
    ['{270F1C10-E794-4382-8094-A4D2E2277491}']
  end;
  TJArm = class(TJavaGenericImport<JArmClass, JArm>) end;

  Jmyo_BuildConfigClass = interface(JObjectClass)
    ['{54DC8A65-EBA4-42E7-8AA8-DD700B1557C6}']
    {class} function _GetAPPLICATION_ID: JString;
    {class} function _GetBLE_STACK: JString;
    {class} function _GetBUILD_TYPE: JString;
    {class} function _GetDEBUG: Boolean;
    {class} function _GetFLAVOR: JString;
    {class} function _GetMYO_SDK_TYPE: JString;
    {class} function _GetPACKAGE_NAME: JString;
    {class} function _GetVERSION_CODE: Integer;
    {class} function _GetVERSION_NAME: JString;
    {class} function init: Jmyo_BuildConfig; cdecl;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BLE_STACK: JString read _GetBLE_STACK;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property MYO_SDK_TYPE: JString read _GetMYO_SDK_TYPE;
    {class} property PACKAGE_NAME: JString read _GetPACKAGE_NAME;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/thalmic/myo/BuildConfig')]
  Jmyo_BuildConfig = interface(JObject)
    ['{076BFC40-808A-4F1E-B3D4-B249AEFE86FF}']
  end;
  TJmyo_BuildConfig = class(TJavaGenericImport<Jmyo_BuildConfigClass, Jmyo_BuildConfig>) end;

  JClassifierEventClass = interface(JObjectClass)
    ['{0715D222-514A-4CF2-A3CA-DA088183A007}']
    {class} function poseFromClassifierPose(P1: Integer): JPose; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent')]
  JClassifierEvent = interface(JObject)
    ['{DF6C41F4-B391-401C-80F0-EB1CD003AE37}']
    function getArm: JArm; cdecl;
    function getPose: JPose; cdecl;
    function getType: JClassifierEvent_Type; cdecl;
    function getXDirection: JXDirection; cdecl;
    function toString: JString; cdecl;
  end;
  TJClassifierEvent = class(TJavaGenericImport<JClassifierEventClass, JClassifierEvent>) end;

  JClassifierEvent_1Class = interface(JObjectClass)
    ['{0F56C234-E6AD-4B55-BA0A-D899B9F8D377}']
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent$1')]
  JClassifierEvent_1 = interface(JObject)
    ['{1E4CD546-8662-447D-9331-D42A3B7E4E3D}']
  end;
  TJClassifierEvent_1 = class(TJavaGenericImport<JClassifierEvent_1Class, JClassifierEvent_1>) end;

  JClassifierEvent_ClassifierEventFormatClass = interface(JEnumClass)
    ['{776E7D38-4FFE-4339-8035-0D0551930C88}']
    {class} function _GetDATA_1: JClassifierEvent_ClassifierEventFormat;
    {class} function _GetDATA_2: JClassifierEvent_ClassifierEventFormat;
    {class} function _GetEVENT_TYPE: JClassifierEvent_ClassifierEventFormat;
    {class} function valueOf(P1: JString): JClassifierEvent_ClassifierEventFormat; cdecl;
    {class} function values: TJavaObjectArray<JClassifierEvent_ClassifierEventFormat>; cdecl;
    {class} property DATA_1: JClassifierEvent_ClassifierEventFormat read _GetDATA_1;
    {class} property DATA_2: JClassifierEvent_ClassifierEventFormat read _GetDATA_2;
    {class} property EVENT_TYPE: JClassifierEvent_ClassifierEventFormat read _GetEVENT_TYPE;
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent$ClassifierEventFormat')]
  JClassifierEvent_ClassifierEventFormat = interface(JEnum)
    ['{2C116FF7-5F8D-4284-A2D8-B9EE67EA474E}']
  end;
  TJClassifierEvent_ClassifierEventFormat = class(TJavaGenericImport<JClassifierEvent_ClassifierEventFormatClass, JClassifierEvent_ClassifierEventFormat>) end;

  JClassifierEvent_TypeClass = interface(JEnumClass)
    ['{B453CDEF-7464-4590-8797-013B817D6E7E}']
    {class} function _GetARM_SYNCED: JClassifierEvent_Type;
    {class} function _GetARM_UNSYNCED: JClassifierEvent_Type;
    {class} function _GetLOCKED: JClassifierEvent_Type;
    {class} function _GetPOSE: JClassifierEvent_Type;
    {class} function _GetUNLOCKED: JClassifierEvent_Type;
    {class} function valueOf(P1: JString): JClassifierEvent_Type; cdecl;
    {class} function values: TJavaObjectArray<JClassifierEvent_Type>; cdecl;
    {class} property ARM_SYNCED: JClassifierEvent_Type read _GetARM_SYNCED;
    {class} property ARM_UNSYNCED: JClassifierEvent_Type read _GetARM_UNSYNCED;
    {class} property LOCKED: JClassifierEvent_Type read _GetLOCKED;
    {class} property POSE: JClassifierEvent_Type read _GetPOSE;
    {class} property UNLOCKED: JClassifierEvent_Type read _GetUNLOCKED;
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent$Type')]
  JClassifierEvent_Type = interface(JEnum)
    ['{0F7DFC76-58E4-4EAA-A2DF-D608FF1D8A9C}']
  end;
  TJClassifierEvent_Type = class(TJavaGenericImport<JClassifierEvent_TypeClass, JClassifierEvent_Type>) end;

  JControlCommandClass = interface(JObjectClass)
    ['{C698DD69-163B-470A-AF30-EDCB840BE987}']
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand')]
  JControlCommand = interface(JObject)
    ['{159A9CDE-F9B2-430C-A4DF-727AE0870D5A}']
  end;
  TJControlCommand = class(TJavaGenericImport<JControlCommandClass, JControlCommand>) end;

  JControlCommand_1Class = interface(JObjectClass)
    ['{2637F095-C969-455B-924C-5621D6A71D96}']
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$1')]
  JControlCommand_1 = interface(JObject)
    ['{6431EA5C-52AC-4D99-A761-4F03B98BA3B8}']
  end;
  TJControlCommand_1 = class(TJavaGenericImport<JControlCommand_1Class, JControlCommand_1>) end;

  JControlCommand_EmgModeClass = interface(JEnumClass)
    ['{991D8CC1-82AF-4450-AB2B-F4CC1BF316ED}']
    {class} function _GetDISABLED: JControlCommand_EmgMode;
    {class} function _GetEMG: JControlCommand_EmgMode;
    {class} function _GetFV: JControlCommand_EmgMode;
    {class} function valueOf(P1: JString): JControlCommand_EmgMode; cdecl;
    {class} function values: TJavaObjectArray<JControlCommand_EmgMode>; cdecl;
    {class} property DISABLED: JControlCommand_EmgMode read _GetDISABLED;
    {class} property EMG: JControlCommand_EmgMode read _GetEMG;
    {class} property FV: JControlCommand_EmgMode read _GetFV;
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$EmgMode')]
  JControlCommand_EmgMode = interface(JEnum)
    ['{FE3469F7-7427-4E41-8060-866E18DAAE7D}']
  end;
  TJControlCommand_EmgMode = class(TJavaGenericImport<JControlCommand_EmgModeClass, JControlCommand_EmgMode>) end;

  JControlCommand_SetModeClass = interface(JEnumClass)
    ['{89B404EB-B2C8-4C89-A7F5-253D21742871}']
    {class} function _GetCLASSIFIER_MODE: JControlCommand_SetMode;
    {class} function _GetCOMMAND_TYPE: JControlCommand_SetMode;
    {class} function _GetEMG_MODE: JControlCommand_SetMode;
    {class} function _GetIMU_MODE: JControlCommand_SetMode;
    {class} function _GetPAYLOAD_SIZE: JControlCommand_SetMode;
    {class} function valueOf(P1: JString): JControlCommand_SetMode; cdecl;
    {class} function values: TJavaObjectArray<JControlCommand_SetMode>; cdecl;
    {class} property CLASSIFIER_MODE: JControlCommand_SetMode read _GetCLASSIFIER_MODE;
    {class} property COMMAND_TYPE: JControlCommand_SetMode read _GetCOMMAND_TYPE;
    {class} property EMG_MODE: JControlCommand_SetMode read _GetEMG_MODE;
    {class} property IMU_MODE: JControlCommand_SetMode read _GetIMU_MODE;
    {class} property PAYLOAD_SIZE: JControlCommand_SetMode read _GetPAYLOAD_SIZE;
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$SetMode')]
  JControlCommand_SetMode = interface(JEnum)
    ['{CB6559F2-9A45-47B4-8CE9-BBC68AA35A41}']
  end;
  TJControlCommand_SetMode = class(TJavaGenericImport<JControlCommand_SetModeClass, JControlCommand_SetMode>) end;

  JControlCommand_UnlockClass = interface(JEnumClass)
    ['{FACA1D97-0AAA-42D1-9DEB-DAE8CC2FF661}']
    {class} function _GetCOMMAND_TYPE: JControlCommand_Unlock;
    {class} function _GetPAYLOAD_SIZE: JControlCommand_Unlock;
    {class} function _GetUNLOCK_TYPE: JControlCommand_Unlock;
    {class} function valueOf(P1: JString): JControlCommand_Unlock; cdecl;
    {class} function values: TJavaObjectArray<JControlCommand_Unlock>; cdecl;
    {class} property COMMAND_TYPE: JControlCommand_Unlock read _GetCOMMAND_TYPE;
    {class} property PAYLOAD_SIZE: JControlCommand_Unlock read _GetPAYLOAD_SIZE;
    {class} property UNLOCK_TYPE: JControlCommand_Unlock read _GetUNLOCK_TYPE;
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$Unlock')]
  JControlCommand_Unlock = interface(JEnum)
    ['{693044AB-1425-4A0D-95FA-998A81E572D4}']
  end;
  TJControlCommand_Unlock = class(TJavaGenericImport<JControlCommand_UnlockClass, JControlCommand_Unlock>) end;

  JControlCommand_UserActionClass = interface(JEnumClass)
    ['{B49F3DBD-FC27-4C96-A5D3-8EC74F5B12E0}']
    {class} function _GetCOMMAND_TYPE: JControlCommand_UserAction;
    {class} function _GetPAYLOAD_SIZE: JControlCommand_UserAction;
    {class} function _GetUSER_ACTION: JControlCommand_UserAction;
    {class} function valueOf(P1: JString): JControlCommand_UserAction; cdecl;
    {class} function values: TJavaObjectArray<JControlCommand_UserAction>; cdecl;
    {class} property COMMAND_TYPE: JControlCommand_UserAction read _GetCOMMAND_TYPE;
    {class} property PAYLOAD_SIZE: JControlCommand_UserAction read _GetPAYLOAD_SIZE;
    {class} property USER_ACTION: JControlCommand_UserAction read _GetUSER_ACTION;
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$UserAction')]
  JControlCommand_UserAction = interface(JEnum)
    ['{CDD96071-7BCA-4F21-8743-FE382299FDA1}']
  end;
  TJControlCommand_UserAction = class(TJavaGenericImport<JControlCommand_UserActionClass, JControlCommand_UserAction>) end;

  JControlCommand_VibrationClass = interface(JEnumClass)
    ['{C0254AFC-42C9-45DC-83C9-E6380A767431}']
    {class} function _GetCOMMAND_TYPE: JControlCommand_Vibration;
    {class} function _GetPAYLOAD_SIZE: JControlCommand_Vibration;
    {class} function _GetVIBRATION_TYPE: JControlCommand_Vibration;
    {class} function valueOf(P1: JString): JControlCommand_Vibration; cdecl;
    {class} function values: TJavaObjectArray<JControlCommand_Vibration>; cdecl;
    {class} property COMMAND_TYPE: JControlCommand_Vibration read _GetCOMMAND_TYPE;
    {class} property PAYLOAD_SIZE: JControlCommand_Vibration read _GetPAYLOAD_SIZE;
    {class} property VIBRATION_TYPE: JControlCommand_Vibration read _GetVIBRATION_TYPE;
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$Vibration')]
  JControlCommand_Vibration = interface(JEnum)
    ['{020176DF-E3D2-4F31-B22D-DB3C892E2D70}']
  end;
  TJControlCommand_Vibration = class(TJavaGenericImport<JControlCommand_VibrationClass, JControlCommand_Vibration>) end;

  JDeviceListenerClass = interface(IJavaClass)
    ['{197CD260-513E-41AA-808C-CB6BCC36EBA7}']
  end;

  [JavaSignature('com/thalmic/myo/DeviceListener')]
  JDeviceListener = interface(IJavaInstance)
    ['{131D6F52-7E8C-49BD-8376-EC970651B2EA}']
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
  TJDeviceListener = class(TJavaGenericImport<JDeviceListenerClass, JDeviceListener>) end;

  JFirmwareInfoClass = interface(JObjectClass)
    ['{99E82573-5241-4B86-A62A-CB0C5FBF9A9A}']
  end;

  [JavaSignature('com/thalmic/myo/FirmwareInfo')]
  JFirmwareInfo = interface(JObject)
    ['{75F77C9A-DD06-4525-B73D-2EAA4B642020}']
    function _GetunlockPose: JPose;
    procedure _SetunlockPose(Value: JPose);
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    property unlockPose: JPose read _GetunlockPose write _SetunlockPose;
  end;
  TJFirmwareInfo = class(TJavaGenericImport<JFirmwareInfoClass, JFirmwareInfo>) end;

  JFirmwareVersionClass = interface(JObjectClass)
    ['{DBE8E583-3A9C-4F15-A4AB-3F7D5BDA81DA}']
    {class} function _GetMINIMUM_FIRMWARE_VERSION_MINOR: Integer;
    {class} function _GetREQUIRED_FIRMWARE_VERSION_MAJOR: Integer;
    {class} property MINIMUM_FIRMWARE_VERSION_MINOR: Integer read _GetMINIMUM_FIRMWARE_VERSION_MINOR;
    {class} property REQUIRED_FIRMWARE_VERSION_MAJOR: Integer read _GetREQUIRED_FIRMWARE_VERSION_MAJOR;
  end;

  [JavaSignature('com/thalmic/myo/FirmwareVersion')]
  JFirmwareVersion = interface(JObject)
    ['{5620A765-8BC8-4A69-85FB-3D0E5F901B50}']
    function _GethardwareRev: Integer;
    function _Getmajor: Integer;
    function _Getminor: Integer;
    function _Getpatch: Integer;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isNotSet: Boolean; cdecl;
    function toDisplayString: JString; cdecl;
    function toString: JString; cdecl;
    property hardwareRev: Integer read _GethardwareRev;
    property major: Integer read _Getmajor;
    property minor: Integer read _Getminor;
    property patch: Integer read _Getpatch;
  end;
  TJFirmwareVersion = class(TJavaGenericImport<JFirmwareVersionClass, JFirmwareVersion>) end;

  JBleGattCallbackClass = interface(JObjectClass)
    ['{A85B2B8E-CA71-4234-96F5-3388216C7A47}']
    {class} function init: JBleGattCallback; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleGattCallback')]
  JBleGattCallback = interface(JObject)
    ['{E294A372-C614-4BA0-92D9-631339396D93}']
    procedure onCharacteristicChanged(P1: Jble_Address; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
    procedure onCharacteristicRead(P1: Jble_Address; P2: JUUID; P3: TJavaArray<Byte>; P4: Boolean); cdecl;
    procedure onCharacteristicWrite(P1: Jble_Address; P2: JUUID; P3: Boolean); cdecl;
    procedure onDeviceConnected(P1: Jble_Address); cdecl;
    procedure onDeviceConnectionFailed(P1: Jble_Address); cdecl;
    procedure onDeviceDisconnected(P1: Jble_Address); cdecl;
    procedure onReadRemoteRssi(P1: Jble_Address; P2: Integer; P3: Boolean); cdecl;
    procedure onServicesDiscovered(P1: Jble_Address; P2: Boolean); cdecl;
  end;
  TJBleGattCallback = class(TJavaGenericImport<JBleGattCallbackClass, JBleGattCallback>) end;

  JGattCallbackClass = interface(JBleGattCallbackClass)
    ['{792C8424-57D9-422A-869C-47FFD4045787}']
    {class} function init(P1: JHub): JGattCallback; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/GattCallback')]
  JGattCallback = interface(JBleGattCallback)
    ['{26A6EBAE-641B-4C67-B948-15AAF9BD00B4}']
    procedure onCharacteristicChanged(P1: Jble_Address; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
    procedure onCharacteristicRead(P1: Jble_Address; P2: JUUID; P3: TJavaArray<Byte>; P4: Boolean); cdecl;
    procedure onDeviceConnected(P1: Jble_Address); cdecl;
    procedure onDeviceConnectionFailed(P1: Jble_Address); cdecl;
    procedure onDeviceDisconnected(P1: Jble_Address); cdecl;
    procedure onReadRemoteRssi(P1: Jble_Address; P2: Integer; P3: Boolean); cdecl;
    procedure onServicesDiscovered(P1: Jble_Address; P2: Boolean); cdecl;
  end;
  TJGattCallback = class(TJavaGenericImport<JGattCallbackClass, JGattCallback>) end;

  JGattCallback_InitReadCharClass = interface(JPairClass)
    ['{A9D91A2B-CFB3-4F23-A9A0-8066E26AAA22}']
    {class} function init(P1: JUUID; P2: JUUID): JGattCallback_InitReadChar; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$InitReadChar')]
  JGattCallback_InitReadChar = interface(JPair)
    ['{10CF8854-219A-49D5-868A-C2C37883553B}']
    function getCharacteristic: JUUID; cdecl;
    function getService: JUUID; cdecl;
  end;
  TJGattCallback_InitReadChar = class(TJavaGenericImport<JGattCallback_InitReadCharClass, JGattCallback_InitReadChar>) end;

  JGattCallback_ValueListenerClass = interface(IJavaClass)
    ['{6322A265-9992-43BD-9A03-CDAE5BD3FBD3}']
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$ValueListener')]
  JGattCallback_ValueListener = interface(IJavaInstance)
    ['{624B4119-605E-4572-AD84-D13622771B62}']
    procedure onCharacteristicChanged(P1: JMyo; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
  end;
  TJGattCallback_ValueListener = class(TJavaGenericImport<JGattCallback_ValueListenerClass, JGattCallback_ValueListener>) end;

  JGattCallback_UpdateParserClass = interface(JGattCallback_ValueListenerClass)
    ['{CB87E99C-3498-49DC-84AF-F62C57A30CF0}']
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$UpdateParser')]
  JGattCallback_UpdateParser = interface(JGattCallback_ValueListener)
    ['{3B24702B-B40D-4DD9-87E2-A8D9EF975563}']
    procedure onMyoConnected(P1: JMyo); cdecl;
    procedure onMyoDisconnected(P1: JMyo); cdecl;
    procedure onReadRemoteRssi(P1: JMyo; P2: Integer); cdecl;
  end;
  TJGattCallback_UpdateParser = class(TJavaGenericImport<JGattCallback_UpdateParserClass, JGattCallback_UpdateParser>) end;

  JGattConstantsClass = interface(JObjectClass)
    ['{5DCD5798-D9FA-4BCF-AC0C-AE64BB33B4C2}']
  end;

  [JavaSignature('com/thalmic/myo/GattConstants')]
  JGattConstants = interface(JObject)
    ['{88D302EA-7D78-463D-A8DD-6C02EE63BF15}']
  end;
  TJGattConstants = class(TJavaGenericImport<JGattConstantsClass, JGattConstants>) end;

  JHubClass = interface(JObjectClass)
    ['{8DEFCE77-41B3-4E12-B5E7-3FF3771A1BEB}']
    {class} function getInstance: JHub; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/Hub')]
  JHub = interface(JObject)
    ['{6DAA2D71-F4F1-4D65-AB1B-839129B2D692}']
    procedure addListener(P1: JDeviceListener); cdecl;
    procedure attachByMacAddress(P1: JString); cdecl;
    procedure attachToAdjacentMyo; cdecl;
    procedure attachToAdjacentMyos(P1: Integer); cdecl;
    procedure detach(P1: JString); cdecl;
    function getConnectedDevices: JArrayList; cdecl;
    function getLockingPolicy: JHub_LockingPolicy; cdecl;
    function getMyoAttachAllowance: Integer; cdecl;
    function getScanner: Jscanner_Scanner; cdecl;
    function init(P1: JContext): Boolean; cdecl; overload;
    function init(P1: JContext; P2: JString): Boolean; cdecl; overload;
    function isSendingUsageData: Boolean; cdecl;
    function now: Int64; cdecl;
    procedure removeListener(P1: JDeviceListener); cdecl;
    procedure setLockingPolicy(P1: JHub_LockingPolicy); cdecl;
    procedure setMyoAttachAllowance(P1: Integer); cdecl;
    procedure setSendUsageData(P1: Boolean); cdecl;
    procedure shutdown; cdecl;
  end;
  TJHub = class(TJavaGenericImport<JHubClass, JHub>) end;

  JHub_1Class = interface(JAbstractDeviceListenerClass)
    ['{6822BBE7-C1A0-4182-A22D-5219D557D430}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$1')]
  JHub_1 = interface(JAbstractDeviceListener)
    ['{890EBFDF-40A6-4BCC-AE29-D55D67A159D3}']
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
  end;
  TJHub_1 = class(TJavaGenericImport<JHub_1Class, JHub_1>) end;

  JHub_2Class = interface(JObjectClass)
    ['{12D58B77-1D25-4AD5-AB12-467E65BEEC99}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$2')]
  JHub_2 = interface(JObject)
    ['{42B5503C-DEDC-4028-80AC-59493CCC5F63}']
    procedure run; cdecl;
  end;
  TJHub_2 = class(TJavaGenericImport<JHub_2Class, JHub_2>) end;

  JHub_3Class = interface(JObjectClass)
    ['{2F4CDAB5-9A1D-4273-BD6F-2E9FFC9CC7EB}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$3')]
  JHub_3 = interface(JObject)
    ['{75AF7AA8-54D5-463B-A4DA-90901F40F210}']
  end;
  TJHub_3 = class(TJavaGenericImport<JHub_3Class, JHub_3>) end;

  JHub_InstanceHolderClass = interface(JObjectClass)
    ['{722398BE-3D0F-4B75-BE9E-4707E56F855B}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$InstanceHolder')]
  JHub_InstanceHolder = interface(JObject)
    ['{15306CE4-EED4-4D36-A5F2-B63865E5E03D}']
  end;
  TJHub_InstanceHolder = class(TJavaGenericImport<JHub_InstanceHolderClass, JHub_InstanceHolder>) end;

  JHub_LockingPolicyClass = interface(JEnumClass)
    ['{0ECD1F0F-F634-415E-B3CB-91E817F0FD3A}']
    {class} function _GetNONE: JHub_LockingPolicy;
    {class} function _GetSTANDARD: JHub_LockingPolicy;
    {class} function valueOf(P1: JString): JHub_LockingPolicy; cdecl;
    {class} function values: TJavaObjectArray<JHub_LockingPolicy>; cdecl;
    {class} property NONE: JHub_LockingPolicy read _GetNONE;
    {class} property STANDARD: JHub_LockingPolicy read _GetSTANDARD;
  end;

  [JavaSignature('com/thalmic/myo/Hub$LockingPolicy')]
  JHub_LockingPolicy = interface(JEnum)
    ['{6B71F613-E067-4C7A-B8E9-169E150600A0}']
  end;
  TJHub_LockingPolicy = class(TJavaGenericImport<JHub_LockingPolicyClass, JHub_LockingPolicy>) end;

  JHub_ScanItemClickListenerClass = interface(JObjectClass)
    ['{2C38A14E-FE35-493B-82D8-6A12F4A7BEA5}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$ScanItemClickListener')]
  JHub_ScanItemClickListener = interface(JObject)
    ['{A6587EB4-665E-4797-AEC6-BAF886C1E2E5}']
    procedure onMyoClicked(P1: JMyo); cdecl;
  end;
  TJHub_ScanItemClickListener = class(TJavaGenericImport<JHub_ScanItemClickListenerClass, JHub_ScanItemClickListener>) end;

  JMultiListenerClass = interface(JObjectClass)
    ['{D3CECB6C-AE0E-4B7C-AB56-1C5F63615798}']
  end;

  [JavaSignature('com/thalmic/myo/MultiListener')]
  JMultiListener = interface(JObject)
    ['{24A8F4A6-9480-415A-90B3-8AA611939A1E}']
    procedure add(P1: JDeviceListener); cdecl;
    procedure clear; cdecl;
    function &contains(P1: JDeviceListener): Boolean; cdecl;
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
    procedure remove(P1: JDeviceListener); cdecl;
  end;
  TJMultiListener = class(TJavaGenericImport<JMultiListenerClass, JMultiListener>) end;

  JMyoClass = interface(JObjectClass)
    ['{3308907C-38E0-47D4-AD6F-A51B6F339726}']
  end;

  [JavaSignature('com/thalmic/myo/Myo')]
  JMyo = interface(JObject)
    ['{C0FA3082-830D-496F-8339-1E8A08398CE2}']
    function getConnectionState: JMyo_ConnectionState; cdecl;
    function getFirmwareVersion: JFirmwareVersion; cdecl;
    function getMacAddress: JString; cdecl;
    function getName: JString; cdecl;
    function isConnected: Boolean; cdecl;
    function isFirmwareVersionSupported: Boolean; cdecl;
    function isUnlocked: Boolean; cdecl;
    procedure lock; cdecl;
    procedure notifyUserAction; cdecl;
    procedure requestRssi; cdecl;
    procedure unlock(P1: JMyo_UnlockType); cdecl;
    procedure vibrate(P1: JMyo_VibrationType); cdecl;
  end;
  TJMyo = class(TJavaGenericImport<JMyoClass, JMyo>) end;

  JMyo_ConnectionStateClass = interface(JEnumClass)
    ['{63EAD169-CD41-40A1-88EA-0AC62B11F2EA}']
    {class} function _GetCONNECTED: JMyo_ConnectionState;
    {class} function _GetCONNECTING: JMyo_ConnectionState;
    {class} function _GetDISCONNECTED: JMyo_ConnectionState;
    {class} function valueOf(P1: JString): JMyo_ConnectionState; cdecl;
    {class} function values: TJavaObjectArray<JMyo_ConnectionState>; cdecl;
    {class} property CONNECTED: JMyo_ConnectionState read _GetCONNECTED;
    {class} property CONNECTING: JMyo_ConnectionState read _GetCONNECTING;
    {class} property DISCONNECTED: JMyo_ConnectionState read _GetDISCONNECTED;
  end;

  [JavaSignature('com/thalmic/myo/Myo$ConnectionState')]
  JMyo_ConnectionState = interface(JEnum)
    ['{CBAB85A4-A405-4832-84C0-F03EC3327B8E}']
  end;
  TJMyo_ConnectionState = class(TJavaGenericImport<JMyo_ConnectionStateClass, JMyo_ConnectionState>) end;

  JMyo_UnlockTypeClass = interface(JEnumClass)
    ['{CF1B6FFD-4D07-4953-8C87-5DC1BD0AC31C}']
    {class} function _GetHOLD: JMyo_UnlockType;
    {class} function _GetTIMED: JMyo_UnlockType;
    {class} function valueOf(P1: JString): JMyo_UnlockType; cdecl;
    {class} function values: TJavaObjectArray<JMyo_UnlockType>; cdecl;
    {class} property HOLD: JMyo_UnlockType read _GetHOLD;
    {class} property TIMED: JMyo_UnlockType read _GetTIMED;
  end;

  [JavaSignature('com/thalmic/myo/Myo$UnlockType')]
  JMyo_UnlockType = interface(JEnum)
    ['{CBBFD811-5F5D-4ED6-9991-A0B7BCFD1056}']
  end;
  TJMyo_UnlockType = class(TJavaGenericImport<JMyo_UnlockTypeClass, JMyo_UnlockType>) end;

  JMyo_VibrationTypeClass = interface(JEnumClass)
    ['{0B661A04-915B-4BD3-956D-920E47963893}']
    {class} function _GetLONG: JMyo_VibrationType;
    {class} function _GetMEDIUM: JMyo_VibrationType;
    {class} function _GetSHORT: JMyo_VibrationType;
    {class} function valueOf(P1: JString): JMyo_VibrationType; cdecl;
    {class} function values: TJavaObjectArray<JMyo_VibrationType>; cdecl;
    {class} property LONG: JMyo_VibrationType read _GetLONG;
    {class} property MEDIUM: JMyo_VibrationType read _GetMEDIUM;
    {class} property SHORT: JMyo_VibrationType read _GetSHORT;
  end;

  [JavaSignature('com/thalmic/myo/Myo$VibrationType')]
  JMyo_VibrationType = interface(JEnum)
    ['{336BC037-218F-478F-ADB3-2F783EB3BE07}']
  end;
  TJMyo_VibrationType = class(TJavaGenericImport<JMyo_VibrationTypeClass, JMyo_VibrationType>) end;

  JMyoGattClass = interface(JObjectClass)
    ['{7BED89A1-50E4-4149-B14C-04F78FE8DE89}']
    {class} function init(P1: JHub): JMyoGatt; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/MyoGatt')]
  JMyoGatt = interface(JObject)
    ['{E6169A8A-C030-431B-A8C0-95932DDD25F0}']
    procedure configureDataAcquisition(P1: JString; P2: JControlCommand_EmgMode; P3: Boolean; P4: Boolean); cdecl;
    function connect(P1: JString): Boolean; cdecl; overload;
    function connect(P1: JString; P2: Boolean): Boolean; cdecl; overload;
    procedure disconnect(P1: JString); cdecl;
    procedure notifyUserAction(P1: JString); cdecl;
    procedure requestRssi(P1: JString); cdecl;
    procedure setBleManager(P1: JBleManager); cdecl;
    procedure unlock(P1: JString; P2: JMyo_UnlockType); cdecl;
    procedure vibrate(P1: JString; P2: JMyo_VibrationType); cdecl;
  end;
  TJMyoGatt = class(TJavaGenericImport<JMyoGattClass, JMyoGatt>) end;

  JMyoUpdateParserClass = interface(JObjectClass)
    ['{70329CF2-C790-42F1-8E8D-8960CF391E07}']
  end;

  [JavaSignature('com/thalmic/myo/MyoUpdateParser')]
  JMyoUpdateParser = interface(JObject)
    ['{15CC7008-E9A8-4780-A131-3F47211CAB82}']
    procedure onCharacteristicChanged(P1: JMyo; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
    procedure onMyoConnected(P1: JMyo); cdecl;
    procedure onMyoDisconnected(P1: JMyo); cdecl;
    procedure onReadRemoteRssi(P1: JMyo; P2: Integer); cdecl;
  end;
  TJMyoUpdateParser = class(TJavaGenericImport<JMyoUpdateParserClass, JMyoUpdateParser>) end;

  JMyoUpdateParser_1Class = interface(JObjectClass)
    ['{968095A6-A7F1-4A65-B150-A1D6EAE3F66E}']
  end;

  [JavaSignature('com/thalmic/myo/MyoUpdateParser$1')]
  JMyoUpdateParser_1 = interface(JObject)
    ['{2356683A-A4E0-41CA-A744-259B68A19DC3}']
  end;
  TJMyoUpdateParser_1 = class(TJavaGenericImport<JMyoUpdateParser_1Class, JMyoUpdateParser_1>) end;

  JPoseClass = interface(JEnumClass)
    ['{EBF38CAD-2F35-4252-8BC9-2AB6FED10685}']
    {class} function _GetDOUBLE_TAP: JPose;
    {class} function _GetFINGERS_SPREAD: JPose;
    {class} function _GetFIST: JPose;
    {class} function _GetREST: JPose;
    {class} function _GetUNKNOWN: JPose;
    {class} function _GetWAVE_IN: JPose;
    {class} function _GetWAVE_OUT: JPose;
    {class} function valueOf(P1: JString): JPose; cdecl;
    {class} function values: TJavaObjectArray<JPose>; cdecl;
    {class} property DOUBLE_TAP: JPose read _GetDOUBLE_TAP;
    {class} property FINGERS_SPREAD: JPose read _GetFINGERS_SPREAD;
    {class} property FIST: JPose read _GetFIST;
    {class} property REST: JPose read _GetREST;
    {class} property UNKNOWN: JPose read _GetUNKNOWN;
    {class} property WAVE_IN: JPose read _GetWAVE_IN;
    {class} property WAVE_OUT: JPose read _GetWAVE_OUT;
  end;

  [JavaSignature('com/thalmic/myo/Pose')]
  JPose = interface(JEnum)
    ['{D24FDF1F-9F9D-4B07-97BB-EAAB10829C64}']
  end;
  TJPose = class(TJavaGenericImport<JPoseClass, JPose>) end;

  JQuaternionClass = interface(JObjectClass)
    ['{37C78AE8-1F07-4CD2-B61B-05D17853B023}']
    {class} function init: JQuaternion; cdecl; overload;
    {class} function init(P1: JQuaternion): JQuaternion; cdecl; overload;
    {class} function init(P1: Double; P2: Double; P3: Double; P4: Double): JQuaternion; cdecl; overload;
    {class} function pitch(P1: JQuaternion): Double; cdecl;
    {class} function roll(P1: JQuaternion): Double; cdecl;
    {class} function yaw(P1: JQuaternion): Double; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/Quaternion')]
  JQuaternion = interface(JObject)
    ['{FBC82DFC-56F3-4BBF-99D9-F2C5A9F1288A}']
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure inverse; cdecl;
    function length: Double; cdecl;
    procedure multiply(P1: JQuaternion); cdecl;
    function normalized: JQuaternion; cdecl;
    procedure &set(P1: JQuaternion); cdecl;
    function toString: JString; cdecl;
    function w: Double; cdecl;
    function x: Double; cdecl;
    function y: Double; cdecl;
    function z: Double; cdecl;
  end;
  TJQuaternion = class(TJavaGenericImport<JQuaternionClass, JQuaternion>) end;

  JReporterClass = interface(JObjectClass)
    ['{3887637F-640D-44E0-B59B-C1D66FF4D72C}']
    {class} function _GetEVENT_NAME_ATTACHED_MYO: JString;
    {class} function _GetEVENT_NAME_DETACHED_MYO: JString;
    {class} function _GetEVENT_NAME_SYNCED_MYO: JString;
    {class} function _GetEVENT_NAME_UNSYNCED_MYO: JString;
    {class} function init: JReporter; cdecl; overload;
    {class} function init(P1: JNetworkUtil): JReporter; cdecl; overload;
    {class} property EVENT_NAME_ATTACHED_MYO: JString read _GetEVENT_NAME_ATTACHED_MYO;
    {class} property EVENT_NAME_DETACHED_MYO: JString read _GetEVENT_NAME_DETACHED_MYO;
    {class} property EVENT_NAME_SYNCED_MYO: JString read _GetEVENT_NAME_SYNCED_MYO;
    {class} property EVENT_NAME_UNSYNCED_MYO: JString read _GetEVENT_NAME_UNSYNCED_MYO;
  end;

  [JavaSignature('com/thalmic/myo/Reporter')]
  JReporter = interface(JObject)
    ['{BC508FC1-CDFA-4D2B-B7E8-1EAD6B494BDD}']
    function isSendingUsageData: Boolean; cdecl;
    procedure sendMyoEvent(P1: JString; P2: JString; P3: JString; P4: JMyo); cdecl;
    procedure setSendUsageData(P1: Boolean); cdecl;
  end;
  TJReporter = class(TJavaGenericImport<JReporterClass, JReporter>) end;

  JReporter_1Class = interface(JAsyncTaskClass)
    ['{2193B205-5A4B-4FAE-A75B-0EB2CE3306AA}']
  end;

  [JavaSignature('com/thalmic/myo/Reporter$1')]
  JReporter_1 = interface(JAsyncTask)
    ['{38BC1E37-2B97-4411-B7D2-3D28BEDE70B5}']
  end;
  TJReporter_1 = class(TJavaGenericImport<JReporter_1Class, JReporter_1>) end;

  JScanListenerClass = interface(JObjectClass)
    ['{CA8ADD19-4A49-4364-942F-F173B4DB000F}']
    {class} function init(P1: JHub): JScanListener; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/ScanListener')]
  JScanListener = interface(JObject)
    ['{2A663C0A-5300-4409-9D29-89416AF17368}']
    procedure attachByMacAddress(P1: JString); cdecl;
    procedure attachToAdjacent(P1: Integer); cdecl;
    function onMyoScanned(P1: Jble_Address; P2: JString; P3: Integer): JMyo; cdecl;
    procedure onScanningStarted; cdecl;
    procedure onScanningStopped; cdecl;
  end;
  TJScanListener = class(TJavaGenericImport<JScanListenerClass, JScanListener>) end;

  JScanListener_1Class = interface(JObjectClass)
    ['{79373DB9-FE49-4205-8BC1-744A44781895}']
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$1')]
  JScanListener_1 = interface(JObject)
    ['{F51B318A-722A-4173-AD1E-7F26566C4780}']
  end;
  TJScanListener_1 = class(TJavaGenericImport<JScanListener_1Class, JScanListener_1>) end;

  JScanListener_AttachModeClass = interface(JEnumClass)
    ['{81633933-D724-48F9-8EF4-A1E49176E0FE}']
    {class} function _GetADDRESS: JScanListener_AttachMode;
    {class} function _GetADJACENT: JScanListener_AttachMode;
    {class} function _GetNONE: JScanListener_AttachMode;
    {class} function valueOf(P1: JString): JScanListener_AttachMode; cdecl;
    {class} function values: TJavaObjectArray<JScanListener_AttachMode>; cdecl;
    {class} property ADDRESS: JScanListener_AttachMode read _GetADDRESS;
    {class} property ADJACENT: JScanListener_AttachMode read _GetADJACENT;
    {class} property NONE: JScanListener_AttachMode read _GetNONE;
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$AttachMode')]
  JScanListener_AttachMode = interface(JEnum)
    ['{1C011154-58D6-41EA-8A4D-C3DDE4123CB7}']
  end;
  TJScanListener_AttachMode = class(TJavaGenericImport<JScanListener_AttachModeClass, JScanListener_AttachMode>) end;

  JVector3Class = interface(JObjectClass)
    ['{F4033EBA-4E58-4A9A-8305-851A9D6391D1}']
    {class} function init: JVector3; cdecl; overload;
    {class} function init(P1: JVector3): JVector3; cdecl; overload;
    {class} function init(P1: Double; P2: Double; P3: Double): JVector3; cdecl; overload;
  end;

  [JavaSignature('com/thalmic/myo/Vector3')]
  JVector3 = interface(JObject)
    ['{F8A7F0D9-ED3D-402D-8689-EBEE1D084FCC}']
    procedure add(P1: JVector3); cdecl;
    procedure divide(P1: Double); cdecl;
    function dot(P1: JVector3): Double; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function length: Double; cdecl;
    procedure multiply(P1: Double); cdecl;
    procedure normalize; cdecl;
    procedure &set(P1: JVector3); cdecl;
    procedure subtract(P1: JVector3); cdecl;
    function toString: JString; cdecl;
    function x: Double; cdecl;
    function y: Double; cdecl;
    function z: Double; cdecl;
  end;
  TJVector3 = class(TJavaGenericImport<JVector3Class, JVector3>) end;

  JXDirectionClass = interface(JEnumClass)
    ['{987A99F4-EAAB-4F7D-8712-2B04F5BB67DC}']
    {class} function _GetTOWARD_ELBOW: JXDirection;
    {class} function _GetTOWARD_WRIST: JXDirection;
    {class} function _GetUNKNOWN: JXDirection;
    {class} function valueOf(P1: JString): JXDirection; cdecl;
    {class} function values: TJavaObjectArray<JXDirection>; cdecl;
    {class} property TOWARD_ELBOW: JXDirection read _GetTOWARD_ELBOW;
    {class} property TOWARD_WRIST: JXDirection read _GetTOWARD_WRIST;
    {class} property UNKNOWN: JXDirection read _GetUNKNOWN;
  end;

  [JavaSignature('com/thalmic/myo/XDirection')]
  JXDirection = interface(JEnum)
    ['{6263AF39-0770-45B7-89FD-3E6CA885E0C1}']
  end;
  TJXDirection = class(TJavaGenericImport<JXDirectionClass, JXDirection>) end;

  Jble_AddressClass = interface(JObjectClass)
    ['{8FE953FF-D79C-4ACA-97C8-6EC8591D97F9}']
    {class} function init(P1: JString): Jble_Address; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/Address')]
  Jble_Address = interface(JObject)
    ['{F00EFD42-7F09-47F6-95D8-F3A32C777B41}']
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJble_Address = class(TJavaGenericImport<Jble_AddressClass, Jble_Address>) end;

  JBleFactoryClass = interface(JObjectClass)
    ['{A859A91E-ADE7-4988-8A46-FEFEC4CA8950}']
    {class} function createBleManager(P1: JContext): JBleManager; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleFactory')]
  JBleFactory = interface(JObject)
    ['{7F7C86BF-1600-4514-BFA4-AC27FC08B26D}']
  end;
  TJBleFactory = class(TJavaGenericImport<JBleFactoryClass, JBleFactory>) end;

  JBleGattClass = interface(IJavaClass)
    ['{4992033B-204C-4339-9168-085E505DF035}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleGatt')]
  JBleGatt = interface(IJavaInstance)
    ['{8C371443-1090-4FC1-8607-DBD208AACB5D}']
    procedure discoverServices(P1: JString); cdecl;
    procedure readCharacteristic(P1: JString; P2: JUUID; P3: JUUID); cdecl;
    procedure readRemoteRssi(P1: JString); cdecl;
    procedure setBleGattCallback(P1: JBleGattCallback); cdecl;
    procedure setCharacteristicNotification(P1: JString; P2: JUUID; P3: JUUID; P4: Boolean; P5: Boolean); cdecl;
    procedure writeCharacteristic(P1: JString; P2: JUUID; P3: JUUID; P4: TJavaArray<Byte>); cdecl;
  end;
  TJBleGatt = class(TJavaGenericImport<JBleGattClass, JBleGatt>) end;

  JBleManagerClass = interface(IJavaClass)
    ['{78E82B87-93D7-4D2C-9E0F-4C8813DBE5BA}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleManager')]
  JBleManager = interface(IJavaInstance)
    ['{5A380CCE-8FD7-43AB-8B5B-0E70DEB78028}']
    function connect(P1: JString; P2: Boolean): Boolean; cdecl;
    procedure disconnect(P1: JString); cdecl;
    procedure dispose; cdecl;
    function getBleGatt: JBleGatt; cdecl;
    function isBluetoothSupported: Boolean; cdecl;
    function startBleScan(P1: JBleManager_BleScanCallback): Boolean; cdecl;
    procedure stopBleScan(P1: JBleManager_BleScanCallback); cdecl;
  end;
  TJBleManager = class(TJavaGenericImport<JBleManagerClass, JBleManager>) end;

  JBleManager_BleScanCallbackClass = interface(IJavaClass)
    ['{E267705F-E125-4919-BCF6-DB14938D9C2F}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleManager$BleScanCallback')]
  JBleManager_BleScanCallback = interface(IJavaInstance)
    ['{8169A6CE-A702-45B7-8DBC-8EDD4833BC63}']
    procedure onBleScan(P1: Jble_Address; P2: JString; P3: Integer; P4: JUUID); cdecl;
  end;
  TJBleManager_BleScanCallback = class(TJavaGenericImport<JBleManager_BleScanCallbackClass, JBleManager_BleScanCallback>) end;

  JJBBleManagerClass = interface(JObjectClass)
    ['{3B00A3B0-9856-4237-85BC-520E89E4A562}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBleManager')]
  JJBBleManager = interface(JObject)
    ['{A49AA110-555D-4066-9323-9643257B1A75}']
    function connect(P1: JString; P2: Boolean): Boolean; cdecl;
    procedure disconnect(P1: JString); cdecl;
    procedure dispose; cdecl;
    function getBleGatt: JBleGatt; cdecl;
    function isBluetoothSupported: Boolean; cdecl;
    function startBleScan(P1: JBleManager_BleScanCallback): Boolean; cdecl;
    procedure stopBleScan(P1: JBleManager_BleScanCallback); cdecl;
  end;
  TJJBBleManager = class(TJavaGenericImport<JJBBleManagerClass, JJBBleManager>) end;

  JJBBleManager_LeScanCallbackClass = interface(JObjectClass)
    ['{1657AA1B-4CD8-4333-9D5E-7DE32ED92F7F}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBleManager$LeScanCallback')]
  JJBBleManager_LeScanCallback = interface(JObject)
    ['{56F8F136-1C57-43B6-BBE4-5665A11F7902}']
    procedure onLeScan(P1: JBluetoothDevice; P2: Integer; P3: TJavaArray<Byte>); cdecl;
  end;
  TJJBBleManager_LeScanCallback = class(TJavaGenericImport<JJBBleManager_LeScanCallbackClass, JJBBleManager_LeScanCallback>) end;

  JJBBluetoothLeControllerClass = interface(JObjectClass)
    ['{325C7832-573B-4711-A3CF-089848B19BA2}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController')]
  JJBBluetoothLeController = interface(JObject)
    ['{EDD945DF-6917-4D26-A627-88567509B5DA}']
    procedure close; cdecl;
    function connect(P1: JString; P2: Boolean): Boolean; cdecl;
    procedure disconnect(P1: JString); cdecl;
    procedure discoverServices(P1: JString); cdecl;
    procedure readCharacteristic(P1: JString; P2: JUUID; P3: JUUID); cdecl;
    procedure readRemoteRssi(P1: JString); cdecl;
    procedure setBleGattCallback(P1: JBleGattCallback); cdecl;
    procedure setCharacteristicNotification(P1: JString; P2: JUUID; P3: JUUID; P4: Boolean; P5: Boolean); cdecl;
    procedure writeCharacteristic(P1: JString; P2: JUUID; P3: JUUID; P4: TJavaArray<Byte>); cdecl;
  end;
  TJJBBluetoothLeController = class(TJavaGenericImport<JJBBluetoothLeControllerClass, JJBBluetoothLeController>) end;

  JJBBluetoothLeController_1Class = interface(JBluetoothGattCallbackClass)
    ['{F4754281-7553-4A05-B0DE-1ECA087218F3}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1')]
  JJBBluetoothLeController_1 = interface(JBluetoothGattCallback)
    ['{F2BF9A96-A324-4453-AAF1-6CBD38372C67}']
    procedure onCharacteristicChanged(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic); cdecl;
    procedure onCharacteristicRead(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
    procedure onCharacteristicWrite(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
    procedure onConnectionStateChange(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
    procedure onDescriptorRead(P1: JBluetoothGatt; P2: JBluetoothGattDescriptor; P3: Integer); cdecl;
    procedure onDescriptorWrite(P1: JBluetoothGatt; P2: JBluetoothGattDescriptor; P3: Integer); cdecl;
    procedure onReadRemoteRssi(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
    procedure onServicesDiscovered(P1: JBluetoothGatt; P2: Integer); cdecl;
  end;
  TJJBBluetoothLeController_1 = class(TJavaGenericImport<JJBBluetoothLeController_1Class, JJBBluetoothLeController_1>) end;

  J1_1Class = interface(JObjectClass)
    ['{1487CDFE-BB7C-41D7-B890-28978567C1EA}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$1')]
  J1_1 = interface(JObject)
    ['{B85023BB-1025-4184-826B-9AE5BDC47EC9}']
    procedure run; cdecl;
  end;
  TJ1_1 = class(TJavaGenericImport<J1_1Class, J1_1>) end;

  J1_2Class = interface(JObjectClass)
    ['{2A997E77-E244-49FD-8447-1EBC14AD84A5}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$2')]
  J1_2 = interface(JObject)
    ['{2037BAE5-A507-46EE-ACAB-58A4D2162325}']
    procedure run; cdecl;
  end;
  TJ1_2 = class(TJavaGenericImport<J1_2Class, J1_2>) end;

  J1_3Class = interface(JObjectClass)
    ['{6A1FE584-5546-4B42-A2D4-F5167625C1EB}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$3')]
  J1_3 = interface(JObject)
    ['{134ECD30-FD2C-4070-8060-CD39A33C1216}']
    procedure run; cdecl;
  end;
  TJ1_3 = class(TJavaGenericImport<J1_3Class, J1_3>) end;

  J1_4Class = interface(JObjectClass)
    ['{2FFEBD2E-2551-45CF-930F-74CA0F385B13}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$4')]
  J1_4 = interface(JObject)
    ['{039DE177-65EB-4B7B-AF95-3DBDA94E1C8B}']
    procedure run; cdecl;
  end;
  TJ1_4 = class(TJavaGenericImport<J1_4Class, J1_4>) end;

  J1_5Class = interface(JObjectClass)
    ['{F40FF8CB-DBD8-4EC9-B816-3AD334BC385A}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$5')]
  J1_5 = interface(JObject)
    ['{535C6E13-E1F4-4C7C-AD4B-9659C291EBF5}']
    procedure run; cdecl;
  end;
  TJ1_5 = class(TJavaGenericImport<J1_5Class, J1_5>) end;

  J1_6Class = interface(JObjectClass)
    ['{880171BD-5860-420D-9384-3A0CFBDE47F8}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$6')]
  J1_6 = interface(JObject)
    ['{4D7D366E-33F9-4EF6-8E41-66D57DDB6CAD}']
    procedure run; cdecl;
  end;
  TJ1_6 = class(TJavaGenericImport<J1_6Class, J1_6>) end;

  JJBBluetoothLeController_2Class = interface(JObjectClass)
    ['{EB0CB19F-20B8-4896-9B5E-A879CF665AD3}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$2')]
  JJBBluetoothLeController_2 = interface(JObject)
    ['{327F9572-4E2F-4486-96DF-B299FEEE76F3}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_2 = class(TJavaGenericImport<JJBBluetoothLeController_2Class, JJBBluetoothLeController_2>) end;

  JJBBluetoothLeController_3Class = interface(JObjectClass)
    ['{717283D7-F102-40FA-A5A8-753F5E3A12AF}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$3')]
  JJBBluetoothLeController_3 = interface(JObject)
    ['{AF0A0CDF-186C-439D-A8C0-F9693310516D}']
    function call: JBoolean; cdecl;
  end;
  TJJBBluetoothLeController_3 = class(TJavaGenericImport<JJBBluetoothLeController_3Class, JJBBluetoothLeController_3>) end;

  JJBBluetoothLeController_4Class = interface(JObjectClass)
    ['{57BD2536-1026-4D42-A620-9BF8BDC52C99}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$4')]
  JJBBluetoothLeController_4 = interface(JObject)
    ['{B5491C45-613A-4D79-B932-9A701BD98076}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_4 = class(TJavaGenericImport<JJBBluetoothLeController_4Class, JJBBluetoothLeController_4>) end;

  JJBBluetoothLeController_5Class = interface(JObjectClass)
    ['{D31A4C89-E102-4CF9-ACA4-E84821F13C72}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$5')]
  JJBBluetoothLeController_5 = interface(JObject)
    ['{92E1E14B-99B7-4B34-A810-FFB5C3098519}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_5 = class(TJavaGenericImport<JJBBluetoothLeController_5Class, JJBBluetoothLeController_5>) end;

  JJBBluetoothLeController_6Class = interface(JObjectClass)
    ['{E8E1BA0E-AE70-4368-BD4E-CF035DEEE8FB}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$6')]
  JJBBluetoothLeController_6 = interface(JObject)
    ['{4EBF4BBC-1D6A-4853-B2D7-30B08EF3BA97}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_6 = class(TJavaGenericImport<JJBBluetoothLeController_6Class, JJBBluetoothLeController_6>) end;

  JJBBluetoothLeController_7Class = interface(JObjectClass)
    ['{19BC7BAF-C9E2-44F7-ACFC-308A07DA0C05}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$7')]
  JJBBluetoothLeController_7 = interface(JObject)
    ['{099FF506-7C61-44A4-9993-1BAD07FC43C6}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_7 = class(TJavaGenericImport<JJBBluetoothLeController_7Class, JJBBluetoothLeController_7>) end;

  JJBBluetoothLeController_8Class = interface(JObjectClass)
    ['{A1BC1084-2204-47FB-9287-C863E283D7AC}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$8')]
  JJBBluetoothLeController_8 = interface(JObject)
    ['{15034013-D0D9-44AE-A396-259E80E77548}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_8 = class(TJavaGenericImport<JJBBluetoothLeController_8Class, JJBBluetoothLeController_8>) end;

  JJBBluetoothLeController_9Class = interface(JObjectClass)
    ['{B72DF386-8246-484C-B7E5-38101D9C0142}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$9')]
  JJBBluetoothLeController_9 = interface(JObject)
    ['{3A8E4C4E-B881-4933-91C4-4D706BA2B355}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_9 = class(TJavaGenericImport<JJBBluetoothLeController_9Class, JJBBluetoothLeController_9>) end;

  JByteUtilClass = interface(JObjectClass)
    ['{0C942321-71E1-4DB8-97CD-581C98F02158}']
    {class} function bytesToHex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function getString(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl;
    {class} function getUuidFromBytes(P1: TJavaArray<Byte>; P2: Integer): JUUID; cdecl;
    {class} function init: JByteUtil; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/util/ByteUtil')]
  JByteUtil = interface(JObject)
    ['{7A62FFAA-A88F-4E00-8A3F-CE438771964B}']
  end;
  TJByteUtil = class(TJavaGenericImport<JByteUtilClass, JByteUtil>) end;

  JNetworkUtilClass = interface(JObjectClass)
    ['{66E2C45F-D4E3-4488-9A7B-F9065F652A34}']
    {class} function init: JNetworkUtil; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/util/NetworkUtil')]
  JNetworkUtil = interface(JObject)
    ['{29F6B741-A99B-4516-84EA-175AAB5238A1}']
    function postJsonToUrl(P1: JString; P2: JString): Integer; cdecl;
  end;
  TJNetworkUtil = class(TJavaGenericImport<JNetworkUtilClass, JNetworkUtil>) end;

  JMyoDeviceListAdapterClass = interface(JBaseAdapterClass)
    ['{64B820C3-9C21-49B8-BC71-2A54ED5AA1AB}']
    {class} function init: JMyoDeviceListAdapter; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter')]
  JMyoDeviceListAdapter = interface(JBaseAdapter)
    ['{BA4B8C92-7AF3-48C6-896B-0CA28B544BD5}']
    procedure addDevice(P1: JMyo; P2: Integer); cdecl;
    procedure clear; cdecl;
    function getCount: Integer; cdecl;
    function getItem(P1: Integer): JObject; cdecl;
    function getItemId(P1: Integer): Int64; cdecl;
    function getMyo(P1: Integer): JMyo; cdecl;
    function getView(P1: Integer; P2: JView; P3: JViewGroup): JView; cdecl;
    procedure notifyDataSetChanged; cdecl;
    procedure notifyDeviceChanged; cdecl;
  end;
  TJMyoDeviceListAdapter = class(TJavaGenericImport<JMyoDeviceListAdapterClass, JMyoDeviceListAdapter>) end;

  JMyoDeviceListAdapter_1Class = interface(JObjectClass)
    ['{ECDC19A8-8C79-4F31-A811-F0EDE3BF6CFF}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$1')]
  JMyoDeviceListAdapter_1 = interface(JObject)
    ['{70E714DC-164F-4F52-8363-6964B0707FD5}']
  end;
  TJMyoDeviceListAdapter_1 = class(TJavaGenericImport<JMyoDeviceListAdapter_1Class, JMyoDeviceListAdapter_1>) end;

  JMyoDeviceListAdapter_ItemClass = interface(JObjectClass)
    ['{C6DF3847-05E0-465E-9430-3AE4BDDE8690}']
    {class} function init(P1: JMyoDeviceListAdapter; P2: JMyo; P3: Integer): JMyoDeviceListAdapter_Item; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$Item')]
  JMyoDeviceListAdapter_Item = interface(JObject)
    ['{FE20CAEE-FEEC-498F-BB1E-67B4BB1AF674}']
  end;
  TJMyoDeviceListAdapter_Item = class(TJavaGenericImport<JMyoDeviceListAdapter_ItemClass, JMyoDeviceListAdapter_Item>) end;

  JMyoDeviceListAdapter_RssiComparatorClass = interface(JObjectClass)
    ['{DC014B56-8D27-40FA-8093-96E365B1B3A5}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$RssiComparator')]
  JMyoDeviceListAdapter_RssiComparator = interface(JObject)
    ['{B1603248-B41D-46AB-9F12-16676ED541FB}']
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;
    function compare(P1: JMyoDeviceListAdapter_Item; P2: JMyoDeviceListAdapter_Item): Integer; cdecl; overload;
    function equals(P1: JObject): Boolean; cdecl;
  end;
  TJMyoDeviceListAdapter_RssiComparator = class(TJavaGenericImport<JMyoDeviceListAdapter_RssiComparatorClass, JMyoDeviceListAdapter_RssiComparator>) end;

  JMyoDeviceListAdapter_ViewHolderClass = interface(JObjectClass)
    ['{6C24CDFA-71F0-4B1B-8515-C8A3648AECC3}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$ViewHolder')]
  JMyoDeviceListAdapter_ViewHolder = interface(JObject)
    ['{847EF5FD-16E8-466C-B2A2-134C4B937AEC}']
  end;
  TJMyoDeviceListAdapter_ViewHolder = class(TJavaGenericImport<JMyoDeviceListAdapter_ViewHolderClass, JMyoDeviceListAdapter_ViewHolder>) end;

  JScanActivityClass = interface(JActivityClass)
    ['{FB2FD515-3597-4EC2-BF4B-BEA7FE881DE5}']
    {class} function init: JScanActivity; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanActivity')]
  JScanActivity = interface(JActivity)
    ['{FBCF31BB-E08F-442A-84ED-7E7CB1BAE206}']
  end;
  TJScanActivity = class(TJavaGenericImport<JScanActivityClass, JScanActivity>) end;

  JScanFragmentClass = interface(JFragmentClass)
    ['{E16EB44D-24F6-4CE4-9533-0DC043834595}']
    {class} function init: JScanFragment; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanFragment')]
  JScanFragment = interface(JFragment)
    ['{86C9CAF8-5893-49C1-963E-42CD6FE34237}']
    procedure onActivityCreated(P1: JBundle); cdecl;
    procedure onActivityResult(P1: Integer; P2: Integer; P3: JIntent); cdecl;
    procedure onCreate(P1: JBundle); cdecl;
    procedure onCreateOptionsMenu(P1: JMenu; P2: JMenuInflater); cdecl;
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle): JView; cdecl;
    procedure onDestroy; cdecl;
    procedure onDestroyView; cdecl;
    function onOptionsItemSelected(P1: JMenuItem): Boolean; cdecl;
    procedure onPrepareOptionsMenu(P1: JMenu); cdecl;
    procedure onScanningStarted; cdecl;
    procedure onScanningStopped; cdecl;
  end;
  TJScanFragment = class(TJavaGenericImport<JScanFragmentClass, JScanFragment>) end;

  JScanFragment_1Class = interface(JObjectClass)
    ['{6E58F8A4-A018-4487-96B3-9FA1564D4F12}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanFragment$1')]
  JScanFragment_1 = interface(JObject)
    ['{1A8BDDCA-8556-4803-9AB6-DDF2DA495D22}']
    procedure onItemClick(P1: JAdapterView; P2: JView; P3: Integer; P4: Int64); cdecl;
  end;
  TJScanFragment_1 = class(TJavaGenericImport<JScanFragment_1Class, JScanFragment_1>) end;

  Jscanner_ScannerClass = interface(JObjectClass)
    ['{4FCA34A9-A4EC-42D1-8F1C-8899A44DE71D}']
    {class} function init(P1: JBleManager; P2: JScanner_OnMyoScannedListener; P3: JScanner_OnMyoClickedListener): Jscanner_Scanner; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner')]
  Jscanner_Scanner = interface(JObject)
    ['{B7B2F20E-5D7A-4166-9E63-F2E31863386C}']
    procedure addOnScanningStartedListener(P1: JScanner_OnScanningStartedListener); cdecl;
    function getScanListAdapter: JScanner_ScanListAdapter; cdecl;
    function isScanning: Boolean; cdecl;
    procedure removeOnScanningStartedListener(P1: JScanner_OnScanningStartedListener); cdecl;
    procedure setBleManager(P1: JBleManager); cdecl;
    procedure startScanning; cdecl; overload;
    procedure startScanning(P1: Int64); cdecl; overload;
    procedure startScanning(P1: Int64; P2: Int64); cdecl; overload;
    procedure stopScanning; cdecl;
  end;
  TJscanner_Scanner = class(TJavaGenericImport<Jscanner_ScannerClass, Jscanner_Scanner>) end;

  JScanner_1Class = interface(JObjectClass)
    ['{D38E7877-5BA5-43B3-A279-C56371007EC8}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$1')]
  JScanner_1 = interface(JObject)
    ['{0F8B58C0-F46B-487D-809F-DA7A31E8B1A3}']
    procedure run; cdecl;
  end;
  TJScanner_1 = class(TJavaGenericImport<JScanner_1Class, JScanner_1>) end;

  JScanner_2Class = interface(JObjectClass)
    ['{7D2FC38A-721D-4A63-86D2-0BC5356DFE8C}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$2')]
  JScanner_2 = interface(JObject)
    ['{610F38F3-8AD3-400E-AC0E-894C1E85659D}']
    procedure run; cdecl;
  end;
  TJScanner_2 = class(TJavaGenericImport<JScanner_2Class, JScanner_2>) end;

  JScanner_OnMyoClickedListenerClass = interface(IJavaClass)
    ['{3C22F5AE-009D-4917-8C1E-1C03005E6A1B}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnMyoClickedListener')]
  JScanner_OnMyoClickedListener = interface(IJavaInstance)
    ['{947E9C40-193D-43AC-B5D8-D34D76D41D2E}']
    procedure onMyoClicked(P1: JMyo); cdecl;
  end;
  TJScanner_OnMyoClickedListener = class(TJavaGenericImport<JScanner_OnMyoClickedListenerClass, JScanner_OnMyoClickedListener>) end;

  JScanner_OnMyoScannedListenerClass = interface(IJavaClass)
    ['{A75A7309-66DC-44D7-AAF0-0962FED443FE}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnMyoScannedListener')]
  JScanner_OnMyoScannedListener = interface(IJavaInstance)
    ['{2215E905-64B8-4C30-A1B6-0EC7DEDAD73C}']
    function onMyoScanned(P1: Jble_Address; P2: JString; P3: Integer): JMyo; cdecl;
  end;
  TJScanner_OnMyoScannedListener = class(TJavaGenericImport<JScanner_OnMyoScannedListenerClass, JScanner_OnMyoScannedListener>) end;

  JScanner_OnScanningStartedListenerClass = interface(IJavaClass)
    ['{8E8A0A39-F1E9-48E2-B2F8-5DBFC7D781F1}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnScanningStartedListener')]
  JScanner_OnScanningStartedListener = interface(IJavaInstance)
    ['{C0B635FD-3315-4D90-A7E5-F3556CE56D3E}']
    procedure onScanningStarted; cdecl;
    procedure onScanningStopped; cdecl;
  end;
  TJScanner_OnScanningStartedListener = class(TJavaGenericImport<JScanner_OnScanningStartedListenerClass, JScanner_OnScanningStartedListener>) end;

  JScanner_ScanCallbackClass = interface(JObjectClass)
    ['{379C6CA4-C759-437B-B5BC-3773456ED722}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanCallback')]
  JScanner_ScanCallback = interface(JObject)
    ['{C63A9C0E-0C6A-41BF-B611-E1C6A30B2814}']
    procedure onBleScan(P1: Jble_Address; P2: JString; P3: Integer; P4: JUUID); cdecl;
  end;
  TJScanner_ScanCallback = class(TJavaGenericImport<JScanner_ScanCallbackClass, JScanner_ScanCallback>) end;

  JScanCallback_1Class = interface(JObjectClass)
    ['{0E1DE7CC-79BF-4293-9CD1-2DECFC487D6A}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanCallback$1')]
  JScanCallback_1 = interface(JObject)
    ['{C920B071-8072-4E7E-8707-9AE82CD6C232}']
    procedure run; cdecl;
  end;
  TJScanCallback_1 = class(TJavaGenericImport<JScanCallback_1Class, JScanCallback_1>) end;

  JScanner_ScanListAdapterClass = interface(IJavaClass)
    ['{50E48897-BACC-47CC-8CE2-09927250F858}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanListAdapter')]
  JScanner_ScanListAdapter = interface(IJavaInstance)
    ['{E185075E-A391-4079-9CDB-78D9FBC11586}']
    procedure addDevice(P1: JMyo; P2: Integer); cdecl;
    procedure notifyDeviceChanged; cdecl;
  end;
  TJScanner_ScanListAdapter = class(TJavaGenericImport<JScanner_ScanListAdapterClass, JScanner_ScanListAdapter>) end;

  JVoidClass = interface(JObjectClass)
    ['{E5AB6B2B-2580-469B-BBF6-C226984DFEBE}']
    {class} function _GetTYPE: Jlang_Class;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Void')]
  JVoid = interface(JObject)
    ['{013CC63A-938C-46BE-ACAC-BA854F2F6AC8}']
  end;
  TJVoid = class(TJavaGenericImport<JVoidClass, JVoid>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('MyoAndroid.JAsyncTask', TypeInfo(MyoAndroid.JAsyncTask));
  TRegTypes.RegisterType('MyoAndroid.JAsyncTask_Status', TypeInfo(MyoAndroid.JAsyncTask_Status));
  TRegTypes.RegisterType('MyoAndroid.JPair', TypeInfo(MyoAndroid.JPair));
  TRegTypes.RegisterType('MyoAndroid.JProgressBar', TypeInfo(MyoAndroid.JProgressBar));
  TRegTypes.RegisterType('MyoAndroid.JAbstractDeviceListener', TypeInfo(MyoAndroid.JAbstractDeviceListener));
  TRegTypes.RegisterType('MyoAndroid.JArm', TypeInfo(MyoAndroid.JArm));
  TRegTypes.RegisterType('MyoAndroid.Jmyo_BuildConfig', TypeInfo(MyoAndroid.Jmyo_BuildConfig));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent', TypeInfo(MyoAndroid.JClassifierEvent));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent_1', TypeInfo(MyoAndroid.JClassifierEvent_1));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent_ClassifierEventFormat', TypeInfo(MyoAndroid.JClassifierEvent_ClassifierEventFormat));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent_Type', TypeInfo(MyoAndroid.JClassifierEvent_Type));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand', TypeInfo(MyoAndroid.JControlCommand));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_1', TypeInfo(MyoAndroid.JControlCommand_1));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_EmgMode', TypeInfo(MyoAndroid.JControlCommand_EmgMode));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_SetMode', TypeInfo(MyoAndroid.JControlCommand_SetMode));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_Unlock', TypeInfo(MyoAndroid.JControlCommand_Unlock));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_UserAction', TypeInfo(MyoAndroid.JControlCommand_UserAction));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_Vibration', TypeInfo(MyoAndroid.JControlCommand_Vibration));
  TRegTypes.RegisterType('MyoAndroid.JDeviceListener', TypeInfo(MyoAndroid.JDeviceListener));
  TRegTypes.RegisterType('MyoAndroid.JFirmwareInfo', TypeInfo(MyoAndroid.JFirmwareInfo));
  TRegTypes.RegisterType('MyoAndroid.JFirmwareVersion', TypeInfo(MyoAndroid.JFirmwareVersion));
  TRegTypes.RegisterType('MyoAndroid.JBleGattCallback', TypeInfo(MyoAndroid.JBleGattCallback));
  TRegTypes.RegisterType('MyoAndroid.JGattCallback', TypeInfo(MyoAndroid.JGattCallback));
  TRegTypes.RegisterType('MyoAndroid.JGattCallback_InitReadChar', TypeInfo(MyoAndroid.JGattCallback_InitReadChar));
  TRegTypes.RegisterType('MyoAndroid.JGattCallback_ValueListener', TypeInfo(MyoAndroid.JGattCallback_ValueListener));
  TRegTypes.RegisterType('MyoAndroid.JGattCallback_UpdateParser', TypeInfo(MyoAndroid.JGattCallback_UpdateParser));
  TRegTypes.RegisterType('MyoAndroid.JGattConstants', TypeInfo(MyoAndroid.JGattConstants));
  TRegTypes.RegisterType('MyoAndroid.JHub', TypeInfo(MyoAndroid.JHub));
  TRegTypes.RegisterType('MyoAndroid.JHub_1', TypeInfo(MyoAndroid.JHub_1));
  TRegTypes.RegisterType('MyoAndroid.JHub_2', TypeInfo(MyoAndroid.JHub_2));
  TRegTypes.RegisterType('MyoAndroid.JHub_3', TypeInfo(MyoAndroid.JHub_3));
  TRegTypes.RegisterType('MyoAndroid.JHub_InstanceHolder', TypeInfo(MyoAndroid.JHub_InstanceHolder));
  TRegTypes.RegisterType('MyoAndroid.JHub_LockingPolicy', TypeInfo(MyoAndroid.JHub_LockingPolicy));
  TRegTypes.RegisterType('MyoAndroid.JHub_ScanItemClickListener', TypeInfo(MyoAndroid.JHub_ScanItemClickListener));
  TRegTypes.RegisterType('MyoAndroid.JMultiListener', TypeInfo(MyoAndroid.JMultiListener));
  TRegTypes.RegisterType('MyoAndroid.JMyo', TypeInfo(MyoAndroid.JMyo));
  TRegTypes.RegisterType('MyoAndroid.JMyo_ConnectionState', TypeInfo(MyoAndroid.JMyo_ConnectionState));
  TRegTypes.RegisterType('MyoAndroid.JMyo_UnlockType', TypeInfo(MyoAndroid.JMyo_UnlockType));
  TRegTypes.RegisterType('MyoAndroid.JMyo_VibrationType', TypeInfo(MyoAndroid.JMyo_VibrationType));
  TRegTypes.RegisterType('MyoAndroid.JMyoGatt', TypeInfo(MyoAndroid.JMyoGatt));
  TRegTypes.RegisterType('MyoAndroid.JMyoUpdateParser', TypeInfo(MyoAndroid.JMyoUpdateParser));
  TRegTypes.RegisterType('MyoAndroid.JMyoUpdateParser_1', TypeInfo(MyoAndroid.JMyoUpdateParser_1));
  TRegTypes.RegisterType('MyoAndroid.JPose', TypeInfo(MyoAndroid.JPose));
  TRegTypes.RegisterType('MyoAndroid.JQuaternion', TypeInfo(MyoAndroid.JQuaternion));
  TRegTypes.RegisterType('MyoAndroid.JReporter', TypeInfo(MyoAndroid.JReporter));
  TRegTypes.RegisterType('MyoAndroid.JReporter_1', TypeInfo(MyoAndroid.JReporter_1));
  TRegTypes.RegisterType('MyoAndroid.JScanListener', TypeInfo(MyoAndroid.JScanListener));
  TRegTypes.RegisterType('MyoAndroid.JScanListener_1', TypeInfo(MyoAndroid.JScanListener_1));
  TRegTypes.RegisterType('MyoAndroid.JScanListener_AttachMode', TypeInfo(MyoAndroid.JScanListener_AttachMode));
  TRegTypes.RegisterType('MyoAndroid.JVector3', TypeInfo(MyoAndroid.JVector3));
  TRegTypes.RegisterType('MyoAndroid.JXDirection', TypeInfo(MyoAndroid.JXDirection));
  TRegTypes.RegisterType('MyoAndroid.Jble_Address', TypeInfo(MyoAndroid.Jble_Address));
  TRegTypes.RegisterType('MyoAndroid.JBleFactory', TypeInfo(MyoAndroid.JBleFactory));
  TRegTypes.RegisterType('MyoAndroid.JBleGatt', TypeInfo(MyoAndroid.JBleGatt));
  TRegTypes.RegisterType('MyoAndroid.JBleManager', TypeInfo(MyoAndroid.JBleManager));
  TRegTypes.RegisterType('MyoAndroid.JBleManager_BleScanCallback', TypeInfo(MyoAndroid.JBleManager_BleScanCallback));
  TRegTypes.RegisterType('MyoAndroid.JJBBleManager', TypeInfo(MyoAndroid.JJBBleManager));
  TRegTypes.RegisterType('MyoAndroid.JJBBleManager_LeScanCallback', TypeInfo(MyoAndroid.JJBBleManager_LeScanCallback));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController', TypeInfo(MyoAndroid.JJBBluetoothLeController));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_1', TypeInfo(MyoAndroid.JJBBluetoothLeController_1));
  TRegTypes.RegisterType('MyoAndroid.J1_1', TypeInfo(MyoAndroid.J1_1));
  TRegTypes.RegisterType('MyoAndroid.J1_2', TypeInfo(MyoAndroid.J1_2));
  TRegTypes.RegisterType('MyoAndroid.J1_3', TypeInfo(MyoAndroid.J1_3));
  TRegTypes.RegisterType('MyoAndroid.J1_4', TypeInfo(MyoAndroid.J1_4));
  TRegTypes.RegisterType('MyoAndroid.J1_5', TypeInfo(MyoAndroid.J1_5));
  TRegTypes.RegisterType('MyoAndroid.J1_6', TypeInfo(MyoAndroid.J1_6));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_2', TypeInfo(MyoAndroid.JJBBluetoothLeController_2));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_3', TypeInfo(MyoAndroid.JJBBluetoothLeController_3));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_4', TypeInfo(MyoAndroid.JJBBluetoothLeController_4));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_5', TypeInfo(MyoAndroid.JJBBluetoothLeController_5));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_6', TypeInfo(MyoAndroid.JJBBluetoothLeController_6));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_7', TypeInfo(MyoAndroid.JJBBluetoothLeController_7));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_8', TypeInfo(MyoAndroid.JJBBluetoothLeController_8));
  TRegTypes.RegisterType('MyoAndroid.JJBBluetoothLeController_9', TypeInfo(MyoAndroid.JJBBluetoothLeController_9));
  TRegTypes.RegisterType('MyoAndroid.JByteUtil', TypeInfo(MyoAndroid.JByteUtil));
  TRegTypes.RegisterType('MyoAndroid.JNetworkUtil', TypeInfo(MyoAndroid.JNetworkUtil));
  TRegTypes.RegisterType('MyoAndroid.JMyoDeviceListAdapter', TypeInfo(MyoAndroid.JMyoDeviceListAdapter));
  TRegTypes.RegisterType('MyoAndroid.JMyoDeviceListAdapter_1', TypeInfo(MyoAndroid.JMyoDeviceListAdapter_1));
  TRegTypes.RegisterType('MyoAndroid.JMyoDeviceListAdapter_Item', TypeInfo(MyoAndroid.JMyoDeviceListAdapter_Item));
  TRegTypes.RegisterType('MyoAndroid.JMyoDeviceListAdapter_RssiComparator', TypeInfo(MyoAndroid.JMyoDeviceListAdapter_RssiComparator));
  TRegTypes.RegisterType('MyoAndroid.JMyoDeviceListAdapter_ViewHolder', TypeInfo(MyoAndroid.JMyoDeviceListAdapter_ViewHolder));
  TRegTypes.RegisterType('MyoAndroid.JScanActivity', TypeInfo(MyoAndroid.JScanActivity));
  TRegTypes.RegisterType('MyoAndroid.JScanFragment', TypeInfo(MyoAndroid.JScanFragment));
  TRegTypes.RegisterType('MyoAndroid.JScanFragment_1', TypeInfo(MyoAndroid.JScanFragment_1));
  TRegTypes.RegisterType('MyoAndroid.Jscanner_Scanner', TypeInfo(MyoAndroid.Jscanner_Scanner));
  TRegTypes.RegisterType('MyoAndroid.JScanner_1', TypeInfo(MyoAndroid.JScanner_1));
  TRegTypes.RegisterType('MyoAndroid.JScanner_2', TypeInfo(MyoAndroid.JScanner_2));
  TRegTypes.RegisterType('MyoAndroid.JScanner_OnMyoClickedListener', TypeInfo(MyoAndroid.JScanner_OnMyoClickedListener));
  TRegTypes.RegisterType('MyoAndroid.JScanner_OnMyoScannedListener', TypeInfo(MyoAndroid.JScanner_OnMyoScannedListener));
  TRegTypes.RegisterType('MyoAndroid.JScanner_OnScanningStartedListener', TypeInfo(MyoAndroid.JScanner_OnScanningStartedListener));
  TRegTypes.RegisterType('MyoAndroid.JScanner_ScanCallback', TypeInfo(MyoAndroid.JScanner_ScanCallback));
  TRegTypes.RegisterType('MyoAndroid.JScanCallback_1', TypeInfo(MyoAndroid.JScanCallback_1));
  TRegTypes.RegisterType('MyoAndroid.JScanner_ScanListAdapter', TypeInfo(MyoAndroid.JScanner_ScanListAdapter));
  TRegTypes.RegisterType('MyoAndroid.JVoid', TypeInfo(MyoAndroid.JVoid));
end;

initialization
  RegisterTypes;
end.


