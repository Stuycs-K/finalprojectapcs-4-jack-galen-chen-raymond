void setup() {
  size(1440, 870); // full size of MacBook screen
  
  // the Desmos logo on top
  background(255);
  fill(0);
  rect(0, 0, 1440, 50);
  fill(255);
  textSize(35);
  text("Desmos", 667, 37);
  
  // the bar on the left for the equations
  fill(226);
  strokeWeight(10);
  rect(0, 50, 400, 870);
  
  // the initial grid
  stroke(0);
  // vertical lines
  strokeWeight(2);
  line(920, 50, 920, 870);
  strokeWeight(1);
  line(504, 50, 504, 870);
  line(608, 50, 608, 870);
  line(712, 50, 712, 870);
  line(816, 50, 816, 870);
  
  line(1024, 50, 1024, 870);
  line(1128, 50, 1128, 870);
  line(1232, 50, 1232, 870);
  line(1336, 50, 1336, 870);
  
  // horizontal lines
  strokeWeight(2);
  line(400, 475, 1440, 475);  
  strokeWeight(1);
  line(400, 579, 1440, 579);
  line(400, 683, 1440, 683);
  line(400, 787, 1440, 787);
  
  line(400, 371, 1440, 371);
  line(400, 267, 1440, 267);
  line(400, 163, 1440, 163);
}

void keyPressed() {
}

void draw() {
}
