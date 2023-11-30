float size;
void setup() {
  size(800,800);
  background(0);
  size = width/10;
  noLoop();
}

void draw() {
 for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
    float positionX = i*size;
    float positionY = j*size;
    float middlePosition = size/2;
    int random = (int)random(4);
    int offset = 10;
    fill(255,255,100);
    noStroke();
    rect(positionX,positionY,size,size);  
    stroke(77);
    strokeWeight(5);
    if (random == 0) {
            line((positionX)+10,(positionY)+10,((i+1)*size)-10,((j+1)*size)-10);
        }else if (random == 1) {
            line((positionX)+10,((j+1)*size)-10,((i+1)*size)-10,(positionY)+10);
        }else if (random == 2) {
            line(positionX + offset, positionY + middlePosition, positionX+size - offset, positionY + middlePosition);
        }else if (random == 3) {
            line(positionX + middlePosition, positionY+offset, positionX + middlePosition, positionY + size - offset);
        }
    }
 }

}
