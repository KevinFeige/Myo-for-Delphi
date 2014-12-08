unit MyoiOS;

interface

uses
  iOSApi.Foundation;

type
  TLMHUB = interface(NSObject)
  ['{ECEC50FA-6A4A-4DAE-9B23-A59A7C2CACC1}']
    procedure attachToAdjacent; cdecl;
  end;

  TLMMyo = interface(NSObject)
  end;

implementation

end.
