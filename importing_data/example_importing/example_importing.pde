/*
example_importing.pde
Author: Justin Bakse

This example imports and visualizes data about box office profits.
Data originally from here: https://docs.google.com/spreadsheet/ccc?key=0Altk3Tn01ZsWdEJ1cHFjbmVyejhnN1JnQlNyWW5IUkE&authkey=CPuZiLcG#gid=22

Preparing Data:
Downloaded as Excel from Google Docs
Opened in Apple Numbers
Edited down to desired info
Export as .csv


*/

import processing.pdf.*;


void setup() {
    size(600, 400);

    noLoop();
}

void draw() {
    background(255);

    Table boxofficeData = loadTable("boxoffice_edited.csv", "header");

    beginRecord(PDF, "output.pdf");

    // list installed fonts to console, make sure you have the font installed!
    String[] fontList = PFont.list();
    println(fontList);

    // load up a .tff font (side effect is editable text)
    // p5 is touchy about this, not all fonts seem to work, and you need to load them after you start recording
    // slows rendering down too
    PFont myFont = createFont("Futura-CondensedMedium", 32);
    textFont(myFont);
    textMode(MODEL);

    // loop through the data
    for (TableRow row : boxofficeData.rows()) {

    	//  grab each column
        String name = row.getString("film");
        int score = row.getInt("Metacritic");
        int budget = row.getInt("Budget") * 1000000;
        int gross = row.getInt("Gross");

        // filter bad data
        if (name == "") continue;
        if (score == 0) continue;
        if (budget == 0) continue;
        if (gross == 0) continue;

        plotMovie(name, score, budget, gross);
    }


    endRecord();
}

void plotMovie(String name, int score, int budget, int gross) {
    
    // find position of dot, scale based on range of budgets and grosses
    float x = map(budget, 0, 250000000, 0, 600);
    float y = map(gross, 0, 1500000000, 400, 0);

    // draw dot
    noStroke();
    if (score > 60) {
        fill(0, 255, 0);
    } else if (score > 40) {
        fill(255, 255, 0);
    } else {
        fill(255, 0, 0);
    }
    ellipse(x, y, 6, 6);


    // draw label
    textAlign(LEFT, CENTER);
    textSize(4);
    fill(0);
    text(name, x + 5, y);
}
