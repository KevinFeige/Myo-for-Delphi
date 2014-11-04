object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Myo for Delphi'
  ClientHeight = 475
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 475
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 409
    object LArm: TLabel
      Left = 16
      Top = 144
      Width = 70
      Height = 13
      Caption = 'Arm: Unknown'
    end
    object Label2: TLabel
      Left = 16
      Top = 96
      Width = 39
      Height = 13
      Caption = 'Version:'
    end
    object LVersion: TLabel
      Left = 16
      Top = 115
      Width = 3
      Height = 13
    end
    object LPaired: TLabel
      Left = 16
      Top = 180
      Width = 3
      Height = 13
    end
    object BConnect: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Connect'
      TabOrder = 0
      OnClick = BConnectClick
    end
    object BVibrate: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Vibrate'
      Enabled = False
      TabOrder = 1
      OnClick = BVibrateClick
    end
    object CBLegends: TCheckBox
      Left = 16
      Top = 240
      Width = 97
      Height = 17
      Caption = '&Legends'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CBLegendsClick
    end
    object LiveCharts: TCheckBox
      Left = 16
      Top = 217
      Width = 97
      Height = 17
      Caption = 'Live Charts'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 137
    Top = 0
    Width = 585
    Height = 475
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 280
    ExplicitTop = 208
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Chart2: TChart
      Left = 0
      Top = 193
      Width = 585
      Height = 273
      Legend.Alignment = laTop
      Legend.Title.Alignment = taCenter
      Legend.Title.Text.Strings = (
        'Gyroscope')
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      View3D = False
      Align = alTop
      TabOrder = 0
      ExplicitTop = 88
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object GyroX: TFastLineSeries
        Title = 'X'
        DrawStyle = flAll
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object GyroY: TFastLineSeries
        Title = 'Y'
        DrawStyle = flAll
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object GyroZ: TFastLineSeries
        Title = 'Z'
        DrawStyle = flAll
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart1: TChart
      Left = 0
      Top = 0
      Width = 585
      Height = 193
      Legend.Alignment = laTop
      Legend.Title.Alignment = taCenter
      Legend.Title.Text.Strings = (
        'Accelerometer')
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      View3D = False
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 6
      ExplicitTop = -29
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object AccelX: TFastLineSeries
        Title = 'X'
        DrawStyle = flAll
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object AccelY: TFastLineSeries
        Title = 'Y'
        DrawStyle = flAll
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object AccelZ: TFastLineSeries
        Title = 'Z'
        DrawStyle = flAll
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart3: TChart
      Left = 0
      Top = 466
      Width = 585
      Height = 273
      Legend.Alignment = laTop
      Legend.Title.Alignment = taCenter
      Legend.Title.Text.Strings = (
        'Orientation')
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      View3D = False
      Align = alTop
      TabOrder = 2
      ExplicitTop = 8
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object OrientX: TFastLineSeries
        Title = 'X'
        DrawStyle = flAll
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object OrientY: TFastLineSeries
        Title = 'Y'
        DrawStyle = flAll
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object OrientZ: TFastLineSeries
        Title = 'Z'
        DrawStyle = flAll
        LinePen.Color = 1330417
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object OrientW: TFastLineSeries
        Title = 'W'
        DrawStyle = flAll
        LinePen.Color = 11048782
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
  end
  object Myo1: TMyo
    OnAccelerometer = Myo1Accelerometer
    OnArmLost = Myo1ArmLost
    OnArmRecognized = Myo1ArmRecognized
    OnConnect = Myo1Connect
    OnDisconnect = Myo1Disconnect
    OnGyroscope = Myo1Gyroscope
    OnOrientation = Myo1Orientation
    OnPair = Myo1Pair
    OnPose = Myo1Pose
    OnRssi = Myo1Rssi
    OnUnpair = Myo1Unpair
    Left = 224
    Top = 136
  end
end
