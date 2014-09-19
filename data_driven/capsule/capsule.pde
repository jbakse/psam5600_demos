void setup() {
	size(600, 400);
	ellipseMode(CORNER);
	noLoop();
}

void drawCapsule() {
	
	noStroke();
	rect(50,50,50,30);
	ellipse(50 - 15,50,30,30);
	ellipse(100 - 15,50,30,30);
}


void drawCapsule(float _x, float _y) {
	
	noStroke();
	rect(_x - 25, _y - 15, 50, 30);
	ellipse(_x - 25 - 15, _y - 15, 30, 30);
	ellipse(_x + 25 - 15, _y - 15, 30, 30);
}

void drawCapsule(float _x, float _y, float _width) {
	
	noStroke();
	rect(_x - _width * .5, _y - 15, _width, 30);
	ellipse(_x - _width * .5 - 15, _y - 15, 30, 30);
	ellipse(_x + _width * .5 - 15, _y - 15, 30, 30);
}


void draw() {
	background(50, 50, 100);
	
	fill(255, 200, 200);
	drawCapsule();

	fill(200, 255, 200);
	drawCapsule(75, 125);
	drawCapsule(175, 125);

	fill(200, 200, 255);
	drawCapsule(75, 200, 50);
	drawCapsule(275, 200, 200);
}
