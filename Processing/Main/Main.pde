private boolean functionBoardOpen = false;
private boolean equationsBarOpen = true;
private int numEquations = 1;
private int whichEquationSelected = 1;


void topBar() {
  // CREATE DESMOS LOGO ON TOP
  fill(0);
  rect(0, 0, 1440, 50);
  fill(255);
  textSize(35);
  text("desmos", 667, 37);
}




void equationsBar() {
  // EQUATIONS BAR ON THE LEFT
  // the entire rectangle holding the equations bar
  fill(255);
  strokeWeight(5);
  rect(0, 50, 440, 870);
  
  // the topmost bar holding the +, <--, -->, options, and hide equations bar
  strokeWeight(1);
  fill(226);
  rect(2, 50, 436, 70);
  
  strokeWeight(1);
  for (int i=0; i<numEquations; i++) {
    if (i == whichEquationSelected-1) {
      fill(38, 89, 255);
      stroke(38, 89, 255);
    }
    else {
      fill(226);
      stroke(0);
    }
    
    rect(2, 120+70*i, 40, 70);
    line(0, 120+70*i, 440, 120+70*i);
    line(0, 190+70*i, 440, 190+70*i);
    
    fill(0);
    textSize(15);
    text(i+1, 10, 140+70*i);
  }
}






void grid() {
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
}







void functionsBar() {
  // FUNCTION BAR ON THE BOTTOM
  // initial state is just as the icon
  strokeWeight(0.5);
  fill(190);
  
  if (functionBoardOpen) { 
    // create the function board
    
    rect(10, 595, 80, 50, 10);
    fill(0);
    triangle(60, 615, 80, 615, 70, 625);
    
    fill(190);
    rect(10, 652, 1420, 208, 10);
    
    // creating the buttons
    textSize(20);
    // variables and special operators
    String[] buttons = {"   x   ", "   y  ", "a^2 ", "a^b ", 
                        "   (  ", "   )  ", "   <  ", "   >  ", 
                        "  |a| ", "   ,  ", " <=  ", " >=  ", 
                        "ABC", "  ?", "  √  ", "  π  "};
    int index = 0;
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        fill(255);
        rect(230+j*(85), 660+i*(50), 80, 45, 5);
        fill(0);
        text(buttons[index], 255+j*85, 688+i*(50));
        index++;
      }
    }
    
    String[] buttons2 = {"7", "8", "9", "/",
                         "4", "5", "6", "*",
                         "1", "2", "3", "-",
                         "0", ".", "=", "+"};
    index=0;
    // numpad and normal operators
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        fill(255);
        rect(625+j*(85), 660+i*(50), 80, 45, 5);
        fill(0);
        text(buttons2[index], 660+j*85, 688+i*(50));
        index++;
      }
    }
    
    fill(139);
    rect(1030, 660, 155, 45, 5);
    fill(0);
    text("functions", 1070, 690);
    
    fill(139);
    rect(1030, 710, 75, 45, 5);
    fill(0);
    text("<——", 1050, 740);
    
    fill(139);
    rect(1110, 710, 75, 45, 5);
    fill(0);
    text("——>", 1130, 740);

    fill(139);
    rect(1070, 760, 115, 45, 5);
    fill(0);
    text("delete", 1105, 790);
    
    fill(38, 89, 255);
    rect(1030, 810, 155, 45, 5);
    fill(0);
    text("enter", 1090, 840);
  }
  
  
  else {
    rect(10, 810, 80, 50, 10);
    fill(0);
    triangle(60, 840, 80, 840, 70, 830);
  }
}





// -------------------------------------------------




void setup() {
  size(1440, 870); // FULL SIZE OF MACBOOK SCREEN
  
  background(255); // clear screen
  
  topBar();
  equationsBar();
  grid();
  functionsBar();
}






void keyPressed() {
  if (keyCode == ENTER) {
    numEquations++;
  }
  if (keyCode == BACKSPACE || keyCode == DELETE) {
    if (numEquations>1) {
       numEquations--;
    }
    if (whichEquationSelected>1 && whichEquationSelected >= numEquations+1) {
       whichEquationSelected--;
    }
  }
  
  if (keyCode == UP) {
    if (whichEquationSelected > 1) {
      whichEquationSelected--;
    }
  }
  if (keyCode == DOWN) {
    if (whichEquationSelected < numEquations) {
      whichEquationSelected++;
    }
  }
  
  setup();
}








void mouseClicked() {
  // TO CLICK THE KEYBOARD ICON / FOR THE FUNCTION BAR
  if (functionBoardOpen) {
    if (mouseX>=10 && mouseX<=90 && mouseY>=595 && mouseY<=645) {
      functionBoardOpen=false;
    }
    
    // the blue return/add butotn
    if (mouseX>=1030 && mouseX<=1185 && mouseY>=810 && mouseY<=855) {
      numEquations++;
    }
    
    // the delete button
    if (mouseX>=1070 && mouseX<=1185 && mouseY>=760 && mouseY<=805) {
      if (numEquations>1) {
         numEquations--;
      }
      if (whichEquationSelected > 1 && whichEquationSelected >= numEquations+1) {
         whichEquationSelected--;
      }
    }
  }
  else {
    if (mouseX>=10 && mouseX<=90 && mouseY>=810 && mouseY<=860) {
      functionBoardOpen=true;
    }
  }
  
  
  // FOR THINGS INVOLVING THE EQUATIONS BAR
  if (equationsBarOpen) {
    if (mouseX<=440 && mouseY>=120 && mouseY<=(120+70*numEquations)) {
       // if the mouseClicked is selecting an equation
       whichEquationSelected = (mouseY/70)-1;
    }
  }
  else {
  }
  
  setup();
}


void draw() {
}
