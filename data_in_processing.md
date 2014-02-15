# Working with Data in Processing

Computer programs are a series of steps describing what the program should do. Computer programs also describe how to store information that the program will need. Choosing good methods to store this information will make programming easier and your program better.


------

## Elements of a computer program

| WHAT TO DO        | WHAT TO KNOW              |
| -----             | -----                     |
| operators         | literals                  |
| expressions       | variables                 |
| statements        | arrays                    |
| flow control      | structures (classes)      |
| functions         | collections               |

| WHAT TO DO + KNOW     |
| -----                 |
| classes               |


------

## Data Classes

- Often you have multiple pieces of information (properties) about a single entity
- In Processing and Java, you can use Data Classes to hold this information
- All instances of a Class will have the same properties
- Classes can contain Objects of other Classes (object composition)

| Point3D       | Card          | EnemyShip         
| -----         | -----         | -----             
| `float` x     | `string` suit | `string` name     
| `float` y     | `int` number  | `float` speed     
| `float` z     |               | `int` health      
|               |               | `int` ammo        
|               |               | `Point3D` location        


---

```java
class Point3D
{
    float x;
    float y;
    float z;
}

class EnemyShip {
    String name;
    float speed;
    int health;
    int ammo;
    Point3D location;
}

EnemyShip boss = new EnemyShip();
boss.name = "The Feynman"
boss.speed = 10.0;
boss.health = 100;
boss.ammo = 30;

boss.location = new Point3D();
boss.location.x = 0;
boss.location.y = 0;
boss.location.z = 0;

```


---

There isn't really such a thing as a Data Class. The examples above are just regular Classes without any methods. You can add methods to your Classes as well.

```java
class EnemyShip {
    String name;
    float speed;
    int health;
    int ammo;
    
    void shoot(EnemyShip target){
        target.health -= 1;
        ammo--;
    }
}
```


------

## The Java Collections Framework 

- The JCF provides a variety of useful Classes to hold collections of information
- These provide more powerful ways to keep track of collections than an array
- Common Types of Collections
    - List, Array `ArrayList`
    - Set `HashSet`
    - Map, Dictionary, Associative Array `HashMap`
- One big advantage of these collections is they can grow and shrink.

