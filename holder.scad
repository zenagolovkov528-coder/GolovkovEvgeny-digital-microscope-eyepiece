len_phone = 145;
width_phone = 56;
d_screw_m4 = 4.5;
thickness_holder = 4;

holder_set();
// horizontal_block(20);
// vertical_block(len_phone);

module holder_set() {
    horizontal_block(len_block=width_phone, offset_vertical=10);
    vertical_block(len_block=len_phone);
}

module vertical_block(len_block) {
    append = 15;
    len_block = len_block + append;
    difference() {
        hull() {
            //translate([0, -len_phone/2, 0])
            translate([0, -len_block/2, 0])
                cylinder(d=9, h=thickness_holder, center=true, $fn=32);
            //translate([0, len_phone/2, 0])
            translate([0, len_block/2, 0])
                cylinder(d=9, h=thickness_holder, center=true, $fn=32);
        }
        color("red")
        hull() {
            // translate([0, -len_phone/2, 0])
            translate([0, -len_block/2, 0])
                cylinder(d=d_screw_m4, h=thickness_holder+2, center=true, $fn=32);
            // translate([0, len_phone/2, 0])
            translate([0, len_block/2, 0])
                cylinder(d=d_screw_m4, h=thickness_holder+2, center=true, $fn=32);
        }
    }
}

module horizontal_block(len_block, offset_vertical) {
    append = 15;
    len_block = len_block + append;
    translate([0, offset_vertical, 0])
        cylinder(d=20, h=thickness_holder, center=true, $fn=32);
    difference() {
        hull() {
            translate([len_block/2, offset_vertical, 0])
                cylinder(d=9, h=thickness_holder, center=true, $fn=32);
            translate([-len_block/2, offset_vertical, 0])
                cylinder(d=9, h=thickness_holder, center=true, $fn=32);
        }
        color("red")
        hull() {
            translate([len_block/2, offset_vertical, 0])
                cylinder(d=d_screw_m4, h=thickness_holder+2, center=true, $fn=32);
            translate([-len_block/2, offset_vertical, 0])
                cylinder(d=d_screw_m4, h=thickness_holder+2, center=true, $fn=32);
        }
    }
}