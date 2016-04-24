
use <M.scad>;
use <S.scad>;


module paddle() {
    or = 50;
    t1 = 1;
    t2 = 2;

    bw = 30;
    bh = 30;
    bt = t2;

    fd = 20;

    // base
    translate([-bw/2, -or-bh+5])
        cube([bw, bh, bt]);

    // foot
    translate([-bw/2, -or-bh+5])
        rotate([-5,0,0])
        translate([0,-0.2,0.2])
        cube([bw, bt, fd]);

    // fillet
    hull() {
        // base
        translate([-bt/2, -or-bh+5])
            cube([bt, bh, bt]);

        // foot
        translate([-bt/2, -or-bh+5])
            rotate([-5,0,0])
            translate([0,-0.2,0.2])
            cube([bt, bt, fd]);
    }

    // rim
    linear_extrude(t2)
        difference() {
            $fn=64;
            circle(or);
            circle(or - 5);
        }


    // supports
    for (i=[0:7])
        rotate([0,0, i*360/8])
        translate([-or, -1.5, 0])
        cube([18, 3, t1]);

    // diagonal long support
    rotate([0,0,45])
        translate([-or, -1.5, 0])
        cube([2*or, 3, t1]);


    // logo
    linear_extrude(t2) {
        translate([0,0,-1])
            scale([0.6,0.6,1])
                Logo_S();

        translate([0,0,-1])
            scale([0.6,0.6,1])
            Logo_M();
    }
}





paddle();