- [Java Collection Documentationn](http://docs.oracle.com/javase/tutorial/collections/)


---

## Lists

- Ordered collection of objects
- Can contain the same object in more than one place
- Example: List of employees of the Month


---

## Sets

- Unordered collection of objects
- Can't contain the same object twice
- Example: Set of students in a class


---

## Maps

- Unordered collection of named (keyed) objects
- Can **quickly** access a particular object by specifying its name (key)
- Can contain the same object twice, but each key must be unique
- Example: A map of Student ID Numbers to Students


---


## Using Collections

```java
// Processing imports ArrayList for you

ArrayList<String> list = new ArrayList<String>();
list.add("Ada Lovelace");
list.add("Grace Hopper");
list.add("Alan Turing");

String s = list.get(0);
println(s); // Ada Lovelace
```

```java
import java.util.HashSet;

HashSet<Integer> myInts = new HashSet<Integer>();
myInts.add(1);
myInts.add(2);
int myInt = 3;
myInts.add(3);
myInts.add(2);

println(myInts); // [1, 2, 3]
```


---

## Strong and Weak Typing

- Data in programs has types (`int`, `String`, `EnemyShip`)
- Java typing is **strong** (or strict)
    - You must declare a type for all variables
    - You can't use one type of variable where another type is expected
    - Sometimes, you can **cast** a variable to let the computer know it can be treated as a certain type

- Javascript (for example) typing is **weak** (or loose)
    - You don't need to declare a type for variables
    - The computer will treat data as the expected type automatically when possible
    - This is less picky, but also less safe


---

## Generics

- The Java Collections can work with different types 
- An `ArrayList` of `Integer`s or `String`s or `EnemyShip`s
- Collections are flexible because of a Java language feature called **Generics**
- The type goes in angle brackets: `ArrayList<String>`
- [Java Generics Documentation](http://docs.oracle.com/javase/tutorial/java/generics/)


---

## Autoboxing

- Most data in Java program is stored in Objects (instances of Classes)
- Java also supports a few "primative" data types (int, float, etc.)
- Collections **can't** store these primative types, but they **can** store coresponding objects; **can't** store `int`s, **can** store `Integer`s
- Java will "autobox" these for you, allowing you to assign an int to and Integer and vice-versa
- [Java Primatives Documentation](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html), [Autoboxing Documentation](http://docs.oracle.com/javase/tutorial/java/data/autoboxing.html)

```java
int myInt = 3;
// java will autobox myInt
Integer myInteger = myInt;
```


------

## Using HashMap in the Survey Demo


The Survey Demo creates a bar chart showing how many students live in each zip code. To do this, the code first needs to count the students for each zip code. It uses a `Hashmap` to store the tallies for each zip code.

```java
HashMap<String, Integer> zipCounts = new HashMap<String, Integer>();
```

- The **key** is a `String` (The zip code: `"11211"` or `"10013"`)
- The **value** is an `Integer` (The count: 0, 1, 2, ...)
- Note: Some zip codes start "0" like `"04101"` so we should use `Strings`, not `Integers`


---

How to `put()` and `get()` data in a `HashMap`

```java
import java.util.HashMap;

HashMap<String, Integer> zipCounts = new HashMap<String, Integer>();

// put
zipCounts.put("11211", 2);
zipCounts.put("10013", 1);

// get
int value = zipCounts.get("11211");
println(value); // 2

// replace with put
zipCounts.put("11211", 5);

println(zipCounts); // {11211=5, 10013=1}
```


---

Counting the students in each zip.

```java
HashMap<String, Integer> zipCounts = new HashMap<String, Integer>();
    
for (TableRow row : classData.rows())
{
    String zipCode = row.getString("Zip Code");
    Integer zipCount = zipCounts.get(zipCode);

    if (zipCount == null)
    {
        zipCounts.put(zipCode, 1);
    }
    else
    {
        zipCounts.put(zipCode, zipCount + 1);
    }
}
```


------

## Data in the Crime Demo

The Crime Demo combines information from two .csv files and creates a scatter plot. Both spreadsheets list hundreds of U.S. cities with related statistics. One file shows info about crimes, the other has info about law enforcement employees. 

The program uses a custom class, `City`, to store the information loaded from the spreadsheets. It uses a `HashMap` to store the cities, so that a city can be found by name.

The program first iterates over each row in `known_offenses.csv`, creates a `City` for each, and copies the relevent data into the new object. Then the program iterates over the rows in `employees.csv`, matches the row to one of the `City` objects, and copies the additional information.


---

```java
public class City
{
    String state;
    String city;
    int population;
    int violentCrimes;
    int officers;

    float pcViolentCrimes()
    {
        return violentCrimes / (float)population;
    }

    float pcOfficers()
    {
        return officers / (float)population;
    }

    String toString()
    {
        return state 
        + " " 
        + city 
        + " " 
        + population 
        + " " 
        + violentCrimes + "(" + pcViolentCrimes() + ")" 
        + " " 
        + officers + "(" + pcOfficers() + ")";
    }
}

...

ArrayList<City> cities = loadData();

...

// Note: I've taken out some of the code in this function
// to focus on the use of Collections and Classes. The full 
// code is in the project
ArrayList<City> loadData()
{
    Table offensesCSV;
    Table employeesCSV;

    HashMap<String, City> cities = new HashMap<String, City>();

    offensesCSV = loadTable("known_offenses.csv", "header");
    
    for (TableRow row : offensesCSV.rows())
    {
        City newCity = new City();

        newCity.state = row.getString("State").trim();
        newCity.city = row.getString("City").trim();
        newCity.population = readInt(row.getString("Population").trim());
        newCity.violentCrimes = readInt(row.getString("Violent crime").trim());

        // create name(key) for the city in the map
        String cityKey = newCity.state + "_" + newCity.city;

        cities.put(cityKey, newCity);
    }

    // load employees.csv
    offensesCSV = loadTable("employees.csv", "header");
    
    for (TableRow row : offensesCSV.rows())
    {
        String state = row.getString("State").trim();
        String city = row.getString("City").trim();

        // create name(key) for the city in the map
        String cityKey = state + "_" + city;

        // update the instance if it exists
        City loadedCity = cities.get(cityKey);
        if (loadedCity != null)
        {
            loadedCity.officers = readInt(row.getString("Total officers").trim());
        }
    }

    //return map's values as ArrayList of cities
    return new ArrayList<City>(cities.values());
}
```

------

[Reveal Slideshow](http://justinbakse.com/reveal/index.php?src=https://raw2.github.com/jbakse/psam5600_demos/master/data_in_processing.md#/)
