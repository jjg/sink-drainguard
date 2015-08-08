cap_diameter = 31.58;
cap_thickness = 2.54;
drain_hole_diameter = 4;
tailpipe_length = 20;
design_version = "V1";

difference(){

	// main body
    union(){
        cylinder(r1=cap_diameter/2,r2=cap_diameter/2-.5, h=cap_thickness,$fn=cap_diameter*10);
        
        cylinder(r=cap_diameter/4,h=tailpipe_length);
    }
    
	// watermark
    rotate([0,180,0]){
        translate([-3,4,-1]){
            linear_extrude(height = 10){
               text(design_version,size=4);
            }
        }
    }

	// center hole
	translate([0,0,-1]){
		cylinder(r=cap_diameter/9, h=tailpipe_length+2,$fn=(cap_diameter*10)/10);
	}
    
    // tailpipe split
    translate([-cap_diameter/4,-((cap_diameter/8)+.5)/2,cap_thickness]){
        #cube([cap_diameter/2,(cap_diameter/8)+.5,tailpipe_length+2]);
    }
/*
	// keyhole
	translate([-cap_diameter/4,-((cap_diameter/8)+.5)/2,-1]){
		cube([cap_diameter/2,(cap_diameter/8)+.5,cap_thickness+2]);
	}
*/
	// ring of holes
	for(i=[0:10]){
		rotate(i*360/10, [0,0,1]){
			translate([11,0,-1]){
					cylinder(r=drain_hole_diameter/2,h=cap_thickness+2,$fn=15);
			}
		}
	}
}
