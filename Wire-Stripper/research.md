##Goals
Speed : Faster than manual
Accuracy : +/-0.25mm should be good 
Cost : $200-$250 per machine.
Materials : Mix of wood, RepRapped parts, and hardware.

##Problem Analysis
###Axioms
-Pull wire off the spool
-Straighten wire
-Measure the length of wire pulled
-Measure force on wire. (optional, but might be useful) 
-Cut the wire
-Strip the wire ends
-Bonus: Twist wire ends

##Possible road map
v0.1 - Develop machine to measure, cut, and strip wire, plastic tubing, and filament.
v0.2 - Create a user interface and batch run capabilities using Arduino, LCD screen, and Ethernet. 

##Possibly Useful Parts

###Motors
http://www.pololu.com/catalog/category/116
	One of these with encoder would probably provide enough torque/resolution only going forward. Backlash?

###Drive Rollers
https://sdp-si.com/eStore/PartDetail.asp?Opener=Group&PartID=71799&GroupID=1007

###Encoders

###Cutting Mechanism
http://www.aliexpress.com/item/freeshipping-automatic-wire-stripping-machine-spare-blades/457058509.html


##Linkages
http://en.wikipedia.org/wiki/Chebyshev_linkage
http://en.wikipedia.org/wiki/Hoekens_linkage --Use grashof link as cam.
http://en.wikipedia.org/wiki/Watts_linkage -- Simpler.

##Commercial Machines
https://www.youtube.com/watch?v=02qR8HAzS8o
http://www.topsmate.com/wire%20cutting%20machine.htm
http://www.aliexpress.com/wholesale/wholesale-automatic-wire-cutting-stripping-machine.html

##Software
###Controlling steppers
Hack Marlin?

This would suffice probably, especially since we want zero 'jerk' in stepper motion
http://www.open.com.au/mikem/arduino/AccelStepper/

###Keypad

