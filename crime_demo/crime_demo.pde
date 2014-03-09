//////////////////////////////////////
//
// crime_demo.pde
//
// Demo code for PSAM560 - Data, Design, Code
//
// Creates a scatter plot of American cities showing
// per-capita violent crime rate vs per-capita law enforment employees.
//
// Author: Justin Bakse
//
//////////////////////////////////////


import java.util.Comparator;
import java.util.Collections;


// Visualization Settings

int MIN_POPULATION = 5000;
int BIG_CITY_COUNT = 20;
int SMALL_CITY_COUNT = 20;
float OUTLIER_THRESHOLD = .5;
int MARGIN_LEFT = 10;
int MARGIN_RIGHT = 100;
int MARGIN_TOP = 10;
int MARGIN_BOTTOM = 10;

// Data

ArrayList<City> sorted_cities;

int min_population;
int max_population;
int min_violentCrimes;
int max_violentCrimes;
int min_officers;
int max_officers;
float min_pc_violentCrimes;
float max_pc_violentCrimes;
float min_pc_officers;
float max_pc_officers;



// City Class holds data about a city.

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
        return state + " " + city + " " + population + " " + violentCrimes + "(" + pcViolentCrimes() + ")" +  " " + officers + "(" + pcOfficers() + ")";
    }
}


// turns a string into an int, even if it has commas

int readInt(String s)
{
    if (s.trim().equals("")) return 0;
    return Integer.parseInt(s.replace(",", ""));
}


void setup()
{
    size(900, 800);

    // load data from csv
    ArrayList<City> cities = loadData();

    // sort the data
    Collections.sort(cities, new Comparator<City>()
    {
        public int compare(City a, City b)
        {
            return a.population - b.population;
        }
    });
    sorted_cities = cities;


    // calculate the min/maxes
    min_population = sorted_cities.get(0).population;
    max_population = sorted_cities.get(0).population;
    min_violentCrimes = sorted_cities.get(0).violentCrimes;
    max_violentCrimes = sorted_cities.get(0).violentCrimes;
    min_officers = sorted_cities.get(0).officers;
    max_officers = sorted_cities.get(0).officers;
    min_pc_violentCrimes = sorted_cities.get(0).pcViolentCrimes();
    max_pc_violentCrimes = sorted_cities.get(0).pcViolentCrimes();
    min_pc_officers = sorted_cities.get(0).pcOfficers();
    max_pc_officers = sorted_cities.get(0).pcOfficers();
    for (int i = 1; i < sorted_cities.size(); i++)
    {
        City c = sorted_cities.get(i);
        if (c.population < min_population) min_population = c.population;
        if (c.population > max_population) max_population = c.population;
        if (c.violentCrimes < min_violentCrimes) min_violentCrimes = c.violentCrimes;
        if (c.violentCrimes > max_violentCrimes) max_violentCrimes = c.violentCrimes;
        if (c.officers < min_officers) min_officers = c.officers;
        if (c.officers > max_officers) max_officers = c.officers;
        if (c.pcViolentCrimes() < min_pc_violentCrimes) min_pc_violentCrimes = c.pcViolentCrimes();
        if (c.pcViolentCrimes() > max_pc_violentCrimes) max_pc_violentCrimes = c.pcViolentCrimes();
        if (c.pcOfficers() < min_pc_officers) min_pc_officers = c.pcOfficers();
        if (c.pcOfficers() > max_pc_officers) max_pc_officers = c.pcOfficers();
    }


    // output a summary
    println("\nData Summary.");
    println(cities.size() + " qualifying cities!");
    println("min_population: " + min_population);
    println("max_population: " + max_population);
    println("min_violentCrimes: " + min_violentCrimes);
    println("max_violentCrimes: " + max_violentCrimes);
    println("min_officers: " + min_officers);
    println("max_officers: " + max_officers);
    println("min_pc_violentCrimes: " + min_pc_violentCrimes);
    println("max_pc_violentCrimes: " + max_pc_violentCrimes);
    println("min_pc_officers: " + min_pc_officers);
    println("max_pc_officers: " + max_pc_officers);


    // just draw once
    noLoop();
    draw();
}


