// =====================================================================
//  BeeCam field enclosure  (v2)
//  Raspberry Pi Zero + Pimoroni night-vision camera (CAM008, 70 deg)
//  + Adafruit TSL2591 light sensor + external SHT31 ("HT31") probe
//  For hot, wet, humid deployments (rain-forest pollinator monitoring)
//
//  All dimensions in mm. Fully parametric.
//
//  v2 changes
//    - camera + IR LEDs mounted vertically (LED / lens / LED) behind a
//      window column with a separate window for each, so LED light can't
//      bounce into the lens
//    - cam_cowl: light baffle that clamps the camera board to the sled
//      and boxes the lens and each LED in its own chamber
//    - back window + internal mount for the TSL2591 light sensor
//    - strap loops moved to the side (mount_angle) so the back window
//      isn't facing the post/tree
//
//  Parts (set `part`, F6, export STL):
//    body, lid, gel_cover, sled, cam_cowl, front_bezel, back_bezel,
//    probe_shield, plus views: assembly, exploded, section
//
//  Print orientation (PETG minimum, ASA preferred - NOT PLA):
//    body          upright, floor on the bed
//    lid           upside down (flat top on the bed)
//    gel_cover     flat
//    sled          standing on its bottom edge (add a brim)
//    cam_cowl      back face (PCB side) on the bed  - print in BLACK
//    front_bezel   back face on the bed
//    back_bezel    back face on the bed
//    probe_shield  upside down (roof on the bed)    - print in WHITE
//  >= 4 perimeters on the body and lid.
//
//  Hardware:
//    1x O-ring 2 mm cross-section (ID echoed in the console, ~60 mm)
//    2-3x PG7 cable glands (or M12; set gland_d) + blanking plug / vent
//    windows (perspex, 3 mm):  1x 25 mm disc (lens), 2x 18 mm (LEDs),
//                              1x 24 mm (light sensor)
//    1 mm closed-cell foam gasket rings under each window
//    6x M3 heat-set inserts + 6x M3x8 (bezels)
//    2x M3x16 (cowl to sled), 4x M2.5x5 (Pi), 4x M2.5x5 (light sensor),
//    3x M2.5x6 (gel cover)
// =====================================================================

part = "assembly"; // [assembly, exploded, section, body, lid, gel_cover, sled, cam_cowl, front_bezel, back_bezel, probe_shield]

/* [Quality] */
$fn    = 96;
th_fn  = 72;     // facets per thread turn

/* [Body] */
in_r      = 30;    // internal radius of the tube
wall      = 3.5;
floor_t   = 4;
body_h    = 120;   // floor underside -> top sealing rim
rim_in_r  = 29;    // inner radius of the top rim (wider sealing face)
rim_band  = 6;

/* [Thread] */
pitch        = 4;
th_depth     = 2;
th_len       = 12;         // lid skirt length (= 3 turns)
th_clear_r   = 0.5;        // radial clearance (increase if tight)
th_clear_ax  = 0.3;        // axial clearance per flank
th_root_w    = 0.55*pitch;
th_tip_w     = 0.25*pitch;

/* [Lid + seal] */
lid_wall   = 3.5;
lid_top_t  = 3;
pocket_r   = 24;     // silica-gel pocket
pocket_d   = 16;
oring_cs   = 2.0;
groove_w   = 2.7;
groove_d   = 1.5;
grip_ribs  = 30;

/* [Gel cover] */
cover_t       = 2;
cover_r       = 28.4;
cover_hole_d  = 3;
cover_hole_p  = 5;
cover_screw_r = 26.3;
cover_screw_pilot = 2.2;

/* [Front window column: LED / lens / LED] */
win_z        = 58;    // lens centre height
led_offset   = 25;    // lens centre -> each LED centre        MEASURE
pad_r        = 20;    // half-width of the flat window pad
boss_face_y  = 36;    // flat face of the pad (from tube axis)
win_t        = 3;     // window thickness (all windows)
gasket_t     = 1;     // closed-cell foam under each window
lens_win_d   = 25;
led_win_d    = 18;
lens_ap_r    = 9;     // clear hole through the wall behind each window
led_ap_r     = 7.5;
bezel_t      = 4;
bezel_screws = [[-16, -25], [16, -25], [-16, 25], [16, 25]]; // [x, z] from lens centre
insert_d     = 4.0;   // M3 heat-set insert hole
insert_depth = 6;
led_beam     = 90;    // full beam angle of the IR LEDs
hood_len     = 5;     // short hood round the lens: stops LED light hitting
                      // rain drops on the lens window (set 0 to remove)
