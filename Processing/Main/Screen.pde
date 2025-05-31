private boolean functionBoardOpen = false;
private boolean equationsBarOpen = true;
private int numEquations = 1;
private int whichEquationSelected = 1;
private int zoomLevel = 2; // this is the value at the first marked tick on the grid

void topBar() {
  // CREATE DESMOS LOGO ON TOP
  fill(0);
  rect(0, 0, 1440, 50);
  fill(255);
  textSize(35);
  text("desmos", 667, 37);
  
  // Create icons on the right side
  fill(220, 255);
  rect(1395, 55, 40, 40, 5); // options button
  
  rect(1395, 100, 40, 80, 5); // zoom in / out button
  if (zoomLevel==1) {
    fill(100, 255);
    rect(1395, 100, 40, 40, 5, 5, 1, 1);
  }
  
  stroke(0);
  line(1395, 140, 1435, 140);
}

void equationsBar() {
  // EQUATIONS BAR ON THE LEFT
  
  if (equationsBarOpen) {
    // the entire rectangle holding the equations bar
    fill(255);
    strokeWeight(5);
    stroke(0);
    rect(0, 50, 440, 870);
    
    // the topmost bar holding the +, <--, -->, options, and hide equations bar
    strokeWeight(1);
    fill(226);
    rect(2, 50, 436, 70);
    
    image(loadImage("plus.png"), 20, 65, 40, 40);
    
    textSize(20);
    fill(0);
    
    rotate(PI/2);
    image(loadImage("arrow.png"), 60, -430, 50, 50);
    rotate(3*PI/2);
    
    
    // the equations
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
      
      textSize(30);
      fill(0);
      text(eqs.get(i).toString(), 60, 160+70*i);
      
      fill(0);
      textSize(15);
      text(i+1, 10, 140+70*i);
    }
    
    
    
    text(eqs.toString(), 50, 800); // FOR TESTING PURPOSES
  }
  
  else {
    rotate(-PI/2);
    image(loadImage("arrow.png"), -110, 10, 50, 50);
    rotate(PI/2);
  }
}

void grid() {
  stroke(0);
  textSize(15);
  if (equationsBarOpen) {
    // INITIAL GRID / HALF SCREEN GRID

    // vertical lines + numbers along x-axis
    strokeWeight(2);
    line(940, 50, 940, 870);
    
    int mult = 5; // this is used to display the right number based on the zoomLevel
    strokeWeight(1.1);
    for (int i=1440; i>400; i-=100) {
      line(i, 50, i, 870);
      
      if (mult==5) {
        text(zoomLevel*mult, i-17, 475);
      }
      else if (mult>0) {
        text(zoomLevel*mult, i-3, 475);
      }
      else if (mult==0) {
        text(zoomLevel*mult, i-10, 475);
      }
      else if (mult==-5) {
        text(zoomLevel*mult, i+5, 475);
      }
      else if (mult<0) {
        text(zoomLevel*mult, i-7, 475);
      } 
      
      mult--;
    }
    
    // vertical sub-lines
    strokeWeight(0.3);
    for (int i=1440; i>440; i-=25) {
      line(i, 50, i, 870);
    }
    
    
    
    // horizontal lines + numbers along y-axis
    strokeWeight(2);
    line(440, 460, 1440, 460);
    
    int mult2 = -4; // this is used to display the right number based on the zoomLevel
    strokeWeight(1.1);
    for (int i=860; i>50; i-=100) {
      line(440, i, 1440, i);
      
      if (mult2>0) {
        text(zoomLevel*mult2, 928, i+5);
      }
      if (mult2<0) {
        text(zoomLevel*mult2, 922, i+5);
      }
      
      mult2++;
    }
    
    // horizontal sub-lines
    strokeWeight(0.3);
    for (int i=860; i>50; i-=25) {
      line(440, i, 1440, i);
    }
  }
  
  else { // FOR FULLSCREEN GRID
    stroke(0);
    fill(0);
    textSize(15);
    text(0, 705, 477);
    
    // vertical lines + numbers along x-axis
    strokeWeight(2);
    line(720, 50, 720, 870);
    
    // positive vertical lines + sublines
    strokeWeight(1.1);
    int mult = 1;
    for (int i=820; i<1440; i+=100) {
      line(i, 50, i, 870);
      text(mult*zoomLevel, i-3, 477);
      mult++;
    }
    
    strokeWeight(0.3);
    for (int i=720; i<1440; i+=25) {
      line(i, 50, i, 870);
    }
    
    // negative vertical lines + sublines
    strokeWeight(1.1);
    mult=-1;
    for (int i=620; i>0; i-=100) {
      line(i, 50, i, 870);
      text(mult*zoomLevel, i-6, 477);
      mult--;
    }
    
    strokeWeight(0.3);
    for (int i=720; i>0; i-=25) {
      line(i, 50, i, 870);
    }
    
    
    // horizontal lines + numbers along y-axis
    strokeWeight(2);
    line(0, 460, 1440, 460);
    
    // positive horizontal lines + sublines
    strokeWeight(1.1);
    mult=-1;
    for (int i=560; i<870; i+=100) {
      line(0, i, 1440, i);
      text(mult*zoomLevel, 700, i+5);
      mult--;
    }
    
    strokeWeight(0.3);
    for (int i=460; i<870; i+=25) {
      line(0, i, 1440, i);
    }
    
    // negative horizontal lines + sublines
    strokeWeight(1.1);
    mult=1;
    for (int i=360; i>50; i-=100) {
      line(0, i, 1440, i);
      text(mult*zoomLevel, 705, i+5);
      mult++;
    }
    
    strokeWeight(0.3);
    for (int i=460; i>50; i-=25) {
      line(0, i, 1440, i);
    }
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
