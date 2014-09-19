float fakeData[][] = {
{1.0, 3.0},
{9.0, 2.0},
{5.5, 1.0},
{6.6, 2.0},
{3.5, 2.0},
{8.0, 1.0},
{1.0, 3.0},
{1.0, 5.0},
{8.0, 3.0}
};

void setup() {
	size(600, 400);
	ellipseMode(CORNER);
	noLoop();
}

void drawStackedBar(float[] _values) {
	fill(100, 0, 0);
	rect(0, 0, 10, -_values[0] * 10);
	
	fill(0, 100, 0);
	rect(0, -_values[0] * 10, 10, -_values[1] * 10);

}

void draw() {
	background(200);
	fill(0, 0, 0);
	noStroke();

	pushMatrix();
	translate(50, 300);
	
	for(int i = 0; i < fakeData.length; i++) {
		drawStackedBar(fakeData[i]);
		translate(50, 0);
	}
	popMatrix();
}