brim_len     = 12;    // drip brim above the top LED
brim_span    = 140;
brim_t       = 2;

/* [Night-vision camera: Pimoroni CAM008] */
// Pimoroni only publish 72.6 x 24 mm overall. Measure yours and edit.
cam_len       = 72.6;  // along the LED axis (mounted vertically)    MEASURE
cam_w         = 24;    //                                            MEASURE
cam_pcb_t     = 1.6;
cam_depth     = 12;    // back of PCB -> front of lens               MEASURE
lens_holder_w = 9;     // square lens holder on the PCB              MEASURE
led_cav_r     = 7;     // clearance round each LED (and LDR if any)  MEASURE
comp_h        = 2;     // clearance for small parts on the PCB front
cam_dfov      = 75;    // 70 deg version. The 160 deg fisheye needs a dome window.
lens_r        = 2.5;   // radius of the lens front element
cowl_wall     = 2;
cowl_ear      = 6.5;   // screw ears at each end of the cowl

/* [Light sensor: Adafruit TSL2591, STEMMA QT 25.4 x 17.8] */
ls_z        = 34;      // sensor height on the back
ls_w        = 25.4;
ls_h        = 17.8;
ls_holes    = [[-10.16, -6.35], [10.16, -6.35], [-10.16, 6.35], [10.16, 6.35]]; // CHECK
ls_pad_y    = 26;      // internal flat pad face (from axis)
ls_win_d    = 24;
ls_boss_r   = 21;
ls_view     = 40;      // half-angle of the sensor's view cone
ls_screw_x  = 17.5;    // back-bezel screws at +/- this x

/* [Pi Zero] */
pi_w        = 30;
pi_l        = 65;
pi_t        = 1.4;
pi_hole_dx  = 23;
pi_hole_dz  = 58;
pi_standoff = 4;
pi_pilot    = 2.2;

/* [Sled] */
sled_t      = 3;
sled_half_w = 26;
ribbon_w    = 18;
rail_t      = 2.5;
rail_depth  = 2.5;
fit         = 0.3;

/* [Cable glands] */
gland_d   = 12.7;   // PG7 = 12.7, M12 = 12.2
gland_pos = [[-11, -14], [11, -14], [0, 15]];  // power, probe, vent/plug

/* [Strap loops] */
mount_angle = -90;   // -90 = left side, 90 = right side, 0 = back (blocks the light sensor)
strap_w     = 25;
strap_gap   = 4;
loop_t      = 3;
loop_w      = 44;
loop_z      = [30, 88];

/* [Probe shield] */
probe_d    = 16;     // measure your probe housing!
sh_r       = 30;
sh_h       = 55;
sh_wall    = 2;
sh_top_t   = 3;
sleeve_len = 30;

