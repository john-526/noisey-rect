// mousePress adds elements to the arrayLists
// keyPress of 'k' can kill off a set of rect/noise/filter chosen at random


//imports sound library
import processing.sound.*;

// setup an expandable array for each of items to be associated with each other
//        an array for ther drawing rectangles
//        one for the noise genrators
//        one for the filters

ArrayList<PVector> positions = new ArrayList<PVector>();
ArrayList<WhiteNoise> whiteNoises = new ArrayList<WhiteNoise>();
ArrayList<BandPass> bandPasses = new ArrayList<BandPass>();


void setup() {
    rectMode(CENTER);
    // size(600, 400, P2D);
    fullScreen();
}

// draws through the arrayList of drawing rectangles
//        does list backwards to allow for items to be removed so as not to confuse the loop counter
// prints instructions to screen

void draw() {

    background(20, 80, 10);
    fill(255, 30);

    for (int i = positions.size() - 1; i >= 0; i --) {
        PVector pos = positions.get(i);
        rect(pos.x, pos.y, 100, 50);
    }
    fill(255);
    text("Click mouse to create new rectangle, 'k' will kill a random rectangle", 20, height - 20);
}


// creates new entry in each of the drawing rectangle, noise and filter arrayLists
//        creates new drawing rectangle and uses index to retrieve correct noise generators and filters for assignments
//        assigns resonant frequency of filter as an inverse function the height (height: distance from top of screen)
//        assign pan position of noise generator as a function of position of rectangle across the width of the screen

void mousePressed() {
    positions.add(new PVector(mouseX, mouseY));
    int lastIn = positions.size() - 1; 

    float panControl = map(mouseX, 0, width, -1, 1);

    whiteNoises.add(new WhiteNoise(this));
    WhiteNoise wN = whiteNoises.get(lastIn);
    wN.pan(panControl);
    wN.play();

    float freqControl = map(mouseY, height, 0, 200, 10000);

    bandPasses.add(new BandPass(this));
    BandPass bP = bandPasses.get(lastIn);
    bP.process(wN, freqControl);
}


void keyPressed() {

    // kills a random box when 'k' is pressed
    //        selects random index in range of size of the drawing rectangle arrayList
    //        removes corresponding entry from each of the rectangle, noise and filter arrayLists 
    if (key == 'k' && positions.size() > 0) {

        int victim = int(random(positions.size()));

        positions.remove(victim);

        BandPass bP = bandPasses.get(victim);
        bP.stop();
        bandPasses.remove(victim);

        WhiteNoise wN = whiteNoises.get(victim);
        wN.stop();
        whiteNoises.remove(victim);
    }
}