// loaddata()
// load the csv files into our own structure, an array of City objects
// notes:
// both files list many U.S. cities, but the lists don't match exactly
// "employees" has more cities, but is not a perfect superset of "offenses"
// we need to discard cities that do not appear in both lists
// only the first city in each state includes the state name, we'll have to fill in the rest

ArrayList<City> loadData()
{
    Table employeesCSV;
    Table offensesCSV;
    HashMap<String, City> cities = new HashMap<String, City>();

    // load known_offenses.csv
    offensesCSV = loadTable("known_offenses.csv", "header");
    println("\nLoaded known_offenses.csv");
    println(offensesCSV.getRowCount() + " total rows in table.");

    // create City objects for each row
    String rememberedState = "";
    for (TableRow row : offensesCSV.rows())
    {
        City newCity = new City();


        // only first city in each state has state column filled out
        // remember the state and use it for rows where state is empty
        // could have also cleaned up the data in spreadsheet
        String state = row.getString("State").trim();
        if (state.equals(""))
        {
            state = rememberedState;
        }
        else
        {
            rememberedState = state;
        }
        newCity.state = state;

        // populate the other fields
        newCity.city = row.getString("City").trim();
        newCity.population = readInt(row.getString("Population").trim());
        newCity.violentCrimes = readInt(row.getString("Violent crime").trim());

        // create hashmap key for the city
        String cityKey = newCity.state + "_" + newCity.city;

        // only store cities with a population greater than MIN_POPULATION
        if (newCity.population > MIN_POPULATION)
        {
            cities.put(cityKey, newCity);
        }

        //println("Created " + newCity);
    }

    // load employees.csv
    offensesCSV = loadTable("employees.csv", "header");
    println("\nLoaded employees.csv");
    println(offensesCSV.getRowCount() + " total rows in table.\n");

    // update City objects for each row
    rememberedState = "";
    for (TableRow row : offensesCSV.rows())
    {

        // use the remembered state when needed (see above)
        String state = row.getString("State").trim();
        if (state.equals(""))
        {
            state = rememberedState;
        }
        else
        {
            rememberedState = state;
        }


        String city = row.getString("City").trim();

        // create key so we can find the City instance to update
        String cityKey = state + "_" + city;

        // update the instance if it exists
        City loadedCity = cities.get(cityKey);
        if (loadedCity != null)
        {
            loadedCity.officers = readInt(row.getString("Total officers").trim());
            // println("Updated " + loadedCity);
        }
        else
        {
            // println(cityKey + " not found.");
        }
    }

    // println("\n\nData loaded.");


    //return ArrayList of cities
    return new ArrayList<City>(cities.values());

}

void draw()
{
    background(0);
    fill(255);
    noStroke();
    ellipseMode(CENTER);

    int index = 0;
    for (City c : sorted_cities)
    {
        // choose dot style
        float dotSize = 0;
        if (index > sorted_cities.size() - BIG_CITY_COUNT)
        {
            fill(255, 0, 0);
            dotSize = 4;
        }
        else if (index < SMALL_CITY_COUNT)
        {
	    fill(0, 0, 255);
            dotSize = 4;
        }
        else
        {
            fill(255);
            dotSize = 2;
        }

        // calculate dot position
        float xVal = c.pcOfficers();
        float yVal = c.pcViolentCrimes();
        float x = map(xVal, min_pc_officers, max_pc_officers, MARGIN_LEFT, width - MARGIN_RIGHT);
        float y = map(yVal, min_pc_violentCrimes, max_pc_violentCrimes, height - MARGIN_BOTTOM, MARGIN_TOP);

        // draw dot
        ellipse(x, y, dotSize, dotSize);




        // determine if we should draw label
        boolean label = false;
        if (xVal > (max_pc_officers - min_pc_officers) * OUTLIER_THRESHOLD
                || yVal > (max_pc_violentCrimes - min_pc_violentCrimes) * OUTLIER_THRESHOLD
                || index > sorted_cities.size() - BIG_CITY_COUNT)
        {
            label = true;
        }


        //draw label
        if (label)
        {
            fill(255);
            textAlign(LEFT, CENTER);
            textSize(8);
            text(c.city + "\n" + c.state + " " + c.population, x + 5, y);
        }


        index++;
    }
}