// ------------------------------------------------------------ derived
out_r        = in_r + wall;
lid_bore_r   = out_r + th_clear_r;
lid_out_r    = out_r + th_depth + th_clear_r + lid_wall;
lid_h        = th_len + pocket_d + lid_top_t;
lid_z        = body_h - th_len;
groove_mid_r = (rim_in_r + out_r)/2;
groove_in_r  = groove_mid_r - groove_w/2;
cowl_r       = rim_in_r - 0.2;          // cowl front must pass through the rim
lens_front_y = cowl_r - 1;
cam_back_y   = lens_front_y - cam_depth;
cowl_half_w  = cam_w/2 + cowl_wall;
cowl_L       = cam_len/2 + cowl_wall;
cb_y         = boss_face_y - (win_t + gasket_t - 0.5);  // counterbore floor
win_back_y   = cb_y + gasket_t - 0.5;
ls_face_y    = boss_face_y;                             // back pad face
ls_cb_y      = ls_face_y - (win_t + gasket_t - 0.5);
ls_sensor_y  = ls_pad_y + 0.5;                          // sensor surface
ls_d0        = ls_face_y - ls_sensor_y;
sled_top     = body_h - 4;
pi_top_z     = sled_top - 3;
pi_cz        = pi_top_z - pi_l/2;
pi_bot_z     = pi_top_z - pi_l;
rail_top     = body_h - rim_band - 1;
hood_ang     = cam_dfov/2 + 5;
led_half     = led_beam/2;
thread_z0    = lid_z - 3;
thread_z1    = body_h - 1.5;
th_phase     = ((thread_z0 - lid_z) % pitch + pitch) % pitch;
win_list     = [[0, lens_win_d, lens_ap_r],
                [ led_offset, led_win_d, led_ap_r],
                [-led_offset, led_win_d, led_ap_r]];   // [z offset, window d, hole r]

function fov_r(y)  = lens_r + (y - lens_front_y)*tan(hood_ang) + 1;   // y = world y
function led_r(z)  = led_ap_r + z*tan(led_half);                     // z from pad face
function brim_r(z) = led_ap_r + z*tan(led_half + 3) + 0.5;
function ls_r(z)   = 2.5 + (z + ls_d0)*tan(ls_view);                 // z from back pad face

echo(str("O-ring: ", oring_cs, " mm cross-section, ID about ", round(2*groove_in_r), " mm"));
echo(str("Closed size: OD ", 2*lid_out_r, " x ", body_h + lid_h - th_len, " mm"));
echo(str("Lens-to-window gap ", win_back_y - lens_front_y, " mm"));

assert(cowl_r < rim_in_r, "cowl would not pass through the rim");
assert(cover_r + 0.3 < rim_in_r, "gel cover recess would break the sealing face");
assert(win_z - led_offset - pad_r*sqrt(2) > 0, "window pad runs past the bottom");
assert(win_z + led_offset + pad_r < thread_z0 - 1, "window pad runs into the thread");
assert(lens_ap_r >= fov_r(cb_y), "lens hole would vignette the camera");
assert(fov_r(boss_face_y) < lens_win_d/2 - 0.5, "bezel would not clamp the lens window");
assert(led_ap_r < led_win_d/2 - 1, "bezel would not clamp the LED windows");
assert(lens_win_d/2 + led_win_d/2 + 2 < led_offset, "lens and LED counterbores overlap");
assert(ls_r(0) < ls_win_d/2 - 0.5, "back bezel would not clamp the sensor window");
assert(ls_z - ls_boss_r*sqrt(2) > 0, "light-sensor pad runs past the bottom");
assert(th_root_w + 2*th_clear_ax < pitch, "thread teeth overlap");

// ============================================================ helpers
module ring(r_in, r_out, h) {
    difference() {
        cylinder(r=r_out, h=h);
        translate([0, 0, -1]) cylinder(r=r_in, h=h+2);
    }
}

// 2D teardrop: point at -y (= down in the window frames), 45 deg flanks
module teardrop2d(r) {
    hull() {
        circle(r=r);
        translate([0, -r*sqrt(2)]) square(0.01, center=true);
    }
}

// front window column outline (obround), optional teardrop tip
module pad2d(tip=true) {
    hull() {
        for (s = [-1, 1]) translate([0, s*led_offset]) circle(r=pad_r);
        if (tip) translate([0, -led_offset - pad_r*sqrt(2)]) square(0.01, center=true);
    }
}

// Local frame on a window axis: local x = world x (mirrored on the back),
// local y = world up, local z = outward. Origin on the pad face.
module wframe(face_y, zc, back=false) {
    rotate([0, 0, back ? 180 : 0])
        translate([0, face_y, zc]) rotate([-90, 0, 0]) mirror([0, 1, 0]) children();
}
module window_frame(face_y=boss_face_y) { wframe(face_y, win_z) children(); }
module back_frame(face_y=ls_face_y)     { wframe(face_y, ls_z, true) children(); }

