//Units in mm
// Physical structure. 

$fn = 50;
module stand() {
	rotate([90, 0, 0]) 
	union()
	{
		hull()
		{
			cylinder(r=5, h=80);
			translate([-100, 0, 0]) cylinder(r=5, h=80);
		}
		hull() {
			scale([1.8, 1, 1])
			cylinder(r=5, h=80);
			translate([-90, 150, 0]) cylinder(r=5, h=80);
		}
	}
}

difference() {
	union() {
		stand();
		rotate([0, 59, 0])
		translate([-10, -40, 15])
		cube([10, 80, 20], center=true);
	}
	union() {
		color("cyan")
		rotate([0, 59, 0])
		translate([-80, -40, -5])
		union() {
			cylinder(r=35, h=14);
			translate([33, -6, -2])
			rotate([0, 10, 0])
			cube([100, 12, 12]);
			translate([-132, -6, 22])
			rotate([0, 12, 0])
			cube([100, 12, 12]);
		}
		translate([-200, -40, -4])
		rotate([0, 90, 0])
		union() {
			cylinder(r=2, h=500);
			cube([2, 2, 500]);
		}
	}
}

