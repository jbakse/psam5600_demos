# Data Graphics with Processing and Illustrator

------

## Parameterized Drawing

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



[Example function that draws a parameterized shape]



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
- You can add something to the top of the stack, or access what is currently there. 
- Kinda like _Inception_
- pushMatrix() // save this matrix to the top of the stack
- popMatrix() // load the top matrix on the stack
- resetMatrix() // just reset everything to the default

---

## Why use transform the matrix?

- Change the unit to something more convienent.
- Draw rotated shapes.
- Draw rotated/scaled/translated compositions of shapes without calculating rotated/scaled/translated positions.
- Takes getting used to, but can make some code cleaner and easier to follow.
- Change the position/scale of shapes drawn with a function that __isn't__ parameterized.



---

[EXAMPLE Draw the same thing in two places.]

---

Combining Transformations

- Order Counts
- [EXAMPLE]

---



------

# Exporting to Illustrator

- Use the [Processing PDF Library](http://processing.org/reference/libraries/pdf/)

[SAMPLE CODE]

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
