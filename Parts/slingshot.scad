$fn = 50;

module shaft() {
  cylinder (r=7.5, h=80);
}

module arms(side, connector_rad) {
   arm_rad = 5;
   arm_len = 70;
   mirror(v=[side,0,0]) {
   // arm 1
    rotate (a=140,v=[0,1,0]) {
      difference() {
        cylinder (r=arm_rad, h=arm_len);
        translate([-arm_rad*1.5,-arm_rad,arm_len-6])
          difference() {
           rotate(a=45, v=[0,1,0])
            cube([arm_rad,arm_rad*2,arm_rad]);
           translate([0,0,-arm_rad])
             cube([arm_rad*2,arm_rad*2,arm_rad]);
          }
      }
    }
    translate([0.5,0,12])
      rotate(a=163,v=[0,1,0])
        cylinder (r=connector_rad, h=20);
   }
 }

module print_shaft() {
  difference () {
    shaft();
    arms(0, 3);
    arms(1, 3);
  }
}

module print_arm0() {
  difference() {
     arms(0, 2.5);
     translate([-30,-5,-10])
       cube([30,30,30]);
  }
}

module print_arm1() {
  difference() {
     arms(1, 2.5);
     translate([0,-5,-10])
       cube([30,30,30]);
  }
}

print_shaft();
print_arm0();
print_arm1();

    