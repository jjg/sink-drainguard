cap_diameter = 31.58;
cap_thickness = 2.54;

difference(){
	cylinder(r1=cap_diameter/2,r2=cap_diameter/2-.5, h=cap_thickness,$fn=cap_diameter*10);

	// center hole
	translate([0,0,-1]){
		cylinder(r=cap_diameter/10, h=cap_thickness+2,$fn=(cap_diameter*10)/10);
	}

	// keyhole
	translate([-cap_diameter/4,-(cap_diameter/8)/2,-1]){
		#cube([cap_diameter/2,cap_diameter/8,cap_thickness+2]);
	}
}
