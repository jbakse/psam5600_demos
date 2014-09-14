# Basics Refresher

------

##What processing is.

- An IDE
- A language
- A library/API

[Processing Website](http://www.processing.org)

---

# Processing Library Functions

```java
size(600, 400);
background(0, 0, 0);

fill (255, 0, 0);
rect(10, 10, 200, 100);

fill(0, 255, 0);
ellipse(300, 60, 200, 100);

fill(0, 0, 255);
textSize(60);
text("Hello, World!", 10, 200);
```


------

## Common Elements of Syntax

<table>
	<tr>	<th>What to Do</th>			<th>What to Know</th>	</tr>
	<tr>	<td>operators</td>			<td>literals</td> 		</tr>
	<tr>	<td>expressions</td>		<td>variables</td> 		</tr>
	<tr>	<td>statements</td>			<td>arrays</td> 		</tr>
	<tr>	<td>flow control</td>		<td>structs<super>*</super></td> 		</tr>
	<tr>	<td>functions</td>			<td></td> 		</tr>
</table>

---

# Comments

- Comments are text in a computer program that the computer will ignore.
- Comments help explain the program to the programmers.

```java
// find the age
age = currentYear - birthYear;
```

---

# Literals
	
- A value described in the code literally.

```java
ellipse(300, 60, 200, 100);
```

---

# Variables
	
- Named piece of data
- Name, Value, Type
- Declare, Initialize, Assign, Read

```java
int n = 0;
n = 100;
ellipse(n, n, 50, 50);
```

---

# Operators, Expressions, Statements

- Operators combine or compare values
- Expressions are combinations of values that can be evaluated
- A Statement is the smallest stand-alone element in a program. It is like a sentence in English.

```java
a = b * 100;
```

---

## Flow Control
	
- Conditional Statements: If

```java
if (condition/test) {
	// do this if the test succeeds
} else {
	// or do this instead
}

if (age > 21) {
	completeOrder();
}
```

---

- Loops: For

```java
for (init, test, update){
	//code to repeat
}

for (n = 0; n < 10, n++) {
	print(n);
}
```

---

## Functions 
	
- Functions are small, named programs.
- Breaking a large problem into smaller ones makes it less daunting.
- Breaking a large program into smaller ones makes it easier to understand.
- Good functions are named clearly, do one thing, and can reused easily.
- Functions can take parameters and they can return results.

---

```java
int rollDice() {
	return (int)random(1,7) + (int)random(1,7);
}

rollDice();
```

---

```java
float add(float a, float b) {
	return a+b;
}

float result = add(10, 25);
```

---

```java
void drawLogo(x, y, width, height){
	color(255, 0, 0);
	rect(x, y, width, height);
	color(0, 0, 0);
	rect(x, y, width - 10, height - 10);
	color(255, 0, 0);
	rect(x, y, width - 20, height - 20);
}

drawLogo(10, 10, 100, 100);
drawLogo(20, 10, 100, 100);
```

---

##Arrays

- Variables are named pieces of data.
- Arrays are named, **ordered sets** of data.
- All values in an array must have they same type.
- Declare, Initialize, Assign, Read

```java
float[] values;
values = new float[3];
values[0] = 15;
values[1] = 21;
values[2] = 25;
println( values[1] );
```

---

## Setup & Draw
	
- Processing programs normally include a `setup` and a `draw` function.
- `setup` is execute only once, when your program begins.
- `draw` is executed repeatedly, allowing for animation and interaction.
- Your programs won't need animation, you can use `noLoop();` to make draw only run once.

```java
void setup() {
	size(600, 400);
	noLoop();
}

void draw() {
	rect(10, 10, 100, 100);
}
```

------

# Data Visualization Topics

- Exporting to Illustrator
- Working with CSV
- Working with ArrayList
