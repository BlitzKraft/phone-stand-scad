//Units in mm
// Physical structure. 

$fn = 50;
module stand() {
	rotate([90, 0, 0]) 
	union()
	{
		hull() { // Base of the stand 
			cylinder(r=5, h=80);
			translate([-100, 0, 0]) cylinder(r=5, h=80);
		}
		hull() { // Where the phone rests
			scale([1.8, 1, 1])
			cylinder(r=5, h=80);
			translate([-90, 150, 0]) cylinder(r=5, h=80);
		}
	}
}

difference() {
	union() { // Most of the solid part
		stand();
		rotate([0, 59, 0]) 
		translate([-10, -40, 15]) {
			cube([10, 80, 20], center=true); // Resting foot
			rotate([90, 10, 0])	
			translate([-13, 6.55, 0])
			difference() {
				hull() { // Lip to preven phone from sliding off
					cylinder(r = 1, h=80, center=true);
					translate([10, 0, 0])
					cylinder(r = 3, h = 80, center=true);
				}
				rotate([0, -90, 0])     // This will create the inclined slot in the lip
				rotate([0, 0, 45])
				linear_extrude(height=10, center=true, scale=4)
				circle(5, $fn=4);
			}
		}
	}
	union() { // Negative space assemblies - charging base, LEDs and cord channels.
		color("cyan")
		rotate([0, 59, 0])
		translate([-80, -40, -5])
		union() {
			cylinder(r=35, h=14); // Charging base - dimensions measured from the charger
			// TODO: Simplify the following transformations. 
			translate([33, -6, -2])
			rotate([0, 10, 0])
			translate([0, 6, 6])
			rotate([0, 90, 0])
			cylinder(r=6, h=100); // Charging cable passes through here
			translate([-132, -6, 22])
			rotate([0, 12, 0])
			cube([100, 12, 12]); // Channel for the LED to shine through
		}
		translate([-200, -40, -4])
		rotate([0, 90, 0])
		union() { //channel for cable on base
			cylinder(r=2, h=190); // Charging cord will fit here
			cube([2, 2, 190]); // To make the channel fit the cord
		}
	}
}

module phone() {
	hull() {
		// Phone dims - 72mm x 138mm x 10mm
		sphere(r=5);
		translate([0, 62, 0])
		sphere(r=5);
		translate([-128, 62, 0])
		sphere(r=5);
		translate([-128, 0, 0])
		sphere(r=5);
	}
}

/*
translate([0, -72, 25])
rotate([0, 59, 0])
%phone();
