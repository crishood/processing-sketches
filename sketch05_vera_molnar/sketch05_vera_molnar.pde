// https://www.youtube.com/watch?v=O5G4SoWBoao
// Vera Molnar inspired sketch
// Tutorial by thedotisblack

int grid = 50;
int margin = 150;
color[] colArray = {
  color(255),
  color(122,255,184),
  color(36,229,255),
  color(255,240,40),
};

void setup(){
  size(800,800);
  pixelDensity(2);
  noLoop();
  //frameRate(4);
}

void draw(){
  background(25,30,34);
  noFill();
  stroke(255);
  
  float d = grid*0.6;

  
  for(int i = margin; i<=width-margin; i+=grid){
    for(int j = margin; j<=height-margin; j+=grid){
      int colArrayNum = (int)random(colArray.length);
      stroke(colArray[colArrayNum]);
      strokeWeight(2);
      for(int num=0; num<7; num++){
        float x1 = -random(d);
        float x2 = random(d);
        float x3 = random(d);
        float x4 = -random(d);
        float y1 = -random(d);
        float y2 = -random(d);
        float y3 = random(d);
        float y4 = random(d);
        pushMatrix();
        translate(i,j);
        quad(x1, y1, x2, y2, x3,y3,x4,y4);
        popMatrix();
      }

    }
  }
  
  
}

void keyPressed(){
  if(key==' ') redraw();
}
