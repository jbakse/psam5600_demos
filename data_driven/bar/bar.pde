float fakeData[] = {1.0, 10.0, 5.5, 6.6, 3.5, 8.0, 1.0, 1.0, 8.0};

void setup() {
	size(600, 400);
	ellipseMode(CORNER);
	noLoop();
}

void drawBar(float _height) {
	rect(0,0,10, - _height);
}

void draw() {
	background(200);
	fill(0, 0, 0);
	noStroke();

	translate(50, 300);
	
	for(int i = 0; i < fakeData.length; i++) {
		drawBar(fakeData[i] * 10);
		translate(50, 0);
	}
}
