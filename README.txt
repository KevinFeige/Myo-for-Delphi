Source code and examples using a Thalmic Myo device 
with Embarcadero Delphi Studio XE7.

https://github.com/davidberneda/Myo-for-Delphi

Install:
--------

1) Open the Myo_Projects project group, 
or just the Source\Myo.dpk and Source\DclMyo.dpk package projects.

2) Compile the Myo.dpk package.

3) Compile and install the design-time DclMyo.dpk package.

This will add a new TMyo component at ide toolbar, valid
for both VCL and Firemonkey frameworks.

Myo SDK:
--------

For Windows: 

Copy the "Myo_SDK\Windows" dlls to a folder that is visible
to Windows PATH environment variable, for example:

myo32.dll   ->  c:\windows\syswow64
myo64.dll   ->  c:\windows\system32


Usage:
------

Simply set the Myo1.Active property to True and start a 
loop to retrieve the Myo device events:

 repeat
   Myo1.Run(1000 div 50); // <-- We want 50 samples-per-second
   Application.ProcessMessages;
 until Application.Terminated;

See the included examples for more info about obtaining and
plotting the Myo motion/orientation values and poses.

------------

@davidberneda
david@steema.com

