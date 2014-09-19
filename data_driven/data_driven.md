# Data Graphics with Processing and Illustrator

------

## Parameterized Drawing

- Functions allow you to make small, reusable sub-programs.
- Using funcitons breaks up a bigger problem into smaller ones.
- Good functions have a clear name, and **encapsulate** useful functionality.
- Functions can take parameter values to control exactly what they do.
- You say `jump()` and `howHigh`
- Don't use parameters to make a function do something completely different.

---

A simple capsule drawing function.

```java
void drawCapsule() {
	fill(200, 200, 200);
	noStroke();
	rect(50,50,50,30);
	ellipse(50 - 15,50,30,30);
	ellipse(100 - 15,50,30,30);
}
```

---

A capsule drawing function with x and y parameters

```java
void drawCapsule(float _x, float _y) {
	fill(200, 200, 200);
	noStroke();
	rect(_x - 25, _y - 15, 50, 30);
	ellipse(_x - 25 - 15, _y - 15, 30, 30);
	ellipse(_x + 25 - 15, _y - 15, 30, 30);
}
```

---

[Capsule Demo](https://github.com/jbakse/psam5600_demos/tree/master/data_driven/capsule)







------

## The Tranformation Matrix

- Representes the Processing coordinate system.
- Default matrix:  0,0 in upperleft corner; 1 unit = 1 pixel
- Transforming the matrix will change how future shapes are drawn

---

## Transform Functions
- translate(x, y)
- scale(x, y)
- rotate(a)

---

## Matrix Stack Functions

- The __Matrix Stack__ lets you save and restore states of the transform matrix.
- You can _push_ something to the top of the stack, or _pop_ what is currently there. 
- Kinda like _Inception_
- pushMatrix() // add a copy to the top of the stack
- popMatrix() // remove and access the top item of the stack
- resetMatrix() // just reset everything to the default
- Use push/pop to clean up after yourself.

---

## Why use transform the matrix?

- Change the unit to something more convienent.
- Draw rotated shapes.
- Draw rotated/scaled/translated compositions of shapes without calculating rotated/scaled/translated positions.
- Takes getting used to, but can make some code cleaner and easier to follow.
- Change the position/scale of shapes drawn with a function that __isn't__ parameterized.

---

```java
void drawCapsule(float _width) {
	noStroke();
	rect(_width * -.5, -15, _width, 30);
	ellipse(_width * -.5 - 15, -15, 30, 30);
	ellipse(_width * +.5 - 15, -15, 30, 30);
}

translate(100, 100);
rotate(radians(45));
drawCapsule(50);
```

---

## Combining Transformations

- translate, rotate, and scale accumulate
- if you rotate 45 and than translate, your translation will be rotated
- if you translate and then rotate, you will change the 'pivot'

------

## You want Map()

- `[map()](http://www.processing.org/reference/map_.html)` is super good.
- It re-maps a value from one range to another.
- Map: 8 on a scale of 0 - 10 to 80 on a scale of 0 - 100
- Map: 72 on a scale of 32 to 212 to 22.2 on a scale of 0 - 100

```java
roomTempC = map(72, 32, 212, 0, 100);
```

- `max()` and -`min()` are good to know too.

------

## Okay, Now the Data

- [Bar Chart Example](https://github.com/jbakse/psam5600_demos/tree/master/data_driven/bar)
- [Stacked Bar Chart Example](https://github.com/jbakse/psam5600_demos/tree/master/data_driven/stacked_bar)


------

# Exporting to Illustrator

- Use the [Processing PDF Library](http://processing.org/reference/libraries/pdf/)

---

```java
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
```

---

# Exporting Tips

- Read the docs!
- Release the Clipping Path
- Content outside your window __is__ exported.
- Focus on having Processing output the parts of your design that would be hard to create in Illustrator (the data, not the legend).
- You can recolor, distort, scale, position and otherwise manipulate your generated shapes in Processing.

---

# Illustrator Tools

- Pathfinder and Align palettes
- Select Same tools
- Edit Colors tools
