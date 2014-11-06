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
  JArm_1 = interface;//com.thalmic.myo.Arm$1
  Jmyo_BuildConfig = interface;//com.thalmic.myo.BuildConfig
  JClassifierEvent = interface;//com.thalmic.myo.ClassifierEvent
  JClassifierEvent_ClassifierEventFormat = interface;//com.thalmic.myo.ClassifierEvent$ClassifierEventFormat
  JClassifierEvent_Type = interface;//com.thalmic.myo.ClassifierEvent$Type
  JControlCommand = interface;//com.thalmic.myo.ControlCommand
  JControlCommand_1 = interface;//com.thalmic.myo.ControlCommand$1
  JControlCommand_EmgMode = interface;//com.thalmic.myo.ControlCommand$EmgMode
  JControlCommand_SetMode = interface;//com.thalmic.myo.ControlCommand$SetMode
  JControlCommand_SetModeCustom = interface;//com.thalmic.myo.ControlCommand$SetModeCustom
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
  JPose_1 = interface;//com.thalmic.myo.Pose$1
  JQuaternion = interface;//com.thalmic.myo.Quaternion
  JReporter = interface;//com.thalmic.myo.Reporter
  JReporter_1 = interface;//com.thalmic.myo.Reporter$1
  JScanListener = interface;//com.thalmic.myo.ScanListener
  JScanListener_1 = interface;//com.thalmic.myo.ScanListener$1
  JScanListener_ForcePairMyoChecker = interface;//com.thalmic.myo.ScanListener$ForcePairMyoChecker
  JScanListener_ForcePairMyoCheckerImpl = interface;//com.thalmic.myo.ScanListener$ForcePairMyoCheckerImpl
  JForcePairMyoCheckerImpl_1 = interface;//com.thalmic.myo.ScanListener$ForcePairMyoCheckerImpl$1
  JScanListener_PairMode = interface;//com.thalmic.myo.ScanListener$PairMode
  JVector3 = interface;//com.thalmic.myo.Vector3
  JXDirection = interface;//com.thalmic.myo.XDirection
  JXDirection_1 = interface;//com.thalmic.myo.XDirection$1
  Jble_Address = interface;//com.thalmic.myo.internal.ble.Address
  JBleFactory = interface;//com.thalmic.myo.internal.ble.BleFactory
  JBleGatt = interface;//com.thalmic.myo.internal.ble.BleGatt
  JBleManager = interface;//com.thalmic.myo.internal.ble.BleManager
  JBleManager_BleScanCallback = interface;//com.thalmic.myo.internal.ble.BleManager$BleScanCallback
  JJBBleManager = interface;//com.thalmic.myo.internal.ble.JBBleManager
  JJBBleManager_1 = interface;//com.thalmic.myo.internal.ble.JBBleManager$1
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
  JCammClassifier = interface;//com.thalmic.myo.internal.classifier.CammClassifier
  JClassifier = interface;//com.thalmic.myo.internal.classifier.Classifier
  JClassifier_PoseClassifier = interface;//com.thalmic.myo.internal.classifier.Classifier$PoseClassifier
  JClassifier_TrainingData = interface;//com.thalmic.myo.internal.classifier.Classifier$TrainingData
  JVectorClassifier = interface;//com.thalmic.myo.internal.classifier.VectorClassifier
  JVectorClassifierStatePtrs = interface;//com.thalmic.myo.internal.classifier.VectorClassifierStatePtrs
  JByteUtil = interface;//com.thalmic.myo.internal.util.ByteUtil
  JFileUtil = interface;//com.thalmic.myo.internal.util.FileUtil
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
    ['{7FB26D9E-D924-4F18-B075-597B7ADA8513}']
    {class} function init: JAbstractDeviceListener; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/AbstractDeviceListener')]
  JAbstractDeviceListener = interface(JObject)
    ['{ABDC895A-673F-40F8-8222-7B616E36507D}']
    procedure onAccelerometerData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onArmLost(P1: JMyo; P2: Int64); cdecl;
    procedure onArmRecognized(P1: JMyo; P2: Int64; P3: JArm; P4: JXDirection); cdecl;
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
    procedure onGyroscopeData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;
    procedure onPair(P1: JMyo; P2: Int64); cdecl;
    procedure onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;
    procedure onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
  end;
  TJAbstractDeviceListener = class(TJavaGenericImport<JAbstractDeviceListenerClass, JAbstractDeviceListener>) end;

  JArmClass = interface(JEnumClass)
    ['{B6D3DEA1-E5BD-49EF-AA8B-EECBE078768E}']
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
    ['{27B5515A-01FB-4B88-B529-5C967D425D4C}']
  end;
  TJArm = class(TJavaGenericImport<JArmClass, JArm>) end;

  JArm_1Class = interface(JObjectClass)
    ['{0B695641-44B5-4511-BB58-A60FFAF0085A}']
  end;

  [JavaSignature('com/thalmic/myo/Arm$1')]
  JArm_1 = interface(JObject)
    ['{26457955-81CB-47F6-BF3D-8F4B0FC155DB}']
  end;
  TJArm_1 = class(TJavaGenericImport<JArm_1Class, JArm_1>) end;

  Jmyo_BuildConfigClass = interface(JObjectClass)
    ['{2D345794-7572-4BD3-A002-FABF2E530973}']
    {class} function _GetBLE_STACK: JString;
    {class} function _GetBUILD_TYPE: JString;
    {class} function _GetCLASSIFIER_NAME: JString;
    {class} function _GetDEBUG: Boolean;
    {class} function _GetFLAVOR: JString;
    {class} function _GetMYO_SDK_TYPE: JString;
    {class} function _GetPACKAGE_NAME: JString;
    {class} function _GetVERSION_CODE: Integer;
    {class} function _GetVERSION_NAME: JString;
    {class} function init: Jmyo_BuildConfig; cdecl;
    {class} property BLE_STACK: JString read _GetBLE_STACK;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property CLASSIFIER_NAME: JString read _GetCLASSIFIER_NAME;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property MYO_SDK_TYPE: JString read _GetMYO_SDK_TYPE;
    {class} property PACKAGE_NAME: JString read _GetPACKAGE_NAME;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/thalmic/myo/BuildConfig')]
  Jmyo_BuildConfig = interface(JObject)
    ['{3F236322-D199-43B8-8C59-B3B1BD05DCFD}']
  end;
  TJmyo_BuildConfig = class(TJavaGenericImport<Jmyo_BuildConfigClass, Jmyo_BuildConfig>) end;

  JClassifierEventClass = interface(JObjectClass)
    ['{BF5E1ABE-AE96-42D4-A503-F6FBFF22A7BB}']
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent')]
  JClassifierEvent = interface(JObject)
    ['{59BDCE70-8FD3-40A3-A061-8C9906106DA2}']
    function getArm: JArm; cdecl;
    function getPose: JPose; cdecl;
    function getType: JClassifierEvent_Type; cdecl;
    function getXDirection: JXDirection; cdecl;
    function toString: JString; cdecl;
  end;
  TJClassifierEvent = class(TJavaGenericImport<JClassifierEventClass, JClassifierEvent>) end;

  JClassifierEvent_ClassifierEventFormatClass = interface(JEnumClass)
    ['{EDC3B4AE-B024-4B3A-8D5A-3DA84667DF22}']
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
    ['{21C88B47-6F82-4AE4-92BD-BEBE7008A006}']
  end;
  TJClassifierEvent_ClassifierEventFormat = class(TJavaGenericImport<JClassifierEvent_ClassifierEventFormatClass, JClassifierEvent_ClassifierEventFormat>) end;

  JClassifierEvent_TypeClass = interface(JEnumClass)
    ['{1A59E572-C15A-4C80-8F2E-804BF0703089}']
    {class} function _GetARM_LOST: JClassifierEvent_Type;
    {class} function _GetARM_RECOGNIZED: JClassifierEvent_Type;
    {class} function _GetPOSE: JClassifierEvent_Type;
    {class} function valueOf(P1: JString): JClassifierEvent_Type; cdecl;
    {class} function values: TJavaObjectArray<JClassifierEvent_Type>; cdecl;
    {class} property ARM_LOST: JClassifierEvent_Type read _GetARM_LOST;
    {class} property ARM_RECOGNIZED: JClassifierEvent_Type read _GetARM_RECOGNIZED;
    {class} property POSE: JClassifierEvent_Type read _GetPOSE;
  end;

  [JavaSignature('com/thalmic/myo/ClassifierEvent$Type')]
  JClassifierEvent_Type = interface(JEnum)
    ['{19892176-667A-4AD5-805E-EED8F4F2EC95}']
  end;
  TJClassifierEvent_Type = class(TJavaGenericImport<JClassifierEvent_TypeClass, JClassifierEvent_Type>) end;

  JControlCommandClass = interface(JObjectClass)
    ['{6FA8C12C-AFE5-4B38-B092-CDD7F1FD186D}']
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand')]
  JControlCommand = interface(JObject)
    ['{13F0AFA2-F8D3-4CFC-AAD4-2DADCE21453A}']
  end;
  TJControlCommand = class(TJavaGenericImport<JControlCommandClass, JControlCommand>) end;

  JControlCommand_1Class = interface(JObjectClass)
    ['{0D5EDF2A-ABEC-43E8-9033-9A0C2351293B}']
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$1')]
  JControlCommand_1 = interface(JObject)
    ['{EFFD023C-B4B6-4C19-AAD9-C37D8DA17543}']
  end;
  TJControlCommand_1 = class(TJavaGenericImport<JControlCommand_1Class, JControlCommand_1>) end;

  JControlCommand_EmgModeClass = interface(JEnumClass)
    ['{1C080F19-B4CB-4002-B4B8-EA27F0B9B84D}']
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
    ['{DE839DDA-48E7-48CF-94D1-855365942F8C}']
  end;
  TJControlCommand_EmgMode = class(TJavaGenericImport<JControlCommand_EmgModeClass, JControlCommand_EmgMode>) end;

  JControlCommand_SetModeClass = interface(JEnumClass)
    ['{F7BD8920-B88D-4BAA-A492-EEAFEABAF29C}']
    {class} function _GetCOMMAND_TYPE: JControlCommand_SetMode;
    {class} function _GetEMG_MODE: JControlCommand_SetMode;
    {class} function _GetIMU_MODE: JControlCommand_SetMode;
    {class} function _GetPAYLOAD_SIZE: JControlCommand_SetMode;
    {class} function valueOf(P1: JString): JControlCommand_SetMode; cdecl;
    {class} function values: TJavaObjectArray<JControlCommand_SetMode>; cdecl;
    {class} property COMMAND_TYPE: JControlCommand_SetMode read _GetCOMMAND_TYPE;
    {class} property EMG_MODE: JControlCommand_SetMode read _GetEMG_MODE;
    {class} property IMU_MODE: JControlCommand_SetMode read _GetIMU_MODE;
    {class} property PAYLOAD_SIZE: JControlCommand_SetMode read _GetPAYLOAD_SIZE;
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$SetMode')]
  JControlCommand_SetMode = interface(JEnum)
    ['{D43C3155-4CBD-4151-BCFC-FB088F9C9F25}']
  end;
  TJControlCommand_SetMode = class(TJavaGenericImport<JControlCommand_SetModeClass, JControlCommand_SetMode>) end;

  JControlCommand_SetModeCustomClass = interface(JEnumClass)
    ['{BF0D62B9-8755-4EF5-A8DC-11713C232618}']
    {class} function _GetCOMMAND_TYPE: JControlCommand_SetModeCustom;
    {class} function _GetEMG_MODE: JControlCommand_SetModeCustom;
    {class} function _GetEMG_SAMPLE_RATE1: JControlCommand_SetModeCustom;
    {class} function _GetEMG_SAMPLE_RATE2: JControlCommand_SetModeCustom;
    {class} function _GetFV_WINDOW_SHIFT: JControlCommand_SetModeCustom;
    {class} function _GetFV_WINDOW_SIZE: JControlCommand_SetModeCustom;
    {class} function _GetIMU_LPF: JControlCommand_SetModeCustom;
    {class} function _GetIMU_MODE: JControlCommand_SetModeCustom;
    {class} function _GetIMU_SAMPLE_RATE1: JControlCommand_SetModeCustom;
    {class} function _GetIMU_SAMPLE_RATE2: JControlCommand_SetModeCustom;
    {class} function _GetPAYLOAD_SIZE: JControlCommand_SetModeCustom;
    {class} function valueOf(P1: JString): JControlCommand_SetModeCustom; cdecl;
    {class} function values: TJavaObjectArray<JControlCommand_SetModeCustom>; cdecl;
    {class} property COMMAND_TYPE: JControlCommand_SetModeCustom read _GetCOMMAND_TYPE;
    {class} property EMG_MODE: JControlCommand_SetModeCustom read _GetEMG_MODE;
    {class} property EMG_SAMPLE_RATE1: JControlCommand_SetModeCustom read _GetEMG_SAMPLE_RATE1;
    {class} property EMG_SAMPLE_RATE2: JControlCommand_SetModeCustom read _GetEMG_SAMPLE_RATE2;
    {class} property FV_WINDOW_SHIFT: JControlCommand_SetModeCustom read _GetFV_WINDOW_SHIFT;
    {class} property FV_WINDOW_SIZE: JControlCommand_SetModeCustom read _GetFV_WINDOW_SIZE;
    {class} property IMU_LPF: JControlCommand_SetModeCustom read _GetIMU_LPF;
    {class} property IMU_MODE: JControlCommand_SetModeCustom read _GetIMU_MODE;
    {class} property IMU_SAMPLE_RATE1: JControlCommand_SetModeCustom read _GetIMU_SAMPLE_RATE1;
    {class} property IMU_SAMPLE_RATE2: JControlCommand_SetModeCustom read _GetIMU_SAMPLE_RATE2;
    {class} property PAYLOAD_SIZE: JControlCommand_SetModeCustom read _GetPAYLOAD_SIZE;
  end;

  [JavaSignature('com/thalmic/myo/ControlCommand$SetModeCustom')]
  JControlCommand_SetModeCustom = interface(JEnum)
    ['{4809FA4C-7EF3-4FC7-8CF9-29006E490E5D}']
  end;
  TJControlCommand_SetModeCustom = class(TJavaGenericImport<JControlCommand_SetModeCustomClass, JControlCommand_SetModeCustom>) end;

  JControlCommand_VibrationClass = interface(JEnumClass)
    ['{39B5BE5F-5675-42D2-B893-A115F84993F4}']
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
    ['{18F293A7-DE02-4BF9-9765-8A226C91B52B}']
  end;
  TJControlCommand_Vibration = class(TJavaGenericImport<JControlCommand_VibrationClass, JControlCommand_Vibration>) end;

  JDeviceListenerClass = interface(IJavaClass)
    ['{4681A193-518A-467C-87C7-1775DF5E6EEC}']
  end;

  [JavaSignature('com/thalmic/myo/DeviceListener')]
  JDeviceListener = interface(IJavaInstance)
    ['{BF556A10-A513-4696-B314-8F84C74B0810}']
    procedure onAccelerometerData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onArmLost(P1: JMyo; P2: Int64); cdecl;
    procedure onArmRecognized(P1: JMyo; P2: Int64; P3: JArm; P4: JXDirection); cdecl;
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
    procedure onGyroscopeData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;
    procedure onPair(P1: JMyo; P2: Int64); cdecl;
    procedure onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;
    procedure onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
  end;
  TJDeviceListener = class(TJavaGenericImport<JDeviceListenerClass, JDeviceListener>) end;

  JFirmwareVersionClass = interface(JObjectClass)
    ['{D68EB4E4-49F8-4AFA-A92B-D518F77806E4}']
    {class} function _GetMINIMUM_FIRMWARE_VERSION_PATCH: Integer;
    {class} function _GetREQUIRED_FIRMWARE_VERSION_MAJOR: Integer;
    {class} function _GetREQUIRED_FIRMWARE_VERSION_MINOR: Integer;
    {class} property MINIMUM_FIRMWARE_VERSION_PATCH: Integer read _GetMINIMUM_FIRMWARE_VERSION_PATCH;
    {class} property REQUIRED_FIRMWARE_VERSION_MAJOR: Integer read _GetREQUIRED_FIRMWARE_VERSION_MAJOR;
    {class} property REQUIRED_FIRMWARE_VERSION_MINOR: Integer read _GetREQUIRED_FIRMWARE_VERSION_MINOR;
  end;

  [JavaSignature('com/thalmic/myo/FirmwareVersion')]
  JFirmwareVersion = interface(JObject)
    ['{9D1EAE10-F143-4BE0-8F4F-033FF7121725}']
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
    ['{6BDD74A6-FA30-4618-A492-5206DFFC1AD5}']
    {class} function init: JBleGattCallback; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleGattCallback')]
  JBleGattCallback = interface(JObject)
    ['{B50BC500-9FE1-4842-86A3-425564ED9F8A}']
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
    ['{20A8D239-2CBB-4D4A-A5EE-9C7F7853961A}']
    {class} function init(P1: JHub): JGattCallback; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/GattCallback')]
  JGattCallback = interface(JBleGattCallback)
    ['{712D5E38-0612-4873-994C-64426A1E9635}']
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
    ['{EB374F31-5BBC-4AA2-AC5A-9B693DE5E412}']
    {class} function init(P1: JUUID; P2: JUUID): JGattCallback_InitReadChar; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$InitReadChar')]
  JGattCallback_InitReadChar = interface(JPair)
    ['{80E2DBAA-2C27-4EE8-A065-C35F00DDB0DF}']
    function getCharacteristic: JUUID; cdecl;
    function getService: JUUID; cdecl;
  end;
  TJGattCallback_InitReadChar = class(TJavaGenericImport<JGattCallback_InitReadCharClass, JGattCallback_InitReadChar>) end;

  JGattCallback_ValueListenerClass = interface(IJavaClass)
    ['{74B2BBEB-B769-4BB4-AE29-ADFF8665CBCE}']
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$ValueListener')]
  JGattCallback_ValueListener = interface(IJavaInstance)
    ['{ADAB6D90-99E4-48BA-B713-CEAF62BD813F}']
    procedure onCharacteristicChanged(P1: JMyo; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
  end;
  TJGattCallback_ValueListener = class(TJavaGenericImport<JGattCallback_ValueListenerClass, JGattCallback_ValueListener>) end;

  JGattCallback_UpdateParserClass = interface(JGattCallback_ValueListenerClass)
    ['{5E1DCF38-77FC-474E-B17F-3C7414EF411C}']
  end;

  [JavaSignature('com/thalmic/myo/GattCallback$UpdateParser')]
  JGattCallback_UpdateParser = interface(JGattCallback_ValueListener)
    ['{68A7E180-65D2-4153-911A-BAEA008CC9FC}']
    procedure onMyoConnected(P1: JMyo); cdecl;
    procedure onMyoDisconnected(P1: JMyo); cdecl;
    procedure onReadRemoteRssi(P1: JMyo; P2: Integer); cdecl;
  end;
  TJGattCallback_UpdateParser = class(TJavaGenericImport<JGattCallback_UpdateParserClass, JGattCallback_UpdateParser>) end;

  JGattConstantsClass = interface(JObjectClass)
    ['{DCBE9749-E1B3-4E8D-B6C5-FCACF24CE838}']
  end;

  [JavaSignature('com/thalmic/myo/GattConstants')]
  JGattConstants = interface(JObject)
    ['{CE94F07D-6B1F-491B-99DF-F009DB89C219}']
  end;
  TJGattConstants = class(TJavaGenericImport<JGattConstantsClass, JGattConstants>) end;

  JHubClass = interface(JObjectClass)
    ['{6648A7D1-1A64-4F36-A1D9-8C1384E0346C}']
    {class} function getInstance: JHub; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/Hub')]
  JHub = interface(JObject)
    ['{09A01B63-EA38-449D-BB45-9AA359D9F71C}']
    procedure addListener(P1: JDeviceListener); cdecl;
    function getConnectedDevices: JArrayList; cdecl;
    function getScanner: Jscanner_Scanner; cdecl;
    function init(P1: JContext): Boolean; cdecl; overload;
    function init(P1: JContext; P2: JString): Boolean; cdecl; overload;
    function isSendingUsageData: Boolean; cdecl;
    function now: Int64; cdecl;
    procedure pairByMacAddress(P1: JString); cdecl;
    procedure pairWithAdjacentMyo; cdecl;
    procedure pairWithAdjacentMyos(P1: Integer); cdecl;
    procedure pairWithAnyMyo; cdecl;
    procedure pairWithAnyMyos(P1: Integer); cdecl;
    procedure removeListener(P1: JDeviceListener); cdecl;
    procedure setSendUsageData(P1: Boolean); cdecl;
    procedure shutdown; cdecl;
    procedure unpair(P1: JString); cdecl;
  end;
  TJHub = class(TJavaGenericImport<JHubClass, JHub>) end;

  JHub_1Class = interface(JAbstractDeviceListenerClass)
    ['{F5590A1F-A747-4731-86C5-F2B2F420F107}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$1')]
  JHub_1 = interface(JAbstractDeviceListener)
    ['{FE4E4239-162F-491A-B211-3A0242A53510}']
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
  end;
  TJHub_1 = class(TJavaGenericImport<JHub_1Class, JHub_1>) end;

  JHub_2Class = interface(JObjectClass)
    ['{69652A2A-79CB-4D99-8258-52D879384E72}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$2')]
  JHub_2 = interface(JObject)
    ['{11FFB9DE-BA80-437B-A642-F8D39AC00ADB}']
    procedure run; cdecl;
  end;
  TJHub_2 = class(TJavaGenericImport<JHub_2Class, JHub_2>) end;

  JHub_3Class = interface(JObjectClass)
    ['{C0BB00CE-EFCA-4FD4-ABFA-B37BBF1C69F5}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$3')]
  JHub_3 = interface(JObject)
    ['{896826C9-781F-40BA-84B0-B6AAC43EC29C}']
  end;
  TJHub_3 = class(TJavaGenericImport<JHub_3Class, JHub_3>) end;

  JHub_InstanceHolderClass = interface(JObjectClass)
    ['{6E3E8E16-A523-4FE2-8920-343ACF89114E}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$InstanceHolder')]
  JHub_InstanceHolder = interface(JObject)
    ['{F7A53C4C-72E5-4D0E-A62A-EA19FDF8F642}']
  end;
  TJHub_InstanceHolder = class(TJavaGenericImport<JHub_InstanceHolderClass, JHub_InstanceHolder>) end;

  JHub_ScanItemClickListenerClass = interface(JObjectClass)
    ['{85CC96CB-2D98-4D02-AEF5-D2FE36FAE54D}']
  end;

  [JavaSignature('com/thalmic/myo/Hub$ScanItemClickListener')]
  JHub_ScanItemClickListener = interface(JObject)
    ['{D1B00408-7C40-4061-9B5B-63FAA24CB4AA}']
    procedure onMyoClicked(P1: JMyo); cdecl;
  end;
  TJHub_ScanItemClickListener = class(TJavaGenericImport<JHub_ScanItemClickListenerClass, JHub_ScanItemClickListener>) end;

  JMultiListenerClass = interface(JObjectClass)
    ['{CDFCD6BB-8454-40E2-BF84-81B8F7575DBE}']
  end;

  [JavaSignature('com/thalmic/myo/MultiListener')]
  JMultiListener = interface(JObject)
    ['{E507E709-0563-4817-A028-1CD440F06B33}']
    procedure add(P1: JDeviceListener); cdecl;
    procedure clear; cdecl;
    function &contains(P1: JDeviceListener): Boolean; cdecl;
    procedure onAccelerometerData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onArmLost(P1: JMyo; P2: Int64); cdecl;
    procedure onArmRecognized(P1: JMyo; P2: Int64; P3: JArm; P4: JXDirection); cdecl;
    procedure onConnect(P1: JMyo; P2: Int64); cdecl;
    procedure onDisconnect(P1: JMyo; P2: Int64); cdecl;
    procedure onGyroscopeData(P1: JMyo; P2: Int64; P3: JVector3); cdecl;
    procedure onOrientationData(P1: JMyo; P2: Int64; P3: JQuaternion); cdecl;
    procedure onPair(P1: JMyo; P2: Int64); cdecl;
    procedure onPose(P1: JMyo; P2: Int64; P3: JPose); cdecl;
    procedure onRssi(P1: JMyo; P2: Int64; P3: Integer); cdecl;
    procedure remove(P1: JDeviceListener); cdecl;
  end;
  TJMultiListener = class(TJavaGenericImport<JMultiListenerClass, JMultiListener>) end;

  JMyoClass = interface(JObjectClass)
    ['{F5D79B3C-7F5A-4C47-B9C2-5030C887962E}']
  end;

  [JavaSignature('com/thalmic/myo/Myo')]
  JMyo = interface(JObject)
    ['{A8255D0D-47B1-47FF-9803-22CF6E9B66CC}']
    function getConnectionState: JMyo_ConnectionState; cdecl;
    function getMacAddress: JString; cdecl;
    function getName: JString; cdecl;
    function isConnected: Boolean; cdecl;
    function isFirmwareVersionSupported: Boolean; cdecl;
    procedure requestRssi; cdecl;
    procedure vibrate(P1: JMyo_VibrationType); cdecl;
  end;
  TJMyo = class(TJavaGenericImport<JMyoClass, JMyo>) end;

  JMyo_ConnectionStateClass = interface(JEnumClass)
    ['{F83DB500-E809-4098-A327-B281630BD0B1}']
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
    ['{4058075F-6C24-48EE-B48F-8E68E98BB94C}']
  end;
  TJMyo_ConnectionState = class(TJavaGenericImport<JMyo_ConnectionStateClass, JMyo_ConnectionState>) end;

  JMyo_VibrationTypeClass = interface(JEnumClass)
    ['{E0B46739-9F3A-4373-9433-43965E9909B6}']
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
    ['{68775CFB-0397-4CEC-B476-3BE12A8F19B0}']
  end;
  TJMyo_VibrationType = class(TJavaGenericImport<JMyo_VibrationTypeClass, JMyo_VibrationType>) end;

  JMyoGattClass = interface(JObjectClass)
    ['{0F612396-FF81-48EA-9FA0-7600BF38BD92}']
    {class} function init(P1: JHub): JMyoGatt; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/MyoGatt')]
  JMyoGatt = interface(JObject)
    ['{6B1720D2-83F8-4A45-9879-4F4D8207759F}']
    procedure configureCustomDataAcquisition(P1: JString; P2: JControlCommand_EmgMode; P3: Boolean); cdecl;
    procedure configureDataAcquisition(P1: JString; P2: JControlCommand_EmgMode; P3: Boolean); cdecl;
    function connect(P1: JString): Boolean; cdecl; overload;
    function connect(P1: JString; P2: Boolean): Boolean; cdecl; overload;
    procedure disconnect(P1: JString); cdecl;
    procedure requestRssi(P1: JString); cdecl;
    procedure setBleManager(P1: JBleManager); cdecl;
    procedure vibrate(P1: JString; P2: JMyo_VibrationType); cdecl;
  end;
  TJMyoGatt = class(TJavaGenericImport<JMyoGattClass, JMyoGatt>) end;

  JMyoUpdateParserClass = interface(JObjectClass)
    ['{B340F7CC-ADC0-45ED-8371-A2405B3F9C55}']
  end;

  [JavaSignature('com/thalmic/myo/MyoUpdateParser')]
  JMyoUpdateParser = interface(JObject)
    ['{41065E47-564D-4A2F-8FE7-C866A9D3F2F6}']
    procedure onCharacteristicChanged(P1: JMyo; P2: JUUID; P3: TJavaArray<Byte>); cdecl;
    procedure onMyoConnected(P1: JMyo); cdecl;
    procedure onMyoDisconnected(P1: JMyo); cdecl;
    procedure onReadRemoteRssi(P1: JMyo; P2: Integer); cdecl;
  end;
  TJMyoUpdateParser = class(TJavaGenericImport<JMyoUpdateParserClass, JMyoUpdateParser>) end;

  JMyoUpdateParser_1Class = interface(JObjectClass)
    ['{C19E388F-C4A1-4152-9B01-77FB324A6360}']
  end;

  [JavaSignature('com/thalmic/myo/MyoUpdateParser$1')]
  JMyoUpdateParser_1 = interface(JObject)
    ['{4AE12FB3-EB61-4EDF-AAD5-4DE6C0535259}']
  end;
  TJMyoUpdateParser_1 = class(TJavaGenericImport<JMyoUpdateParser_1Class, JMyoUpdateParser_1>) end;

  JPoseClass = interface(JEnumClass)
    ['{D7D2301B-5FE7-4877-8D53-BC2D977F2226}']
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
    ['{F1452DC3-B351-4E58-91B6-6F13FC742848}']
  end;
  TJPose = class(TJavaGenericImport<JPoseClass, JPose>) end;

  JPose_1Class = interface(JObjectClass)
    ['{DF8C4A7E-4B1D-4EDB-9FD0-EBFAB4F42C31}']
  end;

  [JavaSignature('com/thalmic/myo/Pose$1')]
  JPose_1 = interface(JObject)
    ['{A7B07534-079E-427C-991F-9E2EC3BF331E}']
  end;
  TJPose_1 = class(TJavaGenericImport<JPose_1Class, JPose_1>) end;

  JQuaternionClass = interface(JObjectClass)
    ['{65B08AA9-6F7C-436C-BCCB-FAD3E5294E80}']
    {class} function init: JQuaternion; cdecl; overload;
    {class} function init(P1: JQuaternion): JQuaternion; cdecl; overload;
    {class} function init(P1: Double; P2: Double; P3: Double; P4: Double): JQuaternion; cdecl; overload;
    {class} function pitch(P1: JQuaternion): Double; cdecl;
    {class} function roll(P1: JQuaternion): Double; cdecl;
    {class} function yaw(P1: JQuaternion): Double; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/Quaternion')]
  JQuaternion = interface(JObject)
    ['{9F6533DA-69A0-4DA7-A929-D365F07C3BE9}']
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
    ['{962B441E-64C9-4B67-B85A-3798674C8E00}']
    {class} function init: JReporter; cdecl; overload;
    {class} function init(P1: JNetworkUtil): JReporter; cdecl; overload;
  end;

  [JavaSignature('com/thalmic/myo/Reporter')]
  JReporter = interface(JObject)
    ['{44BAAB06-1F72-4EFE-94E3-EA94F69E7AA0}']
    function isSendingUsageData: Boolean; cdecl;
    procedure sendHeartbeat(P1: JMyo; P2: JString); cdecl;
    procedure setSendUsageData(P1: Boolean); cdecl;
  end;
  TJReporter = class(TJavaGenericImport<JReporterClass, JReporter>) end;

  JReporter_1Class = interface(JAsyncTaskClass)
    ['{BA46BB38-3CC9-4799-9563-250EC9B253A1}']
  end;

  [JavaSignature('com/thalmic/myo/Reporter$1')]
  JReporter_1 = interface(JAsyncTask)
    ['{D03AD31B-3D3A-4D66-977C-D723CB82B27F}']
  end;
  TJReporter_1 = class(TJavaGenericImport<JReporter_1Class, JReporter_1>) end;

  JScanListenerClass = interface(JObjectClass)
    ['{1317E27B-73D6-4B43-8614-426B54C1E044}']
    {class} function init(P1: JHub): JScanListener; cdecl; overload;
  end;

  [JavaSignature('com/thalmic/myo/ScanListener')]
  JScanListener = interface(JObject)
    ['{4D539B31-5F1A-4CE2-A56A-7EA4FCBB3BE5}']
    function onMyoScanned(P1: Jble_Address; P2: Integer): JMyo; cdecl;
    procedure onScanningStarted; cdecl;
    procedure onScanningStopped; cdecl;
    procedure pairByMacAddress(P1: JString); cdecl;
    procedure pairWithAdjacent(P1: Integer); cdecl;
    procedure pairWithAny(P1: Integer); cdecl;
  end;
  TJScanListener = class(TJavaGenericImport<JScanListenerClass, JScanListener>) end;

  JScanListener_1Class = interface(JObjectClass)
    ['{85E69BC3-FE78-446E-80EB-66C7C0311DC7}']
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$1')]
  JScanListener_1 = interface(JObject)
    ['{38AA4B05-E51F-4B7A-83B8-40BA85CCA463}']
  end;
  TJScanListener_1 = class(TJavaGenericImport<JScanListener_1Class, JScanListener_1>) end;

  JScanListener_ForcePairMyoCheckerClass = interface(IJavaClass)
    ['{C1E052B7-4E81-4491-A281-E357F6EAE9BB}']
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$ForcePairMyoChecker')]
  JScanListener_ForcePairMyoChecker = interface(IJavaInstance)
    ['{C028452E-FC49-4D4F-AE8C-C21E6243296E}']
    procedure check(P1: JScanListener); cdecl;
  end;
  TJScanListener_ForcePairMyoChecker = class(TJavaGenericImport<JScanListener_ForcePairMyoCheckerClass, JScanListener_ForcePairMyoChecker>) end;

  JScanListener_ForcePairMyoCheckerImplClass = interface(JObjectClass)
    ['{AAD77E64-D5A4-4270-AB55-DE05BB218430}']
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$ForcePairMyoCheckerImpl')]
  JScanListener_ForcePairMyoCheckerImpl = interface(JObject)
    ['{2621A8B1-A150-4485-8D22-D5B48CB4BFCB}']
    procedure check(P1: JScanListener); cdecl;
  end;
  TJScanListener_ForcePairMyoCheckerImpl = class(TJavaGenericImport<JScanListener_ForcePairMyoCheckerImplClass, JScanListener_ForcePairMyoCheckerImpl>) end;

  JForcePairMyoCheckerImpl_1Class = interface(JAsyncTaskClass)
    ['{48D200C3-0ECF-475F-97BB-EFE1EAB2987B}']
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$ForcePairMyoCheckerImpl$1')]
  JForcePairMyoCheckerImpl_1 = interface(JAsyncTask)
    ['{9BC01557-42E4-4200-A560-B1BE1D57F50B}']
  end;
  TJForcePairMyoCheckerImpl_1 = class(TJavaGenericImport<JForcePairMyoCheckerImpl_1Class, JForcePairMyoCheckerImpl_1>) end;

  JScanListener_PairModeClass = interface(JEnumClass)
    ['{16577514-4F2E-48A4-9F93-4BA3BF3142F4}']
    {class} function _GetADDRESS: JScanListener_PairMode;
    {class} function _GetADJACENT: JScanListener_PairMode;
    {class} function _GetANY: JScanListener_PairMode;
    {class} function _GetNONE: JScanListener_PairMode;
    {class} function valueOf(P1: JString): JScanListener_PairMode; cdecl;
    {class} function values: TJavaObjectArray<JScanListener_PairMode>; cdecl;
    {class} property ADDRESS: JScanListener_PairMode read _GetADDRESS;
    {class} property ADJACENT: JScanListener_PairMode read _GetADJACENT;
    {class} property ANY: JScanListener_PairMode read _GetANY;
    {class} property NONE: JScanListener_PairMode read _GetNONE;
  end;

  [JavaSignature('com/thalmic/myo/ScanListener$PairMode')]
  JScanListener_PairMode = interface(JEnum)
    ['{A4366846-D146-48FA-BB93-B328686454EB}']
  end;
  TJScanListener_PairMode = class(TJavaGenericImport<JScanListener_PairModeClass, JScanListener_PairMode>) end;

  JVector3Class = interface(JObjectClass)
    ['{CD0278C2-FEA0-4449-A602-B74C79DCFC56}']
    {class} function init: JVector3; cdecl; overload;
    {class} function init(P1: JVector3): JVector3; cdecl; overload;
    {class} function init(P1: Double; P2: Double; P3: Double): JVector3; cdecl; overload;
  end;

  [JavaSignature('com/thalmic/myo/Vector3')]
  JVector3 = interface(JObject)
    ['{3A0AA8EC-9848-489A-BF25-7C6398E4FA83}']
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
    ['{17561A28-692A-4057-9268-4EAA5CD92005}']
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
    ['{52557DEA-ADDB-4597-9255-3B3C37C2FBE4}']
  end;
  TJXDirection = class(TJavaGenericImport<JXDirectionClass, JXDirection>) end;

  JXDirection_1Class = interface(JObjectClass)
    ['{A64DAE0D-01E1-41B3-B4A0-9BBD951E1BB8}']
  end;

  [JavaSignature('com/thalmic/myo/XDirection$1')]
  JXDirection_1 = interface(JObject)
    ['{AC8AF655-0300-4920-AC47-5FF2221187DD}']
  end;
  TJXDirection_1 = class(TJavaGenericImport<JXDirection_1Class, JXDirection_1>) end;

  Jble_AddressClass = interface(JObjectClass)
    ['{F141A149-E383-4F8C-8250-1E2DA9F71870}']
    {class} function init(P1: JString): Jble_Address; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/Address')]
  Jble_Address = interface(JObject)
    ['{9A97FD14-FED6-4343-8744-F828ECA0B58F}']
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJble_Address = class(TJavaGenericImport<Jble_AddressClass, Jble_Address>) end;

  JBleFactoryClass = interface(JObjectClass)
    ['{F51D9744-58E7-4A39-A03B-D163C2389655}']
    {class} function createBleManager(P1: JContext): JBleManager; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleFactory')]
  JBleFactory = interface(JObject)
    ['{5414138A-BBC0-400E-8E41-3ADC86BC2FCA}']
  end;
  TJBleFactory = class(TJavaGenericImport<JBleFactoryClass, JBleFactory>) end;

  JBleGattClass = interface(IJavaClass)
    ['{71068765-550A-47D0-99D0-139E267CBB2F}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleGatt')]
  JBleGatt = interface(IJavaInstance)
    ['{058F4B16-BA4D-4DAE-A6C2-E1F1DF9A2861}']
    procedure discoverServices(P1: JString); cdecl;
    procedure readCharacteristic(P1: JString; P2: JUUID; P3: JUUID); cdecl;
    procedure readRemoteRssi(P1: JString); cdecl;
    procedure setBleGattCallback(P1: JBleGattCallback); cdecl;
    procedure setCharacteristicNotification(P1: JString; P2: JUUID; P3: JUUID; P4: Boolean; P5: Boolean); cdecl;
    procedure writeCharacteristic(P1: JString; P2: JUUID; P3: JUUID; P4: TJavaArray<Byte>); cdecl;
  end;
  TJBleGatt = class(TJavaGenericImport<JBleGattClass, JBleGatt>) end;

  JBleManagerClass = interface(IJavaClass)
    ['{89C9B0A3-CA82-43FB-8179-9C116B94301A}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleManager')]
  JBleManager = interface(IJavaInstance)
    ['{73BCB519-024B-45C6-B219-77F96627B0BF}']
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
    ['{E47E5355-D5AA-45F1-BBEB-7CD06B1CA547}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/BleManager$BleScanCallback')]
  JBleManager_BleScanCallback = interface(IJavaInstance)
    ['{99AA9657-8F41-468F-9E28-9B7D8CD3F280}']
    procedure onBleScan(P1: Jble_Address; P2: Integer; P3: JUUID); cdecl;
  end;
  TJBleManager_BleScanCallback = class(TJavaGenericImport<JBleManager_BleScanCallbackClass, JBleManager_BleScanCallback>) end;

  JJBBleManagerClass = interface(JObjectClass)
    ['{6657B091-A609-4C22-882D-4E4CF616FF9E}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBleManager')]
  JJBBleManager = interface(JObject)
    ['{B967F364-749B-4594-9500-D30598E9A683}']
    function connect(P1: JString; P2: Boolean): Boolean; cdecl;
    procedure disconnect(P1: JString); cdecl;
    procedure dispose; cdecl;
    function getBleGatt: JBleGatt; cdecl;
    function isBluetoothSupported: Boolean; cdecl;
    function startBleScan(P1: JBleManager_BleScanCallback): Boolean; cdecl;
    procedure stopBleScan(P1: JBleManager_BleScanCallback); cdecl;
  end;
  TJJBBleManager = class(TJavaGenericImport<JJBBleManagerClass, JJBBleManager>) end;

  JJBBleManager_1Class = interface(JObjectClass)
    ['{2B612365-C1B8-409D-96C3-E234A15A3F7B}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBleManager$1')]
  JJBBleManager_1 = interface(JObject)
    ['{EE3C1EE9-1E3D-4BB9-ABB5-8AA49940E971}']
    procedure onLeScan(P1: JBluetoothDevice; P2: Integer; P3: TJavaArray<Byte>); cdecl;
  end;
  TJJBBleManager_1 = class(TJavaGenericImport<JJBBleManager_1Class, JJBBleManager_1>) end;

  JJBBluetoothLeControllerClass = interface(JObjectClass)
    ['{8AFBF657-7002-431F-B0AE-1421D67096F7}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController')]
  JJBBluetoothLeController = interface(JObject)
    ['{B1499D3E-38B7-47DF-98D6-008052E74B70}']
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
    ['{C13FA2FA-F6E5-473E-8256-E330CEB20CD1}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1')]
  JJBBluetoothLeController_1 = interface(JBluetoothGattCallback)
    ['{F1A0822C-DF56-46A4-80EC-AD840AA0D520}']
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
    ['{B58A2619-7B3B-43AA-9CC2-850054524ED1}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$1')]
  J1_1 = interface(JObject)
    ['{B2C72FDC-79D2-41C6-8A51-D413532517C0}']
    procedure run; cdecl;
  end;
  TJ1_1 = class(TJavaGenericImport<J1_1Class, J1_1>) end;

  J1_2Class = interface(JObjectClass)
    ['{57AC255F-FAE9-47EE-A5F8-77FBA507F513}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$2')]
  J1_2 = interface(JObject)
    ['{3588F0E0-43E3-4077-87BE-ACCE1E8CDA20}']
    procedure run; cdecl;
  end;
  TJ1_2 = class(TJavaGenericImport<J1_2Class, J1_2>) end;

  J1_3Class = interface(JObjectClass)
    ['{3C6A70FD-C202-43F3-BECA-B949E594AEEF}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$3')]
  J1_3 = interface(JObject)
    ['{2467E1A8-41F9-419A-BF1F-8F148659043B}']
    procedure run; cdecl;
  end;
  TJ1_3 = class(TJavaGenericImport<J1_3Class, J1_3>) end;

  J1_4Class = interface(JObjectClass)
    ['{28DC2043-145F-46E9-A3D8-7C06842B724A}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$4')]
  J1_4 = interface(JObject)
    ['{70FAC187-01EE-4721-A33E-42AAEB7F57D5}']
    procedure run; cdecl;
  end;
  TJ1_4 = class(TJavaGenericImport<J1_4Class, J1_4>) end;

  J1_5Class = interface(JObjectClass)
    ['{5CE23BCC-4F37-4F84-B63C-466C36AAFF5C}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$5')]
  J1_5 = interface(JObject)
    ['{87B37C40-0217-4525-8042-6675BE0F368E}']
    procedure run; cdecl;
  end;
  TJ1_5 = class(TJavaGenericImport<J1_5Class, J1_5>) end;

  J1_6Class = interface(JObjectClass)
    ['{A166386B-14B2-4A11-B561-E04B4793BC86}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$1$6')]
  J1_6 = interface(JObject)
    ['{08816B46-E719-4F9E-A69F-7F9C9868389A}']
    procedure run; cdecl;
  end;
  TJ1_6 = class(TJavaGenericImport<J1_6Class, J1_6>) end;

  JJBBluetoothLeController_2Class = interface(JObjectClass)
    ['{AB48B91E-5C6A-4297-A5FC-0E82825046A1}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$2')]
  JJBBluetoothLeController_2 = interface(JObject)
    ['{20257953-9063-40E5-8C4D-D0FE02FB1DCF}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_2 = class(TJavaGenericImport<JJBBluetoothLeController_2Class, JJBBluetoothLeController_2>) end;

  JJBBluetoothLeController_3Class = interface(JObjectClass)
    ['{25C647B4-51FE-440E-B410-701174FED4B0}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$3')]
  JJBBluetoothLeController_3 = interface(JObject)
    ['{E71DDD87-F2CE-46AF-86B9-7E38D4BF5AD6}']
    function call: JBoolean; cdecl;
  end;
  TJJBBluetoothLeController_3 = class(TJavaGenericImport<JJBBluetoothLeController_3Class, JJBBluetoothLeController_3>) end;

  JJBBluetoothLeController_4Class = interface(JObjectClass)
    ['{E995747A-DC38-40E5-A3F3-6F87FB319B3A}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$4')]
  JJBBluetoothLeController_4 = interface(JObject)
    ['{A87B5157-DF19-4B6E-AD44-50B156B67293}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_4 = class(TJavaGenericImport<JJBBluetoothLeController_4Class, JJBBluetoothLeController_4>) end;

  JJBBluetoothLeController_5Class = interface(JObjectClass)
    ['{7C2714D7-CC64-44D4-91CB-33801A215046}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$5')]
  JJBBluetoothLeController_5 = interface(JObject)
    ['{BCB4C88C-BF78-40F0-A1E9-4821D34F6572}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_5 = class(TJavaGenericImport<JJBBluetoothLeController_5Class, JJBBluetoothLeController_5>) end;

  JJBBluetoothLeController_6Class = interface(JObjectClass)
    ['{917E4CE7-2AF3-40A5-9CA4-377D0B832DD2}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$6')]
  JJBBluetoothLeController_6 = interface(JObject)
    ['{79A66087-4205-4D0B-BC7F-0CD0484FB80E}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_6 = class(TJavaGenericImport<JJBBluetoothLeController_6Class, JJBBluetoothLeController_6>) end;

  JJBBluetoothLeController_7Class = interface(JObjectClass)
    ['{81D0A2D3-F64B-4F44-BEBC-446CEF296F49}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$7')]
  JJBBluetoothLeController_7 = interface(JObject)
    ['{4CA05D96-8957-43DF-99D9-3D34DB791E5D}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_7 = class(TJavaGenericImport<JJBBluetoothLeController_7Class, JJBBluetoothLeController_7>) end;

  JJBBluetoothLeController_8Class = interface(JObjectClass)
    ['{462D6C2A-7EE3-4325-9476-6FDAD8C47E1D}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$8')]
  JJBBluetoothLeController_8 = interface(JObject)
    ['{4CC0168F-90A1-40A4-8AA2-576BA658271A}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_8 = class(TJavaGenericImport<JJBBluetoothLeController_8Class, JJBBluetoothLeController_8>) end;

  JJBBluetoothLeController_9Class = interface(JObjectClass)
    ['{607477A7-E745-4470-9EF0-1AE4B0E23E65}']
  end;

  [JavaSignature('com/thalmic/myo/internal/ble/JBBluetoothLeController$9')]
  JJBBluetoothLeController_9 = interface(JObject)
    ['{5DF66E39-6D89-4885-ACD2-5C8F857F50BE}']
    procedure run; cdecl;
  end;
  TJJBBluetoothLeController_9 = class(TJavaGenericImport<JJBBluetoothLeController_9Class, JJBBluetoothLeController_9>) end;

  JCammClassifierClass = interface(JObjectClass)
    ['{43A3B2C8-FADB-4E79-B432-6FBFA5829DEC}']
    {class} function init: JCammClassifier; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/classifier/CammClassifier')]
  JCammClassifier = interface(JObject)
    ['{0D15602F-4546-4825-A3B6-5D2B976FD92B}']
    function classify(P1: TJavaArray<Single>; P2: SmallInt): Integer; cdecl;
    procedure destroy; cdecl;
    function getArm: Integer; cdecl;
    function getState: Integer; cdecl;
    function getXDirection: Integer; cdecl;
    function isTrained: Boolean; cdecl;
    procedure pushImuData(P1: TJavaArray<Single>); cdecl;
    procedure setHardwareRev(P1: Integer); cdecl;
    function train(P1: JClassifier_TrainingData): Boolean; cdecl;
  end;
  TJCammClassifier = class(TJavaGenericImport<JCammClassifierClass, JCammClassifier>) end;

  JClassifierClass = interface(JObjectClass)
    ['{EFF31AF1-81E3-4553-965D-BBBC613EEFE0}']
    {class} function _GetHARDWARE_REV_REVC: Integer;
    {class} function _GetHARDWARE_REV_REVD: Integer;
    {class} function _GetHARDWARE_REV_UNKNOWN: Integer;
    {class} function _GetMYO_ARM_LEFT: Integer;
    {class} function _GetMYO_ARM_RIGHT: Integer;
    {class} function _GetMYO_ARM_UNKNOWN: Integer;
    {class} function _GetMYO_STATE_CLASSIFYING: Integer;
    {class} function _GetMYO_STATE_READY: Integer;
    {class} function _GetMYO_STATE_UNSTABLE: Integer;
    {class} function _GetMYO_X_DIRECTION_TOWARD_ELBOW: Integer;
    {class} function _GetMYO_X_DIRECTION_TOWARD_WRIST: Integer;
    {class} function _GetMYO_X_DIRECTION_UNKNOWN: Integer;
    {class} function _GetNUM_HARDWARE_REVS: Integer;
    {class} function _GetNUM_POSES: Integer;
    {class} function _GetPOSE_FINGERS_SPREAD: Integer;
    {class} function _GetPOSE_FIST: Integer;
    {class} function _GetPOSE_REST: Integer;
    {class} function _GetPOSE_THUMB_TO_PINKY: Integer;
    {class} function _GetPOSE_UNKNOWN: Integer;
    {class} function _GetPOSE_WAVE_IN: Integer;
    {class} function _GetPOSE_WAVE_OUT: Integer;
    {class} function init: JClassifier; cdecl;
    {class} property HARDWARE_REV_REVC: Integer read _GetHARDWARE_REV_REVC;
    {class} property HARDWARE_REV_REVD: Integer read _GetHARDWARE_REV_REVD;
    {class} property HARDWARE_REV_UNKNOWN: Integer read _GetHARDWARE_REV_UNKNOWN;
    {class} property MYO_ARM_LEFT: Integer read _GetMYO_ARM_LEFT;
    {class} property MYO_ARM_RIGHT: Integer read _GetMYO_ARM_RIGHT;
    {class} property MYO_ARM_UNKNOWN: Integer read _GetMYO_ARM_UNKNOWN;
    {class} property MYO_STATE_CLASSIFYING: Integer read _GetMYO_STATE_CLASSIFYING;
    {class} property MYO_STATE_READY: Integer read _GetMYO_STATE_READY;
    {class} property MYO_STATE_UNSTABLE: Integer read _GetMYO_STATE_UNSTABLE;
    {class} property MYO_X_DIRECTION_TOWARD_ELBOW: Integer read _GetMYO_X_DIRECTION_TOWARD_ELBOW;
    {class} property MYO_X_DIRECTION_TOWARD_WRIST: Integer read _GetMYO_X_DIRECTION_TOWARD_WRIST;
    {class} property MYO_X_DIRECTION_UNKNOWN: Integer read _GetMYO_X_DIRECTION_UNKNOWN;
    {class} property NUM_HARDWARE_REVS: Integer read _GetNUM_HARDWARE_REVS;
    {class} property NUM_POSES: Integer read _GetNUM_POSES;
    {class} property POSE_FINGERS_SPREAD: Integer read _GetPOSE_FINGERS_SPREAD;
    {class} property POSE_FIST: Integer read _GetPOSE_FIST;
    {class} property POSE_REST: Integer read _GetPOSE_REST;
    {class} property POSE_THUMB_TO_PINKY: Integer read _GetPOSE_THUMB_TO_PINKY;
    {class} property POSE_UNKNOWN: Integer read _GetPOSE_UNKNOWN;
    {class} property POSE_WAVE_IN: Integer read _GetPOSE_WAVE_IN;
    {class} property POSE_WAVE_OUT: Integer read _GetPOSE_WAVE_OUT;
  end;

  [JavaSignature('com/thalmic/myo/internal/classifier/Classifier')]
  JClassifier = interface(JObject)
    ['{DBD17D1D-CFFB-4799-A0C1-6E6865BB54CA}']
    function classify(P1: TJavaArray<Single>; P2: SmallInt): Integer; cdecl;
    procedure destroy; cdecl;
    function getArm: Integer; cdecl;
    function getState: Integer; cdecl;
    function getXDirection: Integer; cdecl;
    function isTrained: Boolean; cdecl;
    procedure pushImuData(P1: TJavaArray<Single>); cdecl;
    procedure setHardwareRev(P1: Integer); cdecl;
    function train(P1: JClassifier_TrainingData): Boolean; cdecl;
  end;
  TJClassifier = class(TJavaGenericImport<JClassifierClass, JClassifier>) end;

  JClassifier_PoseClassifierClass = interface(IJavaClass)
    ['{02F8763A-8279-4CD5-BCAB-CD55DDE6D713}']
  end;

  [JavaSignature('com/thalmic/myo/internal/classifier/Classifier$PoseClassifier')]
  JClassifier_PoseClassifier = interface(IJavaInstance)
    ['{72E709CC-655C-46F2-9DD9-43A3F6581CC2}']
    function classify(P1: TJavaArray<Single>; P2: SmallInt): Integer; cdecl;
    procedure destroy; cdecl;
    function getArm: Integer; cdecl;
    function getState: Integer; cdecl;
    function getXDirection: Integer; cdecl;
    function isTrained: Boolean; cdecl;
    procedure pushImuData(P1: TJavaArray<Single>); cdecl;
    procedure setHardwareRev(P1: Integer); cdecl;
    function train(P1: JClassifier_TrainingData): Boolean; cdecl;
  end;
  TJClassifier_PoseClassifier = class(TJavaGenericImport<JClassifier_PoseClassifierClass, JClassifier_PoseClassifier>) end;

  JClassifier_TrainingDataClass = interface(JObjectClass)
    ['{E2AE18D7-C58A-4F33-9D10-EE90622479CE}']
    {class} function _GetMAJOR_VERSION: Integer;
    {class} function _GetMINOR_VERSION: Integer;
    {class} function _GetNUM_CHANNELS: Integer;
    {class} function _GetNUM_POSES: Integer;
    {class} function _GetNUM_SAMPLES: Integer;
    {class} function init: JClassifier_TrainingData; cdecl;
    {class} property MAJOR_VERSION: Integer read _GetMAJOR_VERSION;
    {class} property MINOR_VERSION: Integer read _GetMINOR_VERSION;
    {class} property NUM_CHANNELS: Integer read _GetNUM_CHANNELS;
    {class} property NUM_POSES: Integer read _GetNUM_POSES;
    {class} property NUM_SAMPLES: Integer read _GetNUM_SAMPLES;
  end;

  [JavaSignature('com/thalmic/myo/internal/classifier/Classifier$TrainingData')]
  JClassifier_TrainingData = interface(JObject)
    ['{1E40FE1D-7B0F-4637-A52A-8B61CFC6C1AE}']
    function _Get: TJavaBiArray<Integer>;
    procedure _Set(Value: TJavaBiArray<Integer>);
    property Data: TJavaBiArray<Integer> read _Get write _Set;
  end;
  TJClassifier_TrainingData = class(TJavaGenericImport<JClassifier_TrainingDataClass, JClassifier_TrainingData>) end;

  JVectorClassifierClass = interface(JObjectClass)
    ['{D2662B9E-0063-4394-B6F5-7599EEE89DCD}']
    {class} function init: JVectorClassifier; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/classifier/VectorClassifier')]
  JVectorClassifier = interface(JObject)
    ['{36D23D0F-FD8E-4C35-B07A-34C0CDD34980}']
    function classify(P1: TJavaArray<Single>; P2: SmallInt): Integer; cdecl;
    procedure destroy; cdecl;
    function getArm: Integer; cdecl;
    function getState: Integer; cdecl;
    function getXDirection: Integer; cdecl;
    function isTrained: Boolean; cdecl;
    procedure pushImuData(P1: TJavaArray<Single>); cdecl;
    procedure setHardwareRev(P1: Integer); cdecl;
    function train(P1: JClassifier_TrainingData): Boolean; cdecl;
  end;
  TJVectorClassifier = class(TJavaGenericImport<JVectorClassifierClass, JVectorClassifier>) end;

  JVectorClassifierStatePtrsClass = interface(JObjectClass)
    ['{BA8F3ED7-7DEE-482F-BE28-F597485C7839}']
  end;

  [JavaSignature('com/thalmic/myo/internal/classifier/VectorClassifierStatePtrs')]
  JVectorClassifierStatePtrs = interface(JObject)
    ['{C917EF28-8AA9-4112-A7CA-3D8781239701}']
  end;
  TJVectorClassifierStatePtrs = class(TJavaGenericImport<JVectorClassifierStatePtrsClass, JVectorClassifierStatePtrs>) end;

  JByteUtilClass = interface(JObjectClass)
    ['{A6A83077-9565-45B4-843E-7339E0520BF6}']
    {class} function bytesToHex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function getString(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl;
    {class} function getUuidFromBytes(P1: TJavaArray<Byte>; P2: Integer): JUUID; cdecl;
    {class} function init: JByteUtil; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/util/ByteUtil')]
  JByteUtil = interface(JObject)
    ['{E3E2BD1F-8E14-4A3B-82B8-9E7D38BA647E}']
  end;
  TJByteUtil = class(TJavaGenericImport<JByteUtilClass, JByteUtil>) end;

  JFileUtilClass = interface(JObjectClass)
    ['{560DFECD-23F9-4F2C-91DE-D1D22C64BA85}']
    {class} function readFileLineAsString(P1: JFile): JString; cdecl;
    {class} function readStringFromFile(P1: JFile): JString; cdecl;
    {class} procedure writeStringToFile(P1: JFile; P2: JString); cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/util/FileUtil')]
  JFileUtil = interface(JObject)
    ['{58F454E6-1CE2-4AEC-A289-14F52C802A9A}']
  end;
  TJFileUtil = class(TJavaGenericImport<JFileUtilClass, JFileUtil>) end;

  JNetworkUtilClass = interface(JObjectClass)
    ['{9CECA26B-C5B6-43DB-AA16-2BE7AFD411A2}']
    {class} function init: JNetworkUtil; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/internal/util/NetworkUtil')]
  JNetworkUtil = interface(JObject)
    ['{3A9F1ABB-E33C-4FFD-A2C1-6F411BE8CEC0}']
    function postJsonToUrl(P1: JString; P2: JString): Integer; cdecl;
  end;
  TJNetworkUtil = class(TJavaGenericImport<JNetworkUtilClass, JNetworkUtil>) end;

  JMyoDeviceListAdapterClass = interface(JBaseAdapterClass)
    ['{E8D01FCA-91B9-45FD-8257-75676653D959}']
    {class} function init: JMyoDeviceListAdapter; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter')]
  JMyoDeviceListAdapter = interface(JBaseAdapter)
    ['{6916C594-ED4B-4DC6-A310-9E5DC69ECCC8}']
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
    ['{3E11EC99-1FF1-40A6-932A-0EB3AC4DAA30}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$1')]
  JMyoDeviceListAdapter_1 = interface(JObject)
    ['{04789B02-EB88-4706-9659-D740ECBA9818}']
  end;
  TJMyoDeviceListAdapter_1 = class(TJavaGenericImport<JMyoDeviceListAdapter_1Class, JMyoDeviceListAdapter_1>) end;

  JMyoDeviceListAdapter_ItemClass = interface(JObjectClass)
    ['{6F3F87AB-1AC7-4531-92B7-F2874855EAC1}']
    {class} function init(P1: JMyoDeviceListAdapter; P2: JMyo; P3: Integer): JMyoDeviceListAdapter_Item; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$Item')]
  JMyoDeviceListAdapter_Item = interface(JObject)
    ['{5E490BFA-EB56-43CD-8140-7A84A94413A2}']
  end;
  TJMyoDeviceListAdapter_Item = class(TJavaGenericImport<JMyoDeviceListAdapter_ItemClass, JMyoDeviceListAdapter_Item>) end;

  JMyoDeviceListAdapter_RssiComparatorClass = interface(JObjectClass)
    ['{969458DE-C949-46B0-8BCB-5C60F95F7DFA}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$RssiComparator')]
  JMyoDeviceListAdapter_RssiComparator = interface(JObject)
    ['{0AE24DD2-6AB5-4370-A721-31BF8206B6D7}']
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;
    function compare(P1: JMyoDeviceListAdapter_Item; P2: JMyoDeviceListAdapter_Item): Integer; cdecl; overload;
    function equals(P1: JObject): Boolean; cdecl;
  end;
  TJMyoDeviceListAdapter_RssiComparator = class(TJavaGenericImport<JMyoDeviceListAdapter_RssiComparatorClass, JMyoDeviceListAdapter_RssiComparator>) end;

  JMyoDeviceListAdapter_ViewHolderClass = interface(JObjectClass)
    ['{B8D5B121-D1A2-4BF9-9109-EA02D88851ED}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/MyoDeviceListAdapter$ViewHolder')]
  JMyoDeviceListAdapter_ViewHolder = interface(JObject)
    ['{E77BB5C5-6342-4C51-9FB3-B539D6CBBA88}']
  end;
  TJMyoDeviceListAdapter_ViewHolder = class(TJavaGenericImport<JMyoDeviceListAdapter_ViewHolderClass, JMyoDeviceListAdapter_ViewHolder>) end;

  JScanActivityClass = interface(JActivityClass)
    ['{0A4B849D-3586-4899-8EBC-E8136656B5AF}']
    {class} function init: JScanActivity; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanActivity')]
  JScanActivity = interface(JActivity)
    ['{6BFB65D4-7E03-4D6C-9D80-C28E5E0AC3CD}']
  end;
  TJScanActivity = class(TJavaGenericImport<JScanActivityClass, JScanActivity>) end;

  JScanFragmentClass = interface(JFragmentClass)
    ['{3CBE3BB4-243B-412D-842A-191EB6D187FA}']
    {class} function init: JScanFragment; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanFragment')]
  JScanFragment = interface(JFragment)
    ['{31B92C10-0FC3-40D9-A465-20093426D220}']
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
    ['{300A29EC-58E8-4C3A-A537-3D1C56BCDED5}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/ScanFragment$1')]
  JScanFragment_1 = interface(JObject)
    ['{CD18BD57-D1F5-4EAA-A048-02C016C665CA}']
    procedure onItemClick(P1: JAdapterView; P2: JView; P3: Integer; P4: Int64); cdecl;
  end;
  TJScanFragment_1 = class(TJavaGenericImport<JScanFragment_1Class, JScanFragment_1>) end;

  Jscanner_ScannerClass = interface(JObjectClass)
    ['{F554F345-2EAC-4CFC-8B30-11B57A3B0A49}']
    {class} function init(P1: JBleManager; P2: JScanner_OnMyoScannedListener; P3: JScanner_OnMyoClickedListener): Jscanner_Scanner; cdecl;
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner')]
  Jscanner_Scanner = interface(JObject)
    ['{5A0FBBD0-FBDE-443B-BC34-2B5150454C7A}']
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
    ['{AF1EB005-C319-4C21-B2EB-153767CA0FA2}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$1')]
  JScanner_1 = interface(JObject)
    ['{CF1C2E2E-2C8F-4535-8A40-85CECDE6394F}']
    procedure run; cdecl;
  end;
  TJScanner_1 = class(TJavaGenericImport<JScanner_1Class, JScanner_1>) end;

  JScanner_2Class = interface(JObjectClass)
    ['{C91C31D7-614E-4E84-9A84-CDD59F4E4592}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$2')]
  JScanner_2 = interface(JObject)
    ['{3743E336-5C5C-4A99-9AF9-E50B74C0C295}']
    procedure run; cdecl;
  end;
  TJScanner_2 = class(TJavaGenericImport<JScanner_2Class, JScanner_2>) end;

  JScanner_OnMyoClickedListenerClass = interface(IJavaClass)
    ['{A0D1D552-8E1D-4F41-9DCC-38E515EB0E54}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnMyoClickedListener')]
  JScanner_OnMyoClickedListener = interface(IJavaInstance)
    ['{8689C591-78A1-417A-95A7-ECAD75E7B28F}']
    procedure onMyoClicked(P1: JMyo); cdecl;
  end;
  TJScanner_OnMyoClickedListener = class(TJavaGenericImport<JScanner_OnMyoClickedListenerClass, JScanner_OnMyoClickedListener>) end;

  JScanner_OnMyoScannedListenerClass = interface(IJavaClass)
    ['{DC76858B-AC57-4066-BA4B-22FD4C64E545}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnMyoScannedListener')]
  JScanner_OnMyoScannedListener = interface(IJavaInstance)
    ['{2A73BB8F-A7EC-464C-937B-F60D0250EB92}']
    function onMyoScanned(P1: Jble_Address; P2: Integer): JMyo; cdecl;
  end;
  TJScanner_OnMyoScannedListener = class(TJavaGenericImport<JScanner_OnMyoScannedListenerClass, JScanner_OnMyoScannedListener>) end;

  JScanner_OnScanningStartedListenerClass = interface(IJavaClass)
    ['{6D84F5D1-D5CE-4C54-99E2-7EC43E340C78}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$OnScanningStartedListener')]
  JScanner_OnScanningStartedListener = interface(IJavaInstance)
    ['{A5C1ABB8-0901-432A-84C2-59F9467F9909}']
    procedure onScanningStarted; cdecl;
    procedure onScanningStopped; cdecl;
  end;
  TJScanner_OnScanningStartedListener = class(TJavaGenericImport<JScanner_OnScanningStartedListenerClass, JScanner_OnScanningStartedListener>) end;

  JScanner_ScanCallbackClass = interface(JObjectClass)
    ['{FB282336-E85E-4B12-A9E5-72A629CF5DC0}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanCallback')]
  JScanner_ScanCallback = interface(JObject)
    ['{5A3F14F7-3875-4B06-982D-37461EF07CBA}']
    procedure onBleScan(P1: Jble_Address; P2: Integer; P3: JUUID); cdecl;
  end;
  TJScanner_ScanCallback = class(TJavaGenericImport<JScanner_ScanCallbackClass, JScanner_ScanCallback>) end;

  JScanCallback_1Class = interface(JObjectClass)
    ['{364B1618-ED32-488C-B58B-E9ECCC93507A}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanCallback$1')]
  JScanCallback_1 = interface(JObject)
    ['{FAE8B4E6-08B6-4DD0-9E15-8EBD67ACC96D}']
    procedure run; cdecl;
  end;
  TJScanCallback_1 = class(TJavaGenericImport<JScanCallback_1Class, JScanCallback_1>) end;

  JScanner_ScanListAdapterClass = interface(IJavaClass)
    ['{5E43DF3D-CC2E-46BB-A409-477FD4B86767}']
  end;

  [JavaSignature('com/thalmic/myo/scanner/Scanner$ScanListAdapter')]
  JScanner_ScanListAdapter = interface(IJavaInstance)
    ['{9C324601-8D5E-4FF8-BC53-9920070410C0}']
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
  TRegTypes.RegisterType('MyoAndroid.JAsyncTask', TypeInfo(JAsyncTask));
  TRegTypes.RegisterType('MyoAndroid.JAsyncTask_Status', TypeInfo(JAsyncTask_Status));
  TRegTypes.RegisterType('MyoAndroid.JPair', TypeInfo(JPair));
  TRegTypes.RegisterType('MyoAndroid.JProgressBar', TypeInfo(JProgressBar));
  TRegTypes.RegisterType('MyoAndroid.JAbstractDeviceListener', TypeInfo(JAbstractDeviceListener));
  TRegTypes.RegisterType('MyoAndroid.JArm', TypeInfo(JArm));
  TRegTypes.RegisterType('MyoAndroid.JArm_1', TypeInfo(JArm_1));
  TRegTypes.RegisterType('MyoAndroid.Jmyo_BuildConfig', TypeInfo(MyoAndroid.Jmyo_BuildConfig));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent', TypeInfo(MyoAndroid.JClassifierEvent));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent_ClassifierEventFormat', TypeInfo(MyoAndroid.JClassifierEvent_ClassifierEventFormat));
  TRegTypes.RegisterType('MyoAndroid.JClassifierEvent_Type', TypeInfo(MyoAndroid.JClassifierEvent_Type));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand', TypeInfo(MyoAndroid.JControlCommand));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_1', TypeInfo(MyoAndroid.JControlCommand_1));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_EmgMode', TypeInfo(MyoAndroid.JControlCommand_EmgMode));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_SetMode', TypeInfo(MyoAndroid.JControlCommand_SetMode));
  TRegTypes.RegisterType('MyoAndroid.JControlCommand_SetModeCustom', TypeInfo(MyoAndroid.JControlCommand_SetModeCustom));
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
  TRegTypes.RegisterType('MyoAndroid.JPose_1', TypeInfo(MyoAndroid.JPose_1));
  TRegTypes.RegisterType('MyoAndroid.JQuaternion', TypeInfo(MyoAndroid.JQuaternion));
  TRegTypes.RegisterType('MyoAndroid.JReporter', TypeInfo(MyoAndroid.JReporter));
  TRegTypes.RegisterType('MyoAndroid.JReporter_1', TypeInfo(MyoAndroid.JReporter_1));
  TRegTypes.RegisterType('MyoAndroid.JScanListener', TypeInfo(MyoAndroid.JScanListener));
  TRegTypes.RegisterType('MyoAndroid.JScanListener_1', TypeInfo(MyoAndroid.JScanListener_1));
  TRegTypes.RegisterType('MyoAndroid.JScanListener_ForcePairMyoChecker', TypeInfo(MyoAndroid.JScanListener_ForcePairMyoChecker));
  TRegTypes.RegisterType('MyoAndroid.JScanListener_ForcePairMyoCheckerImpl', TypeInfo(MyoAndroid.JScanListener_ForcePairMyoCheckerImpl));
  TRegTypes.RegisterType('MyoAndroid.JForcePairMyoCheckerImpl_1', TypeInfo(MyoAndroid.JForcePairMyoCheckerImpl_1));
  TRegTypes.RegisterType('MyoAndroid.JScanListener_PairMode', TypeInfo(MyoAndroid.JScanListener_PairMode));
  TRegTypes.RegisterType('MyoAndroid.JVector3', TypeInfo(MyoAndroid.JVector3));
  TRegTypes.RegisterType('MyoAndroid.JXDirection', TypeInfo(MyoAndroid.JXDirection));
  TRegTypes.RegisterType('MyoAndroid.JXDirection_1', TypeInfo(MyoAndroid.JXDirection_1));
  TRegTypes.RegisterType('MyoAndroid.Jble_Address', TypeInfo(MyoAndroid.Jble_Address));
  TRegTypes.RegisterType('MyoAndroid.JBleFactory', TypeInfo(MyoAndroid.JBleFactory));
  TRegTypes.RegisterType('MyoAndroid.JBleGatt', TypeInfo(MyoAndroid.JBleGatt));
  TRegTypes.RegisterType('MyoAndroid.JBleManager', TypeInfo(MyoAndroid.JBleManager));
  TRegTypes.RegisterType('MyoAndroid.JBleManager_BleScanCallback', TypeInfo(MyoAndroid.JBleManager_BleScanCallback));
  TRegTypes.RegisterType('MyoAndroid.JJBBleManager', TypeInfo(MyoAndroid.JJBBleManager));
  TRegTypes.RegisterType('MyoAndroid.JJBBleManager_1', TypeInfo(MyoAndroid.JJBBleManager_1));
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
  TRegTypes.RegisterType('MyoAndroid.JCammClassifier', TypeInfo(MyoAndroid.JCammClassifier));
  TRegTypes.RegisterType('MyoAndroid.JClassifier', TypeInfo(MyoAndroid.JClassifier));
  TRegTypes.RegisterType('MyoAndroid.JClassifier_PoseClassifier', TypeInfo(MyoAndroid.JClassifier_PoseClassifier));
  TRegTypes.RegisterType('MyoAndroid.JClassifier_TrainingData', TypeInfo(MyoAndroid.JClassifier_TrainingData));
  TRegTypes.RegisterType('MyoAndroid.JVectorClassifier', TypeInfo(MyoAndroid.JVectorClassifier));
  TRegTypes.RegisterType('MyoAndroid.JVectorClassifierStatePtrs', TypeInfo(MyoAndroid.JVectorClassifierStatePtrs));
  TRegTypes.RegisterType('MyoAndroid.JByteUtil', TypeInfo(MyoAndroid.JByteUtil));
  TRegTypes.RegisterType('MyoAndroid.JFileUtil', TypeInfo(MyoAndroid.JFileUtil));
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


