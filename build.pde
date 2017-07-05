// when the program is quit it gives up soem "fatal error in Java Runtime" stuff
// problem doesnt seem to impede the function of the program and doesnt exist at all 
// 				if the insantiating lines for the filter are commented out



// maybe make an object that can hold all these (rect, whiteNoise, filter) together.


// probably end up trying to port this to a Beads version


// mousePress adds an element to the arrayList
// keyPress of 'k' can kill off a set of rect/noise/filter chosen at random



import processing.sound.*;

CustomRect rectangle;

void setup() {
	rectMode(CENTER);
	// fullScreen();
	size(400, 400, P2D);
	rectangle = new CustomRect(random(width), random(height));

	// pos = new PVector(random(width), random(height));

	// whiteNoise = new WhiteNoise(this);
	// whiteNoise.pan(map(pos.x, 0, width, -1, 1));
	// whiteNoise.play();

	// lowPass = new LowPass(this);
	// lowPass.process(whiteNoise, 400);
	
}

void draw() {

	background(100);
	rectangle.display();
	// for (int i = positions.size() - 1; i >= 0; i --) {
	// 	PVector pos = positions.get(i);
	// 	rect(pos.x, pos.y, 100, 50);
	// }

}

// void mousePressed() {
// 	positions.add(new PVector(mouseX, mouseY));
// 	bandPasses.add(new BandPass(this));

	
// 	// whiteNoises[lastIn].pan(panControl);
// 	// whiteNoises[lastIn].play();

// 	// bandPasses[lastIn].process(whiteNoises[lastIn], freqControl);
// 	// println("mousePressed", lastIn, freqControl);

// 	// pos.x = mouseX;
// 	// pos.y = mouseY;
// 	// whiteNoise.pan(map(pos.x, 0, width, -1, 1));

// }

// void keyPressed() {
// 	if (key == 'k' && positions.size() > 0) {

// 		int victim = int(random(positions.size()));

// 		positions.remove(victim);

// 		BandPass bP = bandPasses.get(victim);
// 		bP.stop();
// 		bandPasses.remove(victim);

// 		WhiteNoise wN = whiteNoises.get(victim);
// 		wN.stop();
// 		whiteNoises.remove(victim);
// 	}
// }



