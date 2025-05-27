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
  text("-10", 445, 477);
  text("-8", 532, 477);
  text("-6", 632, 477);
  text("-4", 732, 477);
  text("-2", 832, 477);
  text("0", 927, 477);
  text("2", 1036, 477);
  text("4", 1136, 477);
  text("6", 1236, 477);
  text("8", 1336, 477);
  text("10", 1422, 477);
  // on y-axis
  text("8", 927, 65);
  text("6", 927, 165);
  text("4", 927, 265);
  text("2", 927, 365);
  text("-2", 922, 565);
  text("-4", 922, 665);
  text("-6", 922, 765);
  text("-8", 922, 865);
  
  
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
  
  // FUNCTION BAR ON THE BOTTOM
  // initial state is just as the icon
  strokeWeight(1);
  fill(190);
  rect(10, 810, 80, 50, 10);
}

void keyPressed() {
}

void mouseClicked() {
}

void draw() {
}
