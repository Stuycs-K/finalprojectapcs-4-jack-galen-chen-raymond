void setup() {
  size(1440, 870); // FULL SIZE OF MACBOOK SCREEN
  
  // DESMOS LOGO ON TOP
  background(255);
  fill(0);
  rect(0, 0, 1440, 50);
  fill(255);
  textSize(35);
  text("Desmos", 667, 37);
  
  // EQUATIONS BAR ON THE LEFT
  fill(226);
  strokeWeight(5);
  rect(0, 50, 440, 870);
  
  strokeWeight(2);
  line(0, 120, 440, 120);
  
  strokeWeight(1);
  line(40, 120, 40, 870);
  line(0, 190, 440, 190);
  
  // INITIAL GRID
  stroke(0);
  
  // the numbers
  textSize(15);
  fill(0);
  
  // on x-axis 
  //text("0", 905, 487);
  //text("-2", 806, 487);
  //text("-4", 702, 487);
  //text("-6", 598, 487);
  //text("-8", 494, 487);
  //text("-10", 410, 487);
  //text("2", 1020, 487);
  //text("4", 1123, 487);
  //text("6", 1228, 487);
  //text("8", 1332, 487);
  //text("10", 1418, 487);
  
  //// on y-axis
  //text("8", 905, 70);
  //text("6", 905, 162);
  //text("4", 905, 265);
  //text("2", 905, 370);
  //text("-2", 899, 578);
  //text("-4", 899, 682);
  //text("-6", 899, 786);
  //text("-8", 899, 864);
  
  
  
  // vertical lines
  strokeWeight(2);
  line(940, 50, 940, 870);
  
  strokeWeight(1.3);
  for (int i=1440; i>400; i-=100) {
    line(i, 50, i, 870);
  }
  
  // vertical sub-lines
  strokeWeight(0.3);
  for (int i=1440; i>440; i-=25) {
    line(i, 50, i, 870);
  }
  
  // horizontal lines
  strokeWeight(2);
  line(440, 460, 1440, 460);
  
  strokeWeight(1.3);
  for (int i=860; i>50; i-=100) {
    line(440, i, 1440, i);
  }
  
  // horizontal sub-lines
  strokeWeight(0.3);
  for (int i=860; i>50; i-=25) {
    line(440, i, 1440, i);
  }
}

void keyPressed() {
}

void draw() {
}
