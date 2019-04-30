//PCB size: 47x24x1.6 mm
//charger board: 17.5x22
//holes: 13.5, 18
//USB: 8x3
//Battery: 21x32x7

batt_x=21;
batt_y=32;
batt_z=7;

pcb_x=47.2;
pcb_y=24.2;
pcb_z=1.7;

over_x=1; //Ennyivel lehet oldalrol ralogni a NYAK-ra
over_z=1.7; //Ennyivel lehet alulrol es felulrol ralogni a NYAK-ra
over2=2; // Ennyivel lesz szelesebb a doboz, mint a NYAK
base_x=(pcb_x+over2*2); //Doboz szelessege
base_y=50;
encl_thick=2; //Doboz anyaganak vastagsaga

module battery()
{
  color([0.3, 0.3, 0.3]) cube([batt_x, batt_y, batt_z], center=true);
}

module pcb()
{
  translate([0, pcb_z/2+over2, pcb_y/2+encl_thick]) rotate([90, 0, 0])
    cube([pcb_x, pcb_y, pcb_z], center=true);
}

//Lent, fent: 1.7mm, oldalt: 1mm

module usb()
{
  translate([-15, base_y-encl_thick-1, encl_thick+1.2]) cube([8, encl_thick+2, 3]);
}

//pcb();
//translate([-base_x/2, 0, 0]) cube([base_x, base_y, encl_thick]);
difference()
{
  translate([-base_x/2, 0, 0]) cube([base_x, base_y, pcb_y+encl_thick]);
  translate([-base_x/2+encl_thick, encl_thick-20, encl_thick]) cube([base_x-encl_thick*2, base_y-encl_thick*2+20, pcb_y]);
  usb();
}
difference()
{
  translate([0, (over2*2+pcb_z)/2, encl_thick+pcb_y/2]) cube([base_x, over2*2+pcb_z, pcb_y], center=true);
  translate([0, (over2*2+pcb_z)/2, encl_thick+pcb_y/2+over_z/2]) cube([base_x-over2*2-over_x*2, over2*2+pcb_z, pcb_y-over_z], center=true);
  pcb();
}

translate([10, 30, 6]) battery();