// Single-start trapezoidal helix (a solid "tooth" swept along a helix).
module thread_helix(r, depth, p, length, w_root, w_tip, ovl=0.4) {
    n = ceil(length/p*th_fn);
    prof = [[r-ovl, -w_root/2], [r+depth, -w_tip/2],
            [r+depth,  w_tip/2], [r-ovl,  w_root/2]];
    pts = [for (i=[0:n]) let(a=360*i/th_fn, z=p*i/th_fn)
              for (q=prof) [q[0]*cos(a), q[0]*sin(a), z + q[1]]];
    // wound clockwise seen from outside (OpenSCAD convention)
    sides = [for (i=[0:n-1]) for (j=[0:3])
                let(a=i*4+j, b=(i+1)*4+j, c=(i+1)*4+(j+1)%4, d=i*4+(j+1)%4)
                each [[a, c, b], [a, d, c]]];
    caps = [[0, 2, 1], [0, 3, 2], [n*4+3, n*4+1, n*4+2], [n*4+3, n*4, n*4+1]];
    polyhedron(points=pts, faces=concat(sides, caps), convexity=10);
}

// ============================================================ body
module male_thread() {
    L = thread_z1 - thread_z0;
    R = out_r + th_depth;
    translate([0, 0, thread_z0]) intersection() {
        translate([0, 0, -pitch])
            thread_helix(out_r, th_depth, pitch, L + 2*pitch, th_root_w, th_tip_w);
        rotate_extrude() polygon([[0, 0], [out_r-0.4, 0], [R, th_depth+0.4],
                                  [R, L-th_depth-0.4], [out_r-0.4, L], [0, L]]);
    }
}

module front_pad() {
    window_frame() translate([0, 0, -boss_face_y]) linear_extrude(boss_face_y) pad2d(true);
}

module back_pad() {
    back_frame() translate([0, 0, -ls_face_y]) linear_extrude(ls_face_y) teardrop2d(ls_boss_r);
}

module front_cuts() {
    window_frame() {
        for (w = win_list) translate([0, w[0], 0]) {
            translate([0, 0, -boss_face_y]) cylinder(r=w[2], h=boss_face_y + 1);
            translate([0, 0, -(boss_face_y - cb_y)]) cylinder(d=w[1] + 0.5, h=20);
        }
        for (s = bezel_screws) translate([s[0], s[1], -insert_depth])
            cylinder(d=insert_d, h=insert_depth + 1, $fn=24);
    }
}

// flat pad inside the back wall for the light-sensor board
module ls_inner_pad() {
    intersection() {
        translate([-16, -(in_r + 1), ls_z - 11.5]) cube([32, in_r + 1 - ls_pad_y, 23]);
        cylinder(r=in_r + 0.5, h=body_h);
    }
}

module back_cuts() {
    back_frame() {
        // window counterbore
        translate([0, 0, -(ls_face_y - ls_cb_y)]) cylinder(d=ls_win_d + 0.5, h=20);
        // view cone from the sensor out through pad + wall
        translate([0, 0, -ls_d0 - 0.01]) cylinder(r1=ls_r(-ls_d0), r2=ls_r(1), h=ls_d0 + 1);
        // inserts for the back bezel
        for (sx = [-1, 1]) translate([sx*ls_screw_x, 0, -insert_depth])
            cylinder(d=insert_d, h=insert_depth + 1, $fn=24);
    }
    translate([0, -ls_pad_y, ls_z]) {
        // shallow recess for parts on the sensor side, leaving 4 corner pads
        difference() {
            translate([-ls_w/2 - 0.3, -1.2, -ls_h/2 - 0.3]) cube([ls_w + 0.6, 1.21, ls_h + 0.6]);
            for (h = ls_holes) translate([h[0], 0.1, h[1]]) rotate([90, 0, 0])
                cylinder(r=2.4, h=2, $fn=20);
        }
        // STEMMA QT connector pockets at each end
        for (sx = [-1, 1]) translate([sx*(ls_w/2 - 2.5) - 3, -4, -3.5]) cube([6, 4.01, 7]);
        // M2.5 pilots
        for (h = ls_holes) translate([h[0], 0.01, h[1]]) rotate([90, 0, 0])
            cylinder(d=2.2, h=5, $fn=16);
    }
}

