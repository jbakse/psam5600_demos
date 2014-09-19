void setup() {
	size(600, 400);
	ellipseMode(CORNER);
	noLoop();
}

void drawCapsule() {
	fill(200, 200, 200);
	noStroke();
	rect(50,50,50,30);
	ellipse(50 - 15,50,30,30);
	ellipse(100 - 15,50,30,30);
}


void drawCapsule(float _x, float _y) {
	fill(200, 200, 200);
	noStroke();
	rect(_x - 25, _y - 15, 50, 30);
	ellipse(_x - 25 - 15, _y - 15, 30, 30);
	ellipse(_x + 25 - 15, _y - 15, 30, 30);
}


void draw() {
	background(50, 50, 100);
	drawCapsule(100, 100);
}
