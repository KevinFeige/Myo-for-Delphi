unit MyoRegister;

interface

procedure Register;

implementation

uses
  Classes, Myo;

procedure Register;
begin
  RegisterComponents('Myo',[TMyo]);
end;

end.
