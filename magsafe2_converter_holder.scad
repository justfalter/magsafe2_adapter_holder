// Apple Magsafe 2 converter holder. 
// Mike Ryan (falter@gmail.com)
// Creative Commons Sharealike Attribution license 4.0: 
//  https://creativecommons.org/licenses/by-sa/4.0/
//
// revision 1 - 2015-09-13

// Adjust scaling to adapt to what works best for your printer/filament.
scaling = 8.1/7.8;


innerWidth  = 7.63 * scaling;
innerLength = 17.5 * scaling;
height = 8;
$fn=36;

wallThickness = 2.8;

innerRadius = 1.5;
outerRadius=innerRadius+wallThickness;

xOffset = innerWidth - 2*innerRadius;
yOffset = innerLength - 2*innerRadius;

magsafe2_converter_holder();


module magsafe2_converter_holder() {
  body();
  tab();
}

module tab() {
  h = 4;
  difference() {
    translate([0,yOffset/2+wallThickness,0]) {
      difference() {
        fourCylinderHull(x=xOffset,y=8,h=4,r=outerRadius);
        fourCylinderHull(x=xOffset,y=8,h=4,r=innerRadius);
      }
    }

    // Subtract the body from the tab.
    hull() body();
  }
}

module body() {
  taperHeight = 3;
  difference() {
    fourCylinderHull(x=xOffset,y=yOffset,h=height,r=outerRadius);
    fourCylinderHull(x=xOffset,y=yOffset,h=height,r=innerRadius);

      hull() {
        translate([0,0,height-taperHeight]) 
          fourCylinderHull(x=xOffset,y=yOffset,h=1,r=innerRadius);
        translate([0,0,height]) fourCylinderHull(x=xOffset+1,y=yOffset+1,h=1,r=innerRadius);
        
      }
  }
}

module fourCylinderHull(x=1,y=1,r=1,h=1) {
  hull() for(i=[-x/2,x/2]) {
    for(j=[-y/2,y/2]) {
      translate([i,j]) cylinder(r=r, h=h);
    }
  }
}

