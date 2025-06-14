private boolean functionBoardOpen = false;
private boolean equationsBarOpen = true;
private boolean plusMenuOpen = false;
private int numEquations = 1;
private int whichEquationSelected = 1;
private int zoomLevel = 2; // this is the value at the first marked tick on the grid

void topBar() {
  // CREATE DESMOS LOGO ON TOP
  fill(0);
  rect(0, 0, 1440, 50);
  fill(255);
  textSize(35);
  image(loadImage("desmos.png"), 640, 10, 154, 32);
  
  // Create icons on the right side
  fill(220, 255);
  rect(1395, 55, 40, 40, 5); // reset button
  image(loadImage("circleArrow.png"), 1399, 60, 30, 30);
  
  rect(1395, 100, 40, 80, 5); // zoom in / out button
  if (zoomLevel==1) {
    fill(100, 255);
    rect(1395, 100, 40, 40, 5, 5, 1, 1);
  }
  if (zoomLevel==16384) {
    fill(100, 255);
    rect(1395, 140, 40, 40, 1, 1, 5, 5);
  }
  
  image(loadImage("plus.png"), 1403, 108, 25, 25);
  image(loadImage("minus.png"), 1403, 147, 25, 25);
  
  stroke(0);
  line(1395, 140, 1435, 140);
}

void equationsBar() {
  PFont tnr = createFont("TimesNewRomanPSMT", 15);
  textFont(tnr);
  // EQUATIONS BAR ON THE LEFT
  
  if (equationsBarOpen) {
    // the entire rectangle holding the equations bar
    fill(255);
    strokeWeight(5);
    stroke(0);
    rect(0, 50, 440, 870);
    
    // the topmost bar holding the +, options, and hide equations bar
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
    PFont s = createFont("PTMono-Regular", 100);

    for (int i=0; i<numEquations; i++) {
      if (i == whichEquationSelected-1) {
        stroke(38, 89, 255);
        
        // to display the cursor
        textFont(tnr);
        textSize(35);
        fill(0);
        text("|", eqs.get(i).getCursorPos()*18 + 57, 163+70*i);
        fill(38, 89, 255);
      }
      else {
        fill(226);
        stroke(0);
      }

      textFont(s);
      strokeWeight(1);
      if (i == whichEquationSelected-1) {
        rect(3, 120+70*i, 40, 70);
        line(5, 120+70*i, 440, 120+70*i);
        line(5, 190+70*i, 440, 190+70*i);
      }
      else{
        rect(2, 120+70*i, 40, 70);
        line(0, 120+70*i, 440, 120+70*i);
        line(0, 190+70*i, 440, 190+70*i);
      }
      
      textSize(30);
      fill(0);
      text(eqs.get(i).toString(), 60, 165+70*i);
      
      textSize(15);
      text(i+1, 10, 140+70*i);
      
      if (eqs.get(i).isNote()) {
        textSize(50);
        fill(0);
        text("\"", 5, 190+70*i);
      }
      else {
        fill(colors[eqs.get(i).getColor()]);
        stroke(0);
        strokeWeight(0.5);
        circle(23, 160+70*i, 30);
      }
    }
    
    // the plus menu
    if (plusMenuOpen) {
      textFont(tnr);
      
      fill(200, 255);
      rect(2, 120, 200, 100);
      triangle(40, 105, 15, 120, 65, 120);
      
      strokeWeight(1.5);
      stroke(200, 200, 200, 255);
      line(15, 120, 65, 120);
      
      strokeWeight(1);
      stroke(0);
      line(2, 170, 202, 170);
      
      fill(0);
      textSize(25);
      text("New Expression", 10, 155);
      text("New Note", 10, 205);
    }
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
  
  PFont tnr = createFont("TimesNewRomanPSMT", 15);
  textFont(tnr);
  
  if (equationsBarOpen) {
    // INITIAL GRID / HALF SCREEN GRID

    // vertical lines + numbers along x-axis
    strokeWeight(2);
    fill(0);
    line(940, 50, 940, 870);
    text("0", 928, 475);
    
    int mult = 5; // this is used to display the right number based on the zoomLevel
    strokeWeight(1.1);
    for (int i=1440; i>400; i-=100) {
      line(i, 50, i, 870);
      int num = zoomLevel*mult;
      
      if (mult==5) {
        text(num, i-(""+num).length()*8, 475);
      }
      else if (mult==-5) {
        text(num, i+(""+num).length(), 475);
      }
      else if (mult!=0) {
        text(num, i-(""+num).length()*4, 475);
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
    fill(0);
    line(440, 460, 1440, 460);
    
    mult = -4; // this is used to display the right number based on the zoomLevel
    strokeWeight(1.1);
    for (int i=860; i>50; i-=100) {
      line(440, i, 1440, i);
      
      int num = zoomLevel*mult;
      
      if (mult!=0) {
        text(num, 935-(""+num).length()*7, i+5);
      }
      
      mult++;
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
  PFont tnr = createFont("TimesNewRomanPSMT", 15);
  textFont(tnr);
  // FUNCTION BAR ON THE BOTTOM
  // initial state is just as the icon
  strokeWeight(0.5);
  fill(190);
  
  if (functionBoardOpen) { 
    // create the function board
    
    rect(10, 595, 80, 50, 10);
    fill(0);
    image(loadImage("keyboard.png"), 15, 595, 47, 50);
    triangle(65, 615, 85, 615, 75, 625);
    
    fill(190);
    rect(10, 652, 1420, 208, 10);
    
    // creating the buttons
    textSize(20);
    // variables and special operators
    String[] buttons = {"   x", "    y", "  a^2", "  a^b", 
                        "   (", "    )", "   <", "    >", 
                        "   |a|", "    ,", "  <=", "  >=", 
                        "color", " reset", "   √", "   π"};
    int index = 0;
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        fill(255);
        rect(230+j*(85), 660+i*(50), 80, 45, 5);
        fill(0);
        text(buttons[index], 248+j*85, 688+i*(51));
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
        text(buttons2[index], 660+j*85, 688+i*(51));
        index++;
      }
    }
    
    //fill(139);
    //rect(1030, 660, 155, 45, 5);
    //fill(0);
    //text("functions", 1070, 690);
    
    fill(139);
    rect(1030, 710, 75, 45, 5);
    fill(0);
    rotate(8*PI/8);
    image(loadImage("thinArrow.png"), -1090, -758, 50, 50);
    
    rotate(8*PI/8);
    fill(139);
    rect(1110, 710, 75, 45, 5);
    fill(0);
    image(loadImage("thinArrow.png"), 1125, 708, 50, 50);

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
    image(loadImage("keyboard.png"), 15, 810, 47, 50);
    triangle(65, 840, 85, 840, 75, 830);
  }
}