module strap_loop(zc) {
    loop_h = strap_w + 4;
    y_out  = -(out_r + strap_gap + loop_t);
    translate([-loop_w/2, y_out, zc - loop_h/2]) cube([loop_w, loop_t, loop_h]);
    for (sx = [-1, 1])
        translate([sx > 0 ? loop_w/2 - 5 : -loop_w/2, y_out, zc - loop_h/2])
            cube([5, -y_out - 18, loop_h]);
}

module rails() {
    for (mx = [0, 1]) mirror([mx, 0, 0])
        for (sy = [-1, 1])
            intersection() {
                translate([sled_half_w - rail_depth,
                           sy > 0 ? sled_t/2 + fit : -sled_t/2 - fit - rail_t,
                           floor_t])
                    cube([in_r + 1 - (sled_half_w - rail_depth), rail_t, rail_top - floor_t]);
                cylinder(r=in_r + 0.5, h=body_h);
            }
}

module body() {
    difference() {
        union() {
            difference() {
                union() {
                    cylinder(r=out_r, h=body_h);
                    male_thread();
                    front_pad();
                    back_pad();
                    rotate(mount_angle) for (z = loop_z) strap_loop(z);
                }
                translate([0, 0, floor_t]) cylinder(r=in_r, h=body_h - rim_band - floor_t + 0.01);
                translate([0, 0, body_h - rim_band]) cylinder(r=rim_in_r, h=rim_band + 1);
                translate([0, 0, body_h - rim_band - (in_r - rim_in_r)])
                    cylinder(r1=in_r, r2=rim_in_r, h=in_r - rim_in_r + 0.01);
            }
            rails();
            ls_inner_pad();
        }
        front_cuts();
        back_cuts();
        for (p = gland_pos) translate([p[0], p[1], -1]) cylinder(d=gland_d, h=floor_t + 2);
    }
}

// ============================================================ lid
module female_thread_cutter() {
    intersection() {
        translate([0, 0, -pitch + th_phase])
            thread_helix(lid_bore_r, th_depth, pitch, th_len + 2*pitch,
                         th_root_w + 2*th_clear_ax, th_tip_w + 2*th_clear_ax, ovl=0.5);
        translate([0, 0, -1]) cylinder(r=lid_out_r, h=th_len + 1);
    }
}

module lid() {
    difference() {
        union() {
            cylinder(r=lid_out_r, h=lid_h);
            for (i = [0:grip_ribs-1]) rotate(i*360/grip_ribs)
                translate([lid_out_r, 0, 1]) cylinder(r=1.2, h=lid_h - 2, $fn=12);
        }
        translate([0, 0, -1]) cylinder(r=lid_bore_r, h=th_len + 1);
        female_thread_cutter();
        translate([0, 0, -0.01])
            cylinder(r1=lid_bore_r + th_depth + 0.8, r2=lid_bore_r - 0.2, h=th_depth + 1);
        translate([0, 0, th_len - 0.01]) ring(groove_in_r, groove_in_r + groove_w, groove_d + 0.01);
        translate([0, 0, th_len - 0.01]) cylinder(r=cover_r + 0.3, h=cover_t + 0.01);
        translate([0, 0, th_len - 0.01]) cylinder(r=pocket_r, h=pocket_d + 0.01);
        for (a = [90, 210, 330]) rotate(a)
            translate([cover_screw_r, 0, th_len]) cylinder(d=cover_screw_pilot, h=8, $fn=16);
    }
}

// ============================================================ gel cover
module gel_cover() {
    difference() {
        cylinder(r=cover_r, h=cover_t);
        for (row = [-10:10]) for (col = [-10:10]) {
            x = col*cover_hole_p + (row % 2 == 0 ? 0 : cover_hole_p/2);
            y = row*cover_hole_p*sqrt(3)/2;
            if (norm([x, y]) < pocket_r - 2.5)
                translate([x, y, -1]) cylinder(d=cover_hole_d, h=cover_t + 2, $fn=16);
        }
        for (a = [90, 210, 330]) rotate(a) translate([cover_screw_r, 0, -1])
            cylinder(d=2.9, h=cover_t + 2, $fn=16);
    }
}

