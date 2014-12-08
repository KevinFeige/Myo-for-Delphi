unit MyoRegister;

interface

procedure Register;

implementation

uses
  Classes, MyoComponent;

procedure Register;
begin
  RegisterComponents('Myo',[TMyo]);
end;

end.
