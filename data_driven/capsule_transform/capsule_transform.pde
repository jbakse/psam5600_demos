void setup() {
	size(600, 400);
	ellipseMode(CORNER);
	noLoop();
}

void drawCapsule(float _width) {
	noStroke();
	rect(_width * -.5, -15, _width, 30);
	ellipse(_width * -.5 - 15, -15, 30, 30);
	ellipse(_width * +.5 - 15, -15, 30, 30);
}


void draw() {
	background(50, 50, 100);
	
	fill(255, 200, 200);
	
	pushMatrix();

	translate(100, 100);
	drawCapsule(100);

	translate(10, 40);
	drawCapsule(100);

	translate(10, 40);
	rotate(radians(15));
	drawCapsule(100);

	popMatrix();
}
