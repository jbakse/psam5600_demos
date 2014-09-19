import processing.pdf.*;

void setup() {
  size(400, 400);
  noLoop();
 
}

void draw() {
  
  beginRecord(PDF, "output.pdf"); 

  fill(255, 0, 0);
  ellipse(200, 200, 100, 100);

  endRecord();
}
