//PCB size: 47x24x1.6 mm
pcb_x=47;
pcb_y=24;
pcb_z=1.6;

over_x=1; //Ennyivel lehet oldalrol ralogni a NYAK-ra
over_z=1.7; //Ennyivel lehet alulrol es felulrol ralogni a NYAK-ra
over2=2; // Ennyivel lesz szelesebb a doboz, mint a NYAK
base_x=(pcb_x+over2*2); //Doboz szelessege
encl_thick=2; //Doboz anyaganak vastagsaga

module pcb()
{
  translate([0, pcb_z/2+over2, pcb_y/2+encl_thick]) rotate([90, 0, 0])
    cube([pcb_x, pcb_y, pcb_z], center=true);
}

//Lent, fent: 1.7mm, oldalt: 1mm

//pcb();
translate([-base_x/2, 0, 0]) cube([base_x, 40, encl_thick]);
difference()
{
  translate([0, (over2*2+pcb_z)/2, encl_thick+pcb_y/2]) cube([base_x, over2*2+pcb_z, pcb_y], center=true);
  translate([0, (over2*2+pcb_z)/2, encl_thick+pcb_y/2+over_z/2]) cube([base_x-over2*2-over_x*2, over2*2+pcb_z, pcb_y-over_z], center=true);
  pcb();
}