// ============================================================ sled
module sled() {
    z0 = floor_t;
    difference() {
        union() {
            translate([-sled_half_w, -sled_t/2, z0]) cube([2*sled_half_w, sled_t, sled_top - z0]);
            translate([-10, -sled_t/2, sled_top - 2]) cube([20, sled_t, 5]);   // pull tab
        }
        // ribbon slot behind the camera
        translate([-ribbon_w/2, -sled_t, win_z - 5]) cube([ribbon_w, 2*sled_t, 10]);
        // airflow slots so the gel dries both sides of the plate
        for (sx = [-1, 1]) translate([sx*19 - 2.5, -sled_t, z0 + 10]) cube([5, 2*sled_t, sled_top - z0 - 20]);
        translate([0, 0, sled_top + 0.5]) rotate([90, 0, 0]) cylinder(d=3.5, h=10, center=true, $fn=20);
    }
    // Pi Zero standoffs on the back (-y), SD card at the top
    for (dx = [-pi_hole_dx/2, pi_hole_dx/2], dz = [-pi_hole_dz/2, pi_hole_dz/2])
        translate([dx, -sled_t/2 + 0.01, pi_cz + dz]) rotate([90, 0, 0])
            difference() {
                cylinder(d=5.5, h=pi_standoff + 0.01, $fn=24);
                translate([0, 0, -0.5]) cylinder(d=pi_pilot, h=pi_standoff + 1, $fn=16);
            }
    // two columns that carry the cowl; their tops also clamp the ends of the camera PCB
    for (s = [-1, 1]) {
        z_in  = cam_len/2 - 1.8;
        z_out = cowl_L + cowl_ear;
        difference() {
            translate([-6, sled_t/2 - 0.01, s > 0 ? win_z + z_in : win_z - z_out])
                cube([12, cam_back_y - sled_t/2 + 0.01, z_out - z_in]);
            translate([0, cam_back_y + 0.01, win_z + s*(cowl_L + cowl_ear/2)]) rotate([90, 0, 0])
                cylinder(d=2.5, h=10, $fn=16);   // M3 self-tapping
        }
    }
}

// ============================================================ camera cowl
// Light baffle: clamps the camera PCB against the sled columns and gives
// the lens and each LED their own chamber, lined up with their windows.
module cam_cowl() {
    difference() {
        union() {
            intersection() {
                translate([-cowl_half_w, cam_back_y, win_z - cowl_L]) cube([2*cowl_half_w, 20, 2*cowl_L]);
                cylinder(r=cowl_r, h=body_h);
            }
            translate([-6, cam_back_y, win_z - cowl_L - cowl_ear]) cube([12, 5, 2*(cowl_L + cowl_ear)]);
        }
        // PCB pocket (from the back)
        translate([-cam_w/2 - 0.3, cam_back_y - 0.01, win_z - cam_len/2 - 0.3])
            cube([cam_w + 0.6, cam_pcb_t + 0.01, cam_len + 0.6]);
        // clearance for small parts on the PCB front
        translate([-cam_w/2 + 1, cam_back_y + cam_pcb_t - 0.01, win_z - cam_len/2 + 1])
            cube([cam_w - 2, comp_h + 0.01, cam_len - 2]);
        // lens holder pocket, right down to the PCB
        translate([-lens_holder_w/2 - 0.3, cam_back_y, win_z - lens_holder_w/2 - 0.3])
            cube([lens_holder_w + 0.6, lens_front_y - cam_back_y + 0.01, lens_holder_w + 0.6]);
        // lens view cone out through the front
        window_frame(lens_front_y - 0.01) cylinder(r1=fov_r(lens_front_y), r2=fov_r(lens_front_y + 5), h=5);
        // LED chambers
        for (s = [-1, 1]) translate([0, cam_back_y, win_z + s*led_offset]) rotate([-90, 0, 0])
            cylinder(r=led_cav_r, h=30);
        // screw holes in the ears
        for (s = [-1, 1]) translate([0, cam_back_y - 1, win_z + s*(cowl_L + cowl_ear/2)]) rotate([-90, 0, 0])
            cylinder(d=3.4, h=20, $fn=20);
    }
}

