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
  strokeWeight(10);
  rect(0, 50, 400, 870);
  strokeWeight(2);
  line(0, 120, 400, 120);
  strokeWeight(1);
  line(40, 120, 40, 870);
  line(0, 190, 400, 190);
  
  // INITIAL GRID
  stroke(0);
  
  // the numbers
  textSize(20);
  fill(0);
  
  // on x-axis 
  text("0", 905, 487);
  text("-2", 806, 487);
  text("-4", 702, 487);
  text("-6", 598, 487);
  text("-8", 494, 487);
  text("-10", 410, 487);
  text("2", 1020, 487);
  text("4", 1123, 487);
  text("6", 1228, 487);
  text("8", 1332, 487);
  text("10", 1418, 487);
  
  // on y-axis
  text("8", 905, 70);
  text("6", 905, 162);
  text("4", 905, 265);
  text("2", 905, 370);
  text("-2", 899, 578);
  text("-4", 899, 682);
  text("-6", 899, 786);
  text("-8", 899, 864);
  
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
  line(400, 467, 1440, 467);  
  strokeWeight(1);
  line(400, 571, 1440, 571);
  line(400, 675, 1440, 675);
  line(400, 779, 1440, 779);
  
  line(400, 363, 1440, 363);
  line(400, 259, 1440, 259);
  line(400, 155, 1440, 155);
}

void keyPressed() {
}

void draw() {
}
