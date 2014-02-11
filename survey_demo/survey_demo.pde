import processing.pdf.*;

Table classData;
PFont myFont;

void setup()
{
    size(600, 400);


    // load up the csv data
    // see: http:// www.processing.org/reference/loadTable_.html
    classData = loadTable("data.csv", "header");

    // print out some basics about the data, to make sure it loaded correctly
    println(classData.getRowCount() + " total rows in table");
    for (TableRow row : classData.rows())
    {
        String firstName = row.getString("First Name");
        String lastName = row.getString("Last Name");
        println(firstName + " " + lastName);
    }


    // draw to the PDF
    beginRecord(PDF, "output.pdf");
    {
        // load up a .tff font (side effect is editable text)
        // p5 is touchy about this, not all fonts seem to work, and you need to load them after you start recording
        // make sure you have the font!
        // String[] fontList = PFont.list();
        // println(fontList);
        // myFont = createFont("ACaslonPro-Bold", 32);
        // textFont(myFont);
        // textMode(MODEL);
        draw();
    }
    endRecord();


    // this just draws a single frame, no need to loop.
    noLoop();

    // draw it once to screen
    draw();

}

void draw()
{
    // two demos in one, comment in one of the functions below.
    citiesBarchart();
    // zipBarchart();
}


void citiesBarchart()
{
    // calculate our drawing parameters
    int barSpacing = width / classData.getRowCount();
    int barWidth = barSpacing - 10;

    // intialilze our state
    int x = 20;

    // loop, read, and draw
    for (TableRow row : classData.rows())
    {
        // read data
        String firstName = row.getString("First Name");
        String lastName = row.getString("Last Name");
        int cities = row.getInt("How many cities have you lived in?");

        // calc bar height
        float barHeight = cities * 10;

        // draw bar
        noStroke();
        fill(0, 200, 200);
        rect(x - barWidth * .5, 300, barWidth, -barHeight);

        // draw label
        textSize(6);
        textAlign(CENTER, TOP);
        fill(0);
        text(firstName + "\n" + lastName, x, 300);

        // move to next position
        x += barSpacing;
    }
}



void zipBarchart()
{

    ///////////////////////////////////////////////////////////
    // process data
    // count occurances using a hashmap (lookup table)
    // the map will hold an key for each zipcode, and we will increment the value

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

    ///////////////////////////////////////////////////////////
    // draw processed data

    // calculate our drawing parameters
    int barSpacing = width / zipCounts.size();
    int barWidth = barSpacing - 10;

    // intialilze our state
    int x = 20;

    // loop and draw
    for (String zip : zipCounts.keySet())
    {
        // draw bar
        float barHeight = zipCounts.get(zip) * 20;
        noStroke();
        fill(0, 200, 200);
        rect(x - barWidth * .5, 300, barWidth, -barHeight);

        // draw label
        textSize(6);
        textAlign(CENTER, TOP);
        fill(0);
        text(zip, x, 300);

        // move to next position
        x += barSpacing;
    }

}