// ============================================================ bezels
// built in window coordinates: z = outward from the pad face, y = up
module front_bezel() {
    z_end = bezel_t + brim_len;
    difference() {
        linear_extrude(bezel_t) pad2d(false);
        translate([0, 0, -0.01])
            cylinder(r1=fov_r(boss_face_y), r2=fov_r(boss_face_y + bezel_t + 0.02), h=bezel_t + 0.02);
        for (s = [-1, 1]) translate([0, s*led_offset, -0.01])
            cylinder(r1=led_r(0), r2=led_r(bezel_t + 0.02), h=bezel_t + 0.02);
        for (s = bezel_screws) translate([s[0], s[1], -1]) cylinder(d=3.4, h=bezel_t + 2, $fn=20);
    }
    // lens hood
    if (hood_len > 0)
        translate([0, 0, bezel_t - 0.01]) difference() {
            cylinder(r1=fov_r(boss_face_y + bezel_t) + 1.5,
                     r2=fov_r(boss_face_y + bezel_t + hood_len) + 1.5, h=hood_len);
            translate([0, 0, -0.01])
                cylinder(r1=fov_r(boss_face_y + bezel_t),
                         r2=fov_r(boss_face_y + bezel_t + hood_len + 0.02), h=hood_len + 0.02);
        }
    // drip brim over the top LED, flared just outside its beam
    translate([0, led_offset, 0]) rotate(90 - brim_span/2) rotate_extrude(angle=brim_span)
        polygon([[brim_r(0.5), 0.5], [brim_r(z_end), z_end],
                 [brim_r(z_end) + brim_t, z_end], [brim_r(0.5) + brim_t + 3, 0.5]]);
}

module back_bezel() {
    t = 3;
    difference() {
        cylinder(r=ls_boss_r, h=t);
        translate([0, 0, -0.01]) cylinder(r1=ls_r(0), r2=ls_r(t + 0.02), h=t + 0.02);
        for (sx = [-1, 1]) translate([sx*ls_screw_x, 0, -1]) cylinder(d=3.4, h=t + 2, $fn=20);
    }
}

// ============================================================ probe shield
// Built roof-down (print orientation). Flip to install: the probe goes up
// into the sleeve from below, cable hangs out of the open bottom.
module probe_shield() {
    slot_rows = 4;
    difference() {
        union() {
            cylinder(r=sh_r, h=sh_top_t);
            ring(sh_r - sh_wall, sh_r, sh_h);
            ring(probe_d/2 + 0.3, probe_d/2 + 2.3, sleeve_len);
            for (a = [0, 120, 240]) rotate(a)
                translate([probe_d/2 + 1, -1, 0]) cube([sh_r - probe_d/2 - 2, 2, 8]);
            translate([0, -sh_r + 1, 0]) rotate(180) {
                lh = strap_w + 4;
                translate([-14, strap_gap, (sh_h - lh)/2]) cube([28, loop_t, lh]);
                for (sx = [-1, 1]) translate([sx > 0 ? 9 : -14, -4, (sh_h - lh)/2])
                    cube([5, strap_gap + loop_t + 4, lh]);
            }
        }
        // louvres rise towards the inside once installed (skipped on the strap side)
        for (k = [0:slot_rows-1], a = [0:30:330])
            let(ang = a + (k % 2)*15)
            if (abs(ang - 270) > 40) rotate(ang)
                translate([sh_r - sh_wall/2, 0, sh_top_t + 10 + k*10])
                    rotate([0, -30, 0]) cube([sh_wall*4, 9, 3], center=true);
        for (a = [45, 165, 285]) rotate(a)
            translate([probe_d/2, 0, 12]) cube([8, 6, 14], center=true);
        translate([0, 0, sleeve_len - 4]) rotate([0, 90, 0])
            cylinder(d=3.5, h=probe_d + 10, center=true, $fn=16);
    }
}

