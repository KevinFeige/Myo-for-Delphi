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
  JClassifierEvent_ClassifierEventFormat = interface;//com.thalmic.myo.ClassifierEvent$ClassifierEventFormat
  JClassifierEvent_Type = interface;//com.thalmic.myo.ClassifierEvent$Type
  JControlCommand = interface;//com.thalmic.myo.ControlCommand
  JControlCommand_1 = interface;//com.thalmic.myo.ControlCommand$1
  JControlCommand_EmgMode = interface;//com.thalmic.myo.ControlCommand$EmgMode
  JControlCommand_SetMode = interface;//com.thalmic.myo.ControlCommand$SetMode
  JControlCommand_Vibration = interface;//com.thalmic.myo.ControlCommand$Vibration
  JDeviceListener = interface;//com.thalmic.myo.DeviceListener
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
  JHub_ScanItemClickListener = interface;//com.thalmic.myo.Hub$ScanItemClickListener
  JMultiListener = interface;//com.thalmic.myo.MultiListener
  JMyo = interface;//com.thalmic.myo.Myo
  JMyo_ConnectionState = interface;//com.thalmic.myo.Myo$ConnectionState
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
    ['{B3A95DA8-2C03-4A10-84DB-DC4B21DF269B}']
    {class} function init: JAbstractDeviceListener; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/AbstractDeviceListener')]
  JAbstractDeviceListener = interface(JObject)
    ['{40930A90-DE95-44A8-BC0E-4619BF1CD05C}']
    procedure onAccelerometerData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onArmSync(P1: JMyo; P2: Int64; P3: JArm; P4: JXDirection); cdecl;
    procedure onArmUnsync(P1: JMyo; P2: Int64); cdecl;
    procedure onAttach(P1: JMyo; P2: Int64); cdecl;
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDetach(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
    procedure onGyroscopeData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;
    procedure onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;
    procedure onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
  end;
  TJAbstractDeviceListener = class(TJavaGenericImport<JAbstractDeviceListenerClass, JAbstractDeviceListener>) end;

  JArmClass = interface(JEnumClass)
    ['{2F13DE56-FB8C-4DEC-B677-6C9FE1FED5D4}']
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
    ['{00D7E453-F1E3-42C9-A0CA-7AF3258E0823}']
  end;
  TJArm = class(TJavaGenericImport<JArmClass, JArm>) end;

  Jmyo_BuildConfigClass = interface(JObjectClass)
    ['{774DAB27-02F8-41DD-9384-F8C59E7CA80F}']
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
    ['{4CAF7FF2-5423-49CD-A6FA-D2096C4219CD}']
  end;
  TJmyo_BuildConfig = class(TJavaGenericImport<Jmyo_BuildConfigClass, Jmyo_BuildConfig>) end;

  JClassifierEventClass = interface(JObjectClass)
    ['{EAFD04BC-06D4-4B57-8CE1-67CCC4D93B31}']
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent')]
  JClassifierEvent = interface(JObject)
    ['{F591E950-9DC8-464B-A2A9-5755F5BE06C2}']
    function getArm: JArm; cdecl;
    function getPose: JPose; cdecl;
    function getType: JClassifierEvent_Type; cdecl;
    function getXDirection: JXDirection; cdecl;
    function toString: JString; cdecl;
  end;
  TJClassifierEvent = class(TJavaGenericImport<JClassifierEventClass, JClassifierEvent>) end;

  JClassifierEvent_ClassifierEventFormatClass = interface(JEnumClass)
    ['{761AF6C2-15DF-4A7B-942F-7EB2A16E727C}']
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
    ['{1B65B89B-F663-415B-A5C4-3AB53B57C303}']
  end;
  TJClassifierEvent_ClassifierEventFormat = class(TJavaGenericImport<JClassifierEvent_ClassifierEventFormatClass, JClassifierEvent_ClassifierEventFormat>) end;

  JClassifierEvent_TypeClass = interface(JEnumClass)
    ['{36F64FCA-B90D-47FB-A6F3-219DDF4115EC}']
    {class} function _GetARM_SYNCED: JClassifierEvent_Type;
    {class} function _GetARM_UNSYNCED: JClassifierEvent_Type;
    {class} function _GetPOSE: JClassifierEvent_Type;
    {class} function valueOf(P1: JString): JClassifierEvent_Type; cdecl;
    {class} function values: TJavaObjectArray<JClassifierEvent_Type>; cdecl;
    {class} property ARM_SYNCED: JClassifierEvent_Type read _GetARM_SYNCED;
    {class} property ARM_UNSYNCED: JClassifierEvent_Type read _GetARM_UNSYNCED;
    {class} property POSE: JClassifierEvent_Type read _GetPOSE;
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent$Type')]
  JClassifierEvent_Type = interface(JEnum)
    ['{9B3E6004-EAED-4BBA-94A8-8878A9FAD543}']
  end;
  TJClassifierEvent_Type = class(TJavaGenericImport<JClassifierEvent_TypeClass, JClassifierEvent_Type>) end;

  JControlCommandClass = interface(JObjectClass)
    ['{0E3EBC05-5DD8-4F5E-A69D-DD9E57D813FA}']
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand')]
  JControlCommand = interface(JObject)
    ['{93A970E3-2BC8-44B6-AEEE-FCD01684FF56}']
  end;
  TJControlCommand = class(TJavaGenericImport<JControlCommandClass, JControlCommand>) end;

  JControlCommand_1Class = interface(JObjectClass)
    ['{D69FE6B2-A3B8-4698-9ED6-0CF0887CDBCC}']
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$1')]
  JControlCommand_1 = interface(JObject)
    ['{35C1A7F8-2C41-485B-B33F-D52735510A3E}']
  end;
  TJControlCommand_1 = class(TJavaGenericImport<JControlCommand_1Class, JControlCommand_1>) end;

  JControlCommand_EmgModeClass = interface(JEnumClass)
    ['{A7FB7EC0-4086-428C-AA9F-DC3EA1253975}']
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
    ['{2B76AE97-324D-4312-85C0-3F59E74223C1}']
  end;
  TJControlCommand_EmgMode = class(TJavaGenericImport<JControlCommand_EmgModeClass, JControlCommand_EmgMode>) end;

  JControlCommand_SetModeClass = interface(JEnumClass)
    ['{36EE7F17-3ECC-41F7-9281-0EB150BBB1BE}']
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
    ['{E16B6B6C-71F3-4F93-A91E-DCD1E61C85E5}']
  end;
  TJControlCommand_SetMode = class(TJavaGenericImport<JControlCommand_SetModeClass, JControlCommand_SetMode>) end;

  JControlCommand_VibrationClass = interface(JEnumClass)
    ['{52661C6B-D2E4-45F8-A6DF-B9EEC59C5B17}']
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
    ['{15AB3B45-517A-4447-B45C-A2C8C3F6275A}']
  end;
  TJControlCommand_Vibration = class(TJavaGenericImport<JControlCommand_VibrationClass, JControlCommand_Vibration>) end;

  JDeviceListenerClass = interface(IJavaClass)
    ['{92F9944A-C869-40ED-9A24-63E2B74E9F8F}']
  end;

  [JavaSignature('com/thalmic/myo/DeviceListener')]
  JDeviceListener = interface(IJavaInstance)
    ['{3194FD99-FBB9-441D-BB99-DAC4BDC829AC}']
    procedure onAccelerometerData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onArmSync(P1: JMyo; P2: Int64; P3: JArm; P4: JXDirection); cdecl;
    procedure onArmUnsync(P1: JMyo; P2: Int64); cdecl;
    procedure onAttach(P1: JMyo; P2: Int64); cdecl;
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDetach(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
    procedure onGyroscopeData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;
    procedure onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;
    procedure onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
  end;
  TJDeviceListener = class(TJavaGenericImport<JDeviceListenerClass, JDeviceListener>) end;

  JFirmwareVersionClass = interface(JObjectClass)
    ['{83D30E16-DC2B-46B3-BC87-56BAD75E39E5}']
    {class} function _GetMINIMUM_FIRMWARE_VERSION_MINOR: Integer;
    {class} function _GetREQUIRED_FIRMWARE_VERSION_MAJOR: Integer;
    {class} property MINIMUM_FIRMWARE_VERSION_MINOR: Integer read _GetMINIMUM_FIRMWARE_VERSION_MINOR;
    {class} property REQUIRED_FIRMWARE_VERSION_MAJOR: Integer read _GetREQUIRED_FIRMWARE_VERSION_MAJOR;
  end;

  [JavaSignature('com/thalmic/myo/FirmwareVersion')]
  JFirmwareVersion = interface(JObject)
    ['{59999E93-4337-4299-8AE2-E3D30D670ED3}']
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
    ['{C85E31E4-769C-4974-8DF6-015767500152}']
    {class} function init: JBleGattCallback; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleGattCallback')]
  JBleGattCallback = interface(JObject)
    ['{28C5814B-28E6-48EB-84FA-E6B8CAC332FA}']
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
    ['{1DDE6881-022E-4DC3-BB0C-9CE8D3D16298}']
    {class} function init(P1: JHub): JGattCallback; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/GattCallback')]
  JGattCallback = interface(JBleGattCallback)
    ['{752D2DB3-73D1-44B1-8477-2AF73A29AC6B}']
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
    ['{3B1C7182-3B2F-4171-916D-1EF24A4F58F6}']
    {class} function init(P1: JUUID; P2: JUUID): JGattCallback_InitReadChar; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$InitReadChar')]
  JGattCallback_InitReadChar = interface(JPair)
    ['{874D9A22-F118-4FF5-9484-4F0762EAA3A2}']
    function getCharacteristic: JUUID; cdecl;
    function getService: JUUID; cdecl;
  end;
  TJGattCallback_InitReadChar = class(TJavaGenericImport<JGattCallback_InitReadCharClass, JGattCallback_InitReadChar>) end;

  JGattCallback_ValueListenerClass = interface(IJavaClass)
    ['{1EF41792-FC90-4A6D-B87A-B93A39825429}']
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$ValueListener')]
  JGattCallback_ValueListener = interface(IJavaInstance)
    ['{28E69C62-63C2-49F9-AB00-AF0D21ADBFF6}']
    procedure onCharacteristicChanged(P1: JMyo; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
  end;
  TJGattCallback_ValueListener = class(TJavaGenericImport<JGattCallback_ValueListenerClass, JGattCallback_ValueListener>) end;

  JGattCallback_UpdateParserClass = interface(JGattCallback_ValueListenerClass)
    ['{7E1AB3C8-AB8E-4220-98D7-8B3318736BD4}']
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$UpdateParser')]
  JGattCallback_UpdateParser = interface(JGattCallback_ValueListener)
    ['{8844C70B-25CC-4159-A490-82378E05A082}']
    procedure onMyoConnected(P1: JMyo); cdecl;
    procedure onMyoDisconnected(P1: JMyo); cdecl;
    procedure onReadRemoteRssi(P1: JMyo; P2: Integer); cdecl;
  end;
  TJGattCallback_UpdateParser = class(TJavaGenericImport<JGattCallback_UpdateParserClass, JGattCallback_UpdateParser>) end;

  JGattConstantsClass = interface(JObjectClass)
    ['{6E2B2173-9CD7-467E-A43F-E6FA021FFEF4}']
  end;

  [JavaSignature('com/thalmic/myo/GattConstants')]
  JGattConstants = interface(JObject)
    ['{48EB3641-A492-49B9-8BF1-E0D8DC9DADAB}']
  end;
  TJGattConstants = class(TJavaGenericImport<JGattConstantsClass, JGattConstants>) end;

  JHubClass = interface(JObjectClass)
    ['{2AC9D022-A213-4077-9320-AF46AC5BC4B2}']
    {class} function getInstance: JHub; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/Hub')]
  JHub = interface(JObject)
    ['{41F9F94D-2EAD-479C-8CBB-40285FBA25A7}']
    procedure addListener(P1: JDeviceListener); cdecl;
    procedure attachByMacAddress(P1: JString); cdecl;
    procedure attachToAdjacentMyo; cdecl;
    procedure attachToAdjacentMyos(P1: Integer); cdecl;
    procedure detach(P1: JString); cdecl;
    function getConnectedDevices: JArrayList; cdecl;
    function getScanner: Jscanner_Scanner; cdecl;
    function init(P1: JContext): Boolean; cdecl; overload;
    function init(P1: JContext; P2: JString): Boolean; cdecl; overload;
    function isSendingUsageData: Boolean; cdecl;
    function now: Int64; cdecl;
    procedure removeListener(P1: JDeviceListener); cdecl;
    procedure setSendUsageData(P1: Boolean); cdecl;
    procedure shutdown; cdecl;
  end;
  TJHub = class(TJavaGenericImport<JHubClass, JHub>) end;

  JHub_1Class = interface(JAbstractDeviceListenerClass)
    ['{39539298-B793-4908-AE00-4D8A31C1A903}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$1')]
  JHub_1 = interface(JAbstractDeviceListener)
    ['{F4A02D36-041D-4514-9368-9A3BDE997D74}']
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
  end;
  TJHub_1 = class(TJavaGenericImport<JHub_1Class, JHub_1>) end;

  JHub_2Class = interface(JObjectClass)
    ['{0B3C0103-D864-486A-8B68-A0C31CB991C1}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$2')]
  JHub_2 = interface(JObject)
    ['{A3AFE198-F2FA-4A68-8D2D-F3DE48FEE687}']
    procedure run; cdecl;
  end;
  TJHub_2 = class(TJavaGenericImport<JHub_2Class, JHub_2>) end;

  JHub_3Class = interface(JObjectClass)
    ['{F644D4EC-4C8F-4146-8570-CA269C9CC929}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$3')]
  JHub_3 = interface(JObject)
    ['{FB9472FA-512F-411D-B0B3-CB3AE7B23B57}']
  end;
  TJHub_3 = class(TJavaGenericImport<JHub_3Class, JHub_3>) end;

  JHub_InstanceHolderClass = interface(JObjectClass)
    ['{85228E18-8D18-4CAD-ACF4-0DEFF761FA53}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$InstanceHolder')]
  JHub_InstanceHolder = interface(JObject)
    ['{56C42D03-3D54-4E70-ADD3-3730B350CD0E}']
  end;
  TJHub_InstanceHolder = class(TJavaGenericImport<JHub_InstanceHolderClass, JHub_InstanceHolder>) end;

  JHub_ScanItemClickListenerClass = interface(JObjectClass)
    ['{75E29C44-9546-40B1-A78B-49ED338C90B6}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$ScanItemClickListener')]
  JHub_ScanItemClickListener = interface(JObject)
    ['{49495456-0B83-4B6F-951D-2C635CEC7800}']
    procedure onMyoClicked(P1: JMyo); cdecl;
  end;
  TJHub_ScanItemClickListener = class(TJavaGenericImport<JHub_ScanItemClickListenerClass, JHub_ScanItemClickListener>) end;

  JMultiListenerClass = interface(JObjectClass)
    ['{CB5B8352-1EB7-4BDC-BFDA-95E58F2E9F6B}']
  end;

  [JavaSignature('com/thalmic/myo/MultiListener')]
  JMultiListener = interface(JObject)
    ['{283C64E8-71A9-4C99-8841-D12019703DD8}']
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
    procedure onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;
    procedure onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;
    procedure onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
    procedure remove(P1: JDeviceListener); cdecl;
  end;
  TJMultiListener = class(TJavaGenericImport<JMultiListenerClass, JMultiListener>) end;

  JMyoClass = interface(JObjectClass)
    ['{65FA281C-35A1-4890-95E6-51959970A8CC}']
  end;

  [JavaSignature('com/thalmic/myo/Myo')]
  JMyo = interface(JObject)
    ['{76211A22-8481-4EED-A333-8B7C8EC9A078}']
    function getConnectionState: JMyo_ConnectionState; cdecl;
    function getFirmwareVersionString: JString; cdecl;
    function getMacAddress: JString; cdecl;
    function getName: JString; cdecl;
    function isConnected: Boolean; cdecl;
    function isFirmwareVersionSupported: Boolean; cdecl;
    procedure requestRssi; cdecl;
    procedure vibrate(P1: JMyo_VibrationType); cdecl;
  end;
  TJMyo = class(TJavaGenericImport<JMyoClass, JMyo>) end;

  JMyo_ConnectionStateClass = interface(JEnumClass)
    ['{80A5A83D-E052-48E9-8299-C9933DEE76AB}']
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
    ['{D50013D9-99CE-4BD9-B477-3937756D580C}']
  end;
  TJMyo_ConnectionState = class(TJavaGenericImport<JMyo_ConnectionStateClass, JMyo_ConnectionState>) end;

  JMyo_VibrationTypeClass = interface(JEnumClass)
    ['{B74F1BC6-227B-4367-8F58-6445F63FE138}']
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
    ['{017D445B-18BE-4D45-8D30-386706DF7ED1}']
  end;
  TJMyo_VibrationType = class(TJavaGenericImport<JMyo_VibrationTypeClass, JMyo_VibrationType>) end;

  JMyoGattClass = interface(JObjectClass)
    ['{661AA5B6-F9A8-410D-AC95-182FCA7FC56C}']
    {class} function init(P1: JHub): JMyoGatt; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/MyoGatt')]
  JMyoGatt = interface(JObject)
    ['{452AFF13-2269-40CB-B0A4-8DF1CF86591A}']
    procedure configureDataAcquisition(P1: JString; P2: JControlCommand_EmgMode; P3: Boolean; P4: Boolean); cdecl;
    function connect(P1: JString): Boolean; cdecl; overload;
    function connect(P1: JString; P2: Boolean): Boolean; cdecl; overload;
    procedure disconnect(P1: JString); cdecl;
    procedure requestRssi(P1: JString); cdecl;
    procedure setBleManager(P1: JBleManager); cdecl;
    procedure vibrate(P1: JString; P2: JMyo_VibrationType); cdecl;
  end;
  TJMyoGatt = class(TJavaGenericImport<JMyoGattClass, JMyoGatt>) end;

  JMyoUpdateParserClass = interface(JObjectClass)
    ['{7F5543DE-ADB6-44F0-AD58-E34C45D3C2F8}']
  end;

  [JavaSignature('com/thalmic/myo/MyoUpdateParser')]
  JMyoUpdateParser = interface(JObject)
    ['{0675BDA7-602B-4BF8-9F17-D2F938C64DBC}']
    procedure onCharacteristicChanged(P1: JMyo; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
    procedure onMyoConnected(P1: JMyo); cdecl;
    procedure onMyoDisconnected(P1: JMyo); cdecl;
    procedure onReadRemoteRssi(P1: JMyo; P2: Integer); cdecl;
  end;
  TJMyoUpdateParser = class(TJavaGenericImport<JMyoUpdateParserClass, JMyoUpdateParser>) end;

  JMyoUpdateParser_1Class = interface(JObjectClass)
    ['{D6D2108F-2E2C-48AD-B4D7-DD8BF22C9E72}']
  end;

  [JavaSignature('com/thalmic/myo/MyoUpdateParser$1')]
  JMyoUpdateParser_1 = interface(JObject)
    ['{9910B96F-7138-4017-8828-0B76FD38BA21}']
  end;
  TJMyoUpdateParser_1 = class(TJavaGenericImport<JMyoUpdateParser_1Class, JMyoUpdateParser_1>) end;

  JPoseClass = interface(JEnumClass)
    ['{44D0ED23-BF91-4873-8B4B-AC8273DD6C8B}']
    {class} function _GetFINGERS_SPREAD: JPose;
    {class} function _GetFIST: JPose;
    {class} function _GetREST: JPose;
    {class} function _GetTHUMB_TO_PINKY: JPose;
    {class} function _GetUNKNOWN: JPose;
    {class} function _GetWAVE_IN: JPose;
    {class} function _GetWAVE_OUT: JPose;
    {class} function valueOf(P1: JString): JPose; cdecl;
    {class} function values: TJavaObjectArray<JPose>; cdecl;
    {class} property FINGERS_SPREAD: JPose read _GetFINGERS_SPREAD;
    {class} property FIST: JPose read _GetFIST;
    {class} property REST: JPose read _GetREST;
    {class} property THUMB_TO_PINKY: JPose read _GetTHUMB_TO_PINKY;
    {class} property UNKNOWN: JPose read _GetUNKNOWN;
    {class} property WAVE_IN: JPose read _GetWAVE_IN;
    {class} property WAVE_OUT: JPose read _GetWAVE_OUT;
  end;

  [JavaSignature('com/thalmic/myo/Pose')]
  JPose = interface(JEnum)
    ['{D328A0FF-F13E-4148-9F7D-00B1CA3FE245}']
  end;
  TJPose = class(TJavaGenericImport<JPoseClass, JPose>) end;

  JQuaternionClass = interface(JObjectClass)
    ['{88C20C62-05B7-4F29-9B1B-D9187C158460}']
    {class} function init: JQuaternion; cdecl; overload;
    {class} function init(P1: JQuaternion): JQuaternion; cdecl; overload;
    {class} function init(P1: Double; P2: Double; P3: Double; P4: Double): JQuaternion; cdecl; overload;
    {class} function pitch(P1: JQuaternion): Double; cdecl;
    {class} function roll(P1: JQuaternion): Double; cdecl;
    {class} function yaw(P1: JQuaternion): Double; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/Quaternion')]
  JQuaternion = interface(JObject)
    ['{1F768D62-4C4F-4D85-AF34-5405F05BAA41}']
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
    ['{E2BBFD7A-2187-40E4-8153-F77A23C0B7BC}']
    {class} function init: JReporter; cdecl; overload;
    {class} function init(P1: JNetworkUtil): JReporter; cdecl; overload;
  end;

  [JavaSignature('com/thalmic/myo/Reporter')]
  JReporter = interface(JObject)
    ['{546FBFCD-ACD6-40B7-904F-175C529F34E1}']
    function isSendingUsageData: Boolean; cdecl;
    procedure sendHeartbeat(P1: JMyo; P2: JString); cdecl;
    procedure setSendUsageData(P1: Boolean); cdecl;
  end;
  TJReporter = class(TJavaGenericImport<JReporterClass, JReporter>) end;

  JReporter_1Class = interface(JAsyncTaskClass)
    ['{01D86317-DA7E-4F19-9E02-DA3876C81123}']
  end;

  [JavaSignature('com/thalmic/myo/Reporter$1')]
  JReporter_1 = interface(JAsyncTask)
    ['{38D4C094-814C-4EE9-933D-1133B2BB1AF8}']
  end;
  TJReporter_1 = class(TJavaGenericImport<JReporter_1Class, JReporter_1>) end;

  JScanListenerClass = interface(JObjectClass)
    ['{5822FE63-2D50-4706-B770-FF81CC058961}']
    {class} function init(P1: JHub): JScanListener; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/ScanListener')]
  JScanListener = interface(JObject)
    ['{3D25133F-44BD-46B4-BCE9-32542D355532}']
    procedure attachByMacAddress(P1: JString); cdecl;
    procedure attachToAdjacent(P1: Integer); cdecl;
    function onMyoScanned(P1: Jble_Address; P2: Integer): JMyo; cdecl;
    procedure onScanningStarted; cdecl;
    procedure onScanningStopped; cdecl;
  end;
  TJScanListener = class(TJavaGenericImport<JScanListenerClass, JScanListener>) end;

  JScanListener_1Class = interface(JObjectClass)
    ['{6B5DE700-1403-41B1-9C18-A6E502635C83}']
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$1')]
  JScanListener_1 = interface(JObject)
    ['{99B7E730-3FDF-4A40-AAC5-E3CD4FECF991}']
  end;
  TJScanListener_1 = class(TJavaGenericImport<JScanListener_1Class, JScanListener_1>) end;

  JScanListener_AttachModeClass = interface(JEnumClass)
    ['{AF768F9D-407D-4D67-A85E-C5D6C6889826}']
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
    ['{60E76301-0E48-4D21-8B54-54C61D85161A}']
  end;
  TJScanListener_AttachMode = class(TJavaGenericImport<JScanListener_AttachModeClass, JScanListener_AttachMode>) end;

  JVector3Class = interface(JObjectClass)
    ['{D36267D5-DD9A-4439-A069-47FFA7177166}']
    {class} function init: JVector3; cdecl; overload;
    {class} function init(P1: JVector3): JVector3; cdecl; overload;
    {class} function init(P1: Double; P2: Double; P3: Double): JVector3; cdecl; overload;
  end;

  [JavaSignature('com/thalmic/myo/Vector3')]
  JVector3 = interface(JObject)
    ['{4942915F-F79E-42A3-8959-9352749F1128}']
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
    ['{2B367A93-87E6-42FC-B7A7-B33C2964B2B5}']
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
    ['{BC7C0BA6-6DBF-49BA-96F4-10B8C3013C75}']
  end;
  TJXDirection = class(TJavaGenericImport<JXDirectionClass, JXDirection>) end;

  Jble_AddressClass = interface(JObjectClass)
    ['{09CC654C-0036-4B07-9B4C-544DD1CD5CF6}']
    {class} function init(P1: JString): Jble_Address; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/Address')]
  Jble_Address = interface(JObject)
    ['{AB201FC0-5E94-4D69-81D1-34D5A5A095B1}']
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJble_Address = class(TJavaGenericImport<Jble_AddressClass, Jble_Address>) end;

  JBleFactoryClass = interface(JObjectClass)
    ['{AC702CA9-57E7-4EF4-A09D-FF672CAA031B}']
    {class} function createBleManager(P1: JContext): JBleManager; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleFactory')]
  JBleFactory = interface(JObject)
    ['{CD29E519-EC8D-4D20-ABFC-03FAD414D951}']
  end;
  TJBleFactory = class(TJavaGenericImport<JBleFactoryClass, JBleFactory>) end;

  JBleGattClass = interface(IJavaClass)
    ['{271632CA-82AD-4625-85BF-810D53D4E81E}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleGatt')]
  JBleGatt = interface(IJavaInstance)
    ['{505700A9-D94B-43CA-9279-8218F50F4ABB}']
    procedure discoverServices(P1: JString); cdecl;
    procedure readCharacteristic(P1: JString; P2: JUUID; P3: JUUID); cdecl;
    procedure readRemoteRssi(P1: JString); cdecl;
    procedure setBleGattCallback(P1: JBleGattCallback); cdecl;
    procedure setCharacteristicNotification(P1: JString; P2: JUUID; P3: JUUID; P4: Boolean; P5: Boolean); cdecl;
    procedure writeCharacteristic(P1: JString; P2: JUUID; P3: JUUID; P4: TJavaArray<Byte>); cdecl;
  end;
  TJBleGatt = class(TJavaGenericImport<JBleGattClass, JBleGatt>) end;

  JBleManagerClass = interface(IJavaClass)
    ['{18023A33-190D-4FB6-B589-FE0389667C9E}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleManager')]
  JBleManager = interface(IJavaInstance)
    ['{1E670482-950C-47DF-8D71-6B0E9BC7996A}']
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
    ['{319A1361-F680-4F77-A3C9-4C09DC2ACFDF}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleManager$BleScanCallback')]
  JBleManager_BleScanCallback = interface(IJavaInstance)
    ['{860DC524-FD6E-4D43-867C-9CD3115DDB04}']
    procedure onBleScan(P1: Jble_Address; P2: Integer; P3: JUUID); cdecl;
  end;
  TJBleManager_BleScanCallback = class(TJavaGenericImport<JBleManager_BleScanCallbackClass, JBleManager_BleScanCallback>) end;

  JJBBleManagerClass = interface(JObjectClass)
    ['{8109E3CD-07B6-4428-A77F-90E41CE2E194}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBleManager')]
  JJBBleManager = interface(JObject)
    ['{DA533281-E382-45F1-BD79-50166CA4693B}']
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
    ['{09202255-1E7A-460B-A06C-250429D68782}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBleManager$LeScanCallback')]
  JJBBleManager_LeScanCallback = interface(JObject)
    ['{66ABB47E-AEA3-4551-B3B9-5EA3F6FD1A68}']
    procedure onLeScan(P1: JBluetoothDevice; P2: Integer; P3: TJavaArray<Byte>); cdecl;
  end;
  TJJBBleManager_LeScanCallback = class(TJavaGenericImport<JJBBleManager_LeScanCallbackClass, JJBBleManager_LeScanCallback>) end;

  JJBBluetoothLeControllerClass = interface(JObjectClass)
    ['{F5A453F6-EBAE-4645-9DE4-26FCA362CF14}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController')]
  JJBBluetoothLeController = interface(JObject)
    ['{30E9E62C-1722-49A1-B936-D69F54AFCD7D}']
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
    ['{2CDA28FC-A378-46A2-BBDD-C028272CEE7D}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1')]
  JJBBluetoothLeController_1 = interface(JBluetoothGattCallback)
    ['{9217DD64-CA09-4083-A8CF-FE778F5A8C66}']
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
    ['{9F27B7D7-C3FA-4927-95CD-F0A707CDCCCE}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$1')]
  J1_1 = interface(JObject)
    ['{7452E52E-1795-481F-B4F4-AECEC11EAD89}']
    procedure run; cdecl;
  end;
  TJ1_1 = class(TJavaGenericImport<J1_1Class, J1_1>) end;

  J1_2Class = interface(JObjectClass)
    ['{ED090832-1C00-4AEB-BFC9-6FC9F7BDB31C}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$2')]
  J1_2 = interface(JObject)
    ['{C0380650-92F2-4680-ACD8-8769E768FB9E}']
    procedure run; cdecl;
  end;
  TJ1_2 = class(TJavaGenericImport<J1_2Class, J1_2>) end;

  J1_3Class = interface(JObjectClass)
    ['{DD8AD577-64AA-4309-85CF-D183EA6FDD0A}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$3')]
  J1_3 = interface(JObject)
    ['{BB6BA287-41B1-486A-9D60-F23DA49EA08F}']
    procedure run; cdecl;
  end;
  TJ1_3 = class(TJavaGenericImport<J1_3Class, J1_3>) end;

  J1_4Class = interface(JObjectClass)
    ['{6C1AF1B4-1402-460E-898A-93E06EB6108B}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$4')]
  J1_4 = interface(JObject)
    ['{7D2E0F6B-C6BA-40FD-AC6D-04034A171EA7}']
    procedure run; cdecl;
  end;
  TJ1_4 = class(TJavaGenericImport<J1_4Class, J1_4>) end;

  J1_5Class = interface(JObjectClass)
    ['{EB0F76DC-100E-466B-81A8-E95C273AB4C0}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$5')]
  J1_5 = interface(JObject)
    ['{40A2C594-9DD4-450E-BFDA-F516CEC748CC}']
    procedure run; cdecl;
  end;
  TJ1_5 = class(TJavaGenericImport<J1_5Class, J1_5>) end;

  J1_6Class = interface(JObjectClass)
    ['{0CE13EB4-C59F-4CE8-8B07-E02412AF02F1}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$6')]
  J1_6 = interface(JObject)
    ['{9667B7AB-DE50-43D4-AC30-D4AE05F55CAD}']
    procedure run; cdecl;
  end;
  TJ1_6 = class(TJavaGenericImport<J1_6Class, J1_6>) end;

  JJBBluetoothLeController_2Class = interface(JObjectClass)
    ['{CA1369F0-B377-4919-86BC-C5A8CC6FC240}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$2')]
  JJBBluetoothLeController_2 = interface(JObject)
    ['{F366D156-352B-4F4E-8243-3E9A15A6E87E}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_2 = class(TJavaGenericImport<JJBBluetoothLeController_2Class, JJBBluetoothLeController_2>) end;

  JJBBluetoothLeController_3Class = interface(JObjectClass)
    ['{77BB1AE7-A8D9-4799-A5A6-9745E1872050}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$3')]
  JJBBluetoothLeController_3 = interface(JObject)
    ['{DE624490-9396-436F-AFF3-E61340A97234}']
    function call: JBoolean; cdecl;
  end;
  TJJBBluetoothLeController_3 = class(TJavaGenericImport<JJBBluetoothLeController_3Class, JJBBluetoothLeController_3>) end;

  JJBBluetoothLeController_4Class = interface(JObjectClass)
    ['{3EF9B938-883B-45B7-A85D-20C31150D161}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$4')]
  JJBBluetoothLeController_4 = interface(JObject)
    ['{1B1A8366-2F0E-403E-8BF4-912FA2812DB0}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_4 = class(TJavaGenericImport<JJBBluetoothLeController_4Class, JJBBluetoothLeController_4>) end;

  JJBBluetoothLeController_5Class = interface(JObjectClass)
    ['{485BE4DE-AEB9-4A8C-A084-F6DF6DDBDAFE}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$5')]
  JJBBluetoothLeController_5 = interface(JObject)
    ['{C92D5C35-ABBF-4C69-B362-A4A57268B787}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_5 = class(TJavaGenericImport<JJBBluetoothLeController_5Class, JJBBluetoothLeController_5>) end;

  JJBBluetoothLeController_6Class = interface(JObjectClass)
    ['{0507CD81-33FD-49BF-A35A-09F71146B5F1}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$6')]
  JJBBluetoothLeController_6 = interface(JObject)
    ['{29DF58C9-969E-48C1-A22E-0DC13EE5AB5F}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_6 = class(TJavaGenericImport<JJBBluetoothLeController_6Class, JJBBluetoothLeController_6>) end;

  JJBBluetoothLeController_7Class = interface(JObjectClass)
    ['{8F0AF48E-4A92-49CA-BA0F-46995627FBA9}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$7')]
  JJBBluetoothLeController_7 = interface(JObject)
    ['{6C69A5FA-0AEC-403B-B318-FD2A4FF1FDC5}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_7 = class(TJavaGenericImport<JJBBluetoothLeController_7Class, JJBBluetoothLeController_7>) end;

  JJBBluetoothLeController_8Class = interface(JObjectClass)
    ['{AF6EEC7A-2B16-4A71-9943-006AB030A692}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$8')]
  JJBBluetoothLeController_8 = interface(JObject)
    ['{9B861C16-809E-4F8A-BFFC-237533BEA327}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_8 = class(TJavaGenericImport<JJBBluetoothLeController_8Class, JJBBluetoothLeController_8>) end;

  JJBBluetoothLeController_9Class = interface(JObjectClass)
    ['{CE79F376-C533-44D1-8B54-321345AA1A09}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$9')]
  JJBBluetoothLeController_9 = interface(JObject)
    ['{0E29C15D-3C82-4E58-B6BD-475E022BB656}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_9 = class(TJavaGenericImport<JJBBluetoothLeController_9Class, JJBBluetoothLeController_9>) end;

  JByteUtilClass = interface(JObjectClass)
    ['{1BDBD2D5-632C-4BC5-93FE-F93D6BC55FDE}']
    {class} function bytesToHex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function getString(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl;
    {class} function getUuidFromBytes(P1: TJavaArray<Byte>; P2: Integer): JUUID; cdecl;
    {class} function init: JByteUtil; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/util/ByteUtil')]
  JByteUtil = interface(JObject)
    ['{A0551F4D-7FF6-45FA-97D0-A4298C9182DB}']
  end;
  TJByteUtil = class(TJavaGenericImport<JByteUtilClass, JByteUtil>) end;

  JNetworkUtilClass = interface(JObjectClass)
    ['{CE9131BB-D3BC-4230-8CE2-FE24DE44F63D}']
    {class} function init: JNetworkUtil; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/util/NetworkUtil')]
  JNetworkUtil = interface(JObject)
    ['{09F404BC-341B-4674-90A0-EDB3E9C27DB4}']
    function postJsonToUrl(P1: JString; P2: JString): Integer; cdecl;
  end;
  TJNetworkUtil = class(TJavaGenericImport<JNetworkUtilClass, JNetworkUtil>) end;

  JMyoDeviceListAdapterClass = interface(JBaseAdapterClass)
    ['{C082E524-0C2F-4327-922A-12409B67902E}']
    {class} function init: JMyoDeviceListAdapter; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter')]
  JMyoDeviceListAdapter = interface(JBaseAdapter)
    ['{2546E59C-0F9B-475D-879A-B1772AD3C386}']
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
    ['{23D2E260-F4C1-4D2F-92BF-0A19250DF548}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$1')]
  JMyoDeviceListAdapter_1 = interface(JObject)
    ['{854F4345-41D8-45E5-9E77-6A719BDBEA0C}']
  end;
  TJMyoDeviceListAdapter_1 = class(TJavaGenericImport<JMyoDeviceListAdapter_1Class, JMyoDeviceListAdapter_1>) end;

  JMyoDeviceListAdapter_ItemClass = interface(JObjectClass)
    ['{A44D6425-3C38-4F0D-BB6A-7E6FB8A92601}']
    {class} function init(P1: JMyoDeviceListAdapter; P2: JMyo; P3: Integer): JMyoDeviceListAdapter_Item; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$Item')]
  JMyoDeviceListAdapter_Item = interface(JObject)
    ['{BA02B863-728F-426D-A7D3-7021FA701EB4}']
  end;
  TJMyoDeviceListAdapter_Item = class(TJavaGenericImport<JMyoDeviceListAdapter_ItemClass, JMyoDeviceListAdapter_Item>) end;

  JMyoDeviceListAdapter_RssiComparatorClass = interface(JObjectClass)
    ['{682685DD-A97C-49A3-8715-6A376B1364E0}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$RssiComparator')]
  JMyoDeviceListAdapter_RssiComparator = interface(JObject)
    ['{56EFFD4F-B213-4C90-948D-BCC79E091C0B}']
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;
    function compare(P1: JMyoDeviceListAdapter_Item; P2: JMyoDeviceListAdapter_Item): Integer; cdecl; overload;
    function equals(P1: JObject): Boolean; cdecl;
  end;
  TJMyoDeviceListAdapter_RssiComparator = class(TJavaGenericImport<JMyoDeviceListAdapter_RssiComparatorClass, JMyoDeviceListAdapter_RssiComparator>) end;

  JMyoDeviceListAdapter_ViewHolderClass = interface(JObjectClass)
    ['{2975B4FF-703B-43C3-AF34-B9653820A883}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$ViewHolder')]
  JMyoDeviceListAdapter_ViewHolder = interface(JObject)
    ['{B62501C6-248C-474A-ABE9-E460647E1D77}']
  end;
  TJMyoDeviceListAdapter_ViewHolder = class(TJavaGenericImport<JMyoDeviceListAdapter_ViewHolderClass, JMyoDeviceListAdapter_ViewHolder>) end;

  JScanActivityClass = interface(JActivityClass)
    ['{F1F3FEBE-DDC2-4F02-93E1-B6E5BE52AE82}']
    {class} function init: JScanActivity; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanActivity')]
  JScanActivity = interface(JActivity)
    ['{CC36CC54-60A3-45CB-8ED8-CD47DAC4590E}']
  end;
  TJScanActivity = class(TJavaGenericImport<JScanActivityClass, JScanActivity>) end;

  JScanFragmentClass = interface(JFragmentClass)
    ['{7B0C680B-B43E-4719-870E-6EC951416249}']
    {class} function init: JScanFragment; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanFragment')]
  JScanFragment = interface(JFragment)
    ['{1F75F9D6-4FA5-4235-946F-A0A6EA2883DB}']
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
    ['{1ECEF2FB-B712-45EE-AF65-73B923C4BC94}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanFragment$1')]
  JScanFragment_1 = interface(JObject)
    ['{6C310BA2-0197-4B90-8DB7-74A0277E52D9}']
    procedure onItemClick(P1: JAdapterView; P2: JView; P3: Integer; P4: Int64); cdecl;
  end;
  TJScanFragment_1 = class(TJavaGenericImport<JScanFragment_1Class, JScanFragment_1>) end;

  Jscanner_ScannerClass = interface(JObjectClass)
    ['{D0268906-DEF1-49C5-A17E-62F2A474567C}']
    {class} function init(P1: JBleManager; P2: JScanner_OnMyoScannedListener; P3: JScanner_OnMyoClickedListener): Jscanner_Scanner; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner')]
  Jscanner_Scanner = interface(JObject)
    ['{5497F87E-66D4-4BF2-A8C9-6758BE9BCE9A}']
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
    ['{5A41F27D-ECCF-4F2E-9F30-451CD4E48A4B}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$1')]
  JScanner_1 = interface(JObject)
    ['{A24A48EF-084C-444C-BF0B-2974629FAC6F}']
    procedure run; cdecl;
  end;
  TJScanner_1 = class(TJavaGenericImport<JScanner_1Class, JScanner_1>) end;

  JScanner_2Class = interface(JObjectClass)
    ['{C0CD5C7D-5C99-4BF6-A388-E3762C2EEB0E}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$2')]
  JScanner_2 = interface(JObject)
    ['{184D2783-A5BB-4DA0-B9DE-34FEA1995EB2}']
    procedure run; cdecl;
  end;
  TJScanner_2 = class(TJavaGenericImport<JScanner_2Class, JScanner_2>) end;

  JScanner_OnMyoClickedListenerClass = interface(IJavaClass)
    ['{7A291143-A0A0-4B49-866B-A2AB2501E7E1}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnMyoClickedListener')]
  JScanner_OnMyoClickedListener = interface(IJavaInstance)
    ['{62BAB819-34D4-474C-A029-70A6E3D60816}']
    procedure onMyoClicked(P1: JMyo); cdecl;
  end;
  TJScanner_OnMyoClickedListener = class(TJavaGenericImport<JScanner_OnMyoClickedListenerClass, JScanner_OnMyoClickedListener>) end;

  JScanner_OnMyoScannedListenerClass = interface(IJavaClass)
    ['{DD67B010-4EE3-4AE7-9556-B77F3410DB3A}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnMyoScannedListener')]
  JScanner_OnMyoScannedListener = interface(IJavaInstance)
    ['{A028556E-68CF-46DF-A935-A7DBF983CC9A}']
    function onMyoScanned(P1: Jble_Address; P2: Integer): JMyo; cdecl;
  end;
  TJScanner_OnMyoScannedListener = class(TJavaGenericImport<JScanner_OnMyoScannedListenerClass, JScanner_OnMyoScannedListener>) end;

  JScanner_OnScanningStartedListenerClass = interface(IJavaClass)
    ['{11D69E38-4A27-438C-BA59-853C2F05D1A4}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnScanningStartedListener')]
  JScanner_OnScanningStartedListener = interface(IJavaInstance)
    ['{EA42E522-CDAC-4599-B17E-FA4F38BB8E72}']
    procedure onScanningStarted; cdecl;
    procedure onScanningStopped; cdecl;
  end;
  TJScanner_OnScanningStartedListener = class(TJavaGenericImport<JScanner_OnScanningStartedListenerClass, JScanner_OnScanningStartedListener>) end;

  JScanner_ScanCallbackClass = interface(JObjectClass)
    ['{DCF71B0F-E860-4060-93FB-F42D884EEED4}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanCallback')]
  JScanner_ScanCallback = interface(JObject)
    ['{9CF376C7-1456-4E4B-AD73-8B4B5DD2CED8}']
    procedure onBleScan(P1: Jble_Address; P2: Integer; P3: JUUID); cdecl;
  end;
  TJScanner_ScanCallback = class(TJavaGenericImport<JScanner_ScanCallbackClass, JScanner_ScanCallback>) end;

  JScanCallback_1Class = interface(JObjectClass)
    ['{55537384-3864-4F35-A74C-2DB3567618C4}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanCallback$1')]
  JScanCallback_1 = interface(JObject)
    ['{C0057D06-2F5E-4A4E-856C-4C7F957BE491}']
    procedure run; cdecl;
  end;
  TJScanCallback_1 = class(TJavaGenericImport<JScanCallback_1Class, JScanCallback_1>) end;

  JScanner_ScanListAdapterClass = interface(IJavaClass)
    ['{537C5671-C890-4BA6-ACA2-131B1EAA51B5}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanListAdapter')]
  JScanner_ScanListAdapter = interface(IJavaInstance)
    ['{2F751B2C-1496-4862-9DA1-0A600FACC7AB}']
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
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent_ClassifierEventFormat', TypeInfo(MyoAndroid.JClassifierEvent_ClassifierEventFormat));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent_Type', TypeInfo(MyoAndroid.JClassifierEvent_Type));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand', TypeInfo(MyoAndroid.JControlCommand));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_1', TypeInfo(MyoAndroid.JControlCommand_1));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_EmgMode', TypeInfo(MyoAndroid.JControlCommand_EmgMode));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_SetMode', TypeInfo(MyoAndroid.JControlCommand_SetMode));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_Vibration', TypeInfo(MyoAndroid.JControlCommand_Vibration));
  TRegTypes.RegisterType('MyoAndroid.JDeviceListener', TypeInfo(MyoAndroid.JDeviceListener));
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
  TRegTypes.RegisterType('MyoAndroid.JHub_ScanItemClickListener', TypeInfo(MyoAndroid.JHub_ScanItemClickListener));
  TRegTypes.RegisterType('MyoAndroid.JMultiListener', TypeInfo(MyoAndroid.JMultiListener));
  TRegTypes.RegisterType('MyoAndroid.JMyo', TypeInfo(MyoAndroid.JMyo));
  TRegTypes.RegisterType('MyoAndroid.JMyo_ConnectionState', TypeInfo(MyoAndroid.JMyo_ConnectionState));
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


