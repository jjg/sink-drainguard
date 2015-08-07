cap_diameter = 31.58;
cap_thickness = 2.54;
drain_hole_diameter = 4;
key_height = 25;
design_version = "V1";

difference(){
  union(){

  	// main body
	cylinder(r=cap_diameter/2-.5, h=cap_thickness,$fn=cap_diameter*10);

	// center shaft
	translate([0,0,0]){
		cylinder(r=cap_diameter/10.25,h=key_height,$fn=(cap_diameter*10)/10);
	}

	// lower key
	translate([-cap_diameter/4,-(cap_diameter/8)/2,cap_thickness*2]){
		cube([cap_diameter/2,cap_diameter/8,cap_thickness]);
	}

	// upper key
	rotate([0,0,90]){
		translate([-cap_diameter/4,-(cap_diameter/8)/2,key_height-cap_thickness]){
			cube([cap_diameter/2,cap_diameter/8,cap_thickness]);
		}
	}

}
  translate([6/2,-4/2,1]){
  rotate([0,180,0]){
      linear_extrude(height=2){
        text(design_version, size=4);
      }
  }
  }
}