// ============================================================ dummies
module dummy_parts() {
    // Pi Zero
    color("green") translate([-pi_w/2, -sled_t/2 - pi_standoff - pi_t, pi_bot_z]) cube([pi_w, pi_t, pi_l]);
    // camera PCB, lens holder, LEDs
    color("darkgreen") translate([-cam_w/2, cam_back_y, win_z - cam_len/2]) cube([cam_w, cam_pcb_t, cam_len]);
    color("black") translate([-lens_holder_w/2, cam_back_y + cam_pcb_t, win_z - lens_holder_w/2])
        cube([lens_holder_w, lens_front_y - cam_back_y - cam_pcb_t, lens_holder_w]);
    for (s = [-1, 1]) color("whitesmoke")
        translate([0, cam_back_y + cam_pcb_t, win_z + s*led_offset]) rotate([-90, 0, 0]) cylinder(r=3, h=5);
    // light sensor board
    color("purple") translate([-ls_w/2, -ls_pad_y + 0.01, ls_z - ls_h/2]) cube([ls_w, 1.6, ls_h]);
    // windows
    for (w = win_list) color("lightblue", 0.5)
        wframe(win_back_y, win_z + w[0]) cylinder(d=w[1], h=win_t);
    color("lightblue", 0.5) back_frame(ls_cb_y + gasket_t - 0.5) cylinder(d=ls_win_d, h=win_t);
    for (p = gland_pos) color("dimgray") translate([p[0], p[1], -14]) cylinder(d=12, h=14);
}

module assembly() {
    color("khaki") body();
    color("tan") translate([0, 0, lid_z]) lid();
    color("white") translate([0, 0, body_h]) gel_cover();
    color("orange") sled();
    color("dimgray") cam_cowl();
    color("sienna") window_frame() front_bezel();
    color("sienna") back_frame() back_bezel();
    color("white") translate([110, 0, body_h - 20]) rotate([180, 0, 0]) probe_shield();
    dummy_parts();
}

module exploded() {
    color("khaki") body();
    color("black") translate([0, 0, body_h + 18])
        rotate_extrude() translate([groove_mid_r, 0]) circle(d=oring_cs, $fn=16);
    color("white") translate([0, 0, body_h + 30]) gel_cover();
    color("tan") translate([0, 0, body_h + 48]) lid();
    color("orange") translate([100, 0, 0]) sled();
    color("dimgray") translate([100, 30, 0]) cam_cowl();
    for (w = win_list) {
        color("black") wframe(boss_face_y + 16, win_z + w[0]) ring(w[2] + 0.2, w[1]/2, gasket_t);
        color("lightblue", 0.5) wframe(boss_face_y + 32, win_z + w[0]) cylinder(d=w[1], h=win_t);
    }
    color("sienna") window_frame(boss_face_y + 54) front_bezel();
    color("lightblue", 0.5) back_frame(ls_face_y + 20) cylinder(d=ls_win_d, h=win_t);
    color("sienna") back_frame(ls_face_y + 36) back_bezel();
    color("purple") translate([-ls_w/2, -ls_pad_y + 40, ls_z - ls_h/2]) cube([ls_w, 1.6, ls_h]);
    color("white") translate([-130, 0, 90]) rotate([180, 0, 0]) probe_shield();
}
part="probe_shield";
// ============================================================ select
if      (part == "assembly")     assembly();
else if (part == "exploded")     exploded();
else if (part == "section")      difference() {
                                     assembly();
                                     translate([-300, -150, -50]) cube([300, 300, 400]);
                                 }
else if (part == "body")         body();
else if (part == "lid")          translate([0, 0, lid_h]) rotate([180, 0, 0]) lid();
else if (part == "gel_cover")    gel_cover();
else if (part == "sled")         translate([0, 0, -floor_t]) sled();
else if (part == "cam_cowl")     cam_cowl_print();
else if (part == "front_bezel")  front_bezel();
else if (part == "back_bezel")   back_bezel();
else if (part == "probe_shield") probe_shield();

// cowl laid PCB-side down for printing
module cam_cowl_print() {
    translate([0, 0, -cam_back_y]) rotate([90, 0, 0]) translate([0, 0, -win_z]) cam_cowl();
}
