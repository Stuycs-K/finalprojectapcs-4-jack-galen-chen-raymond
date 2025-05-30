private int screenXFull = 1440;
private int screenXSide = 1000; //starts at 440
private int screenYFull = 820; //starts at 50



void setup() {
  size(1440, 870); // FULL SIZE OF MACBOOK SCREEN
  
  background(255); // clear screen
  
  equationsBar();
  grid();
  topBar();
  if (equationsBarOpen) {
    functionsBar();
  }
  graph();
}

void keyPressed() {
  if (keyCode == ENTER) {
    numEquations++;
  }
  if (keyCode == BACKSPACE || keyCode == DELETE) {
    removeEquation();
  }
  
  if (keyCode == UP) {
    if (whichEquationSelected > 1) {
      whichEquationSelected--;
    }
  }
  if (keyCode == DOWN) {
    if (whichEquationSelected >= numEquations) {
      numEquations++;
    }
    whichEquationSelected++;
  }
  
  setup();
}

void mouseClicked() {
  // TO CLICK THE KEYBOARD ICON / FOR THE FUNCTION BAR
  if (functionBoardOpen) {
    if (mouseX>=10 && mouseX<=90 && mouseY>=595 && mouseY<=645) {
      functionBoardOpen=false;
    }
    
    // the blue return/add button
    if (mouseX>=1030 && mouseX<=1185 && mouseY>=810 && mouseY<=855) {
      numEquations++;
    }
    
    // the delete button
    if (mouseX>=1070 && mouseX<=1185 && mouseY>=760 && mouseY<=805) {
      removeEquation();
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
    if (mouseX<=440 && mouseX>=360 && mouseY<=120 && mouseY>=50) {
      equationsBarOpen=false;
    }
  }
  else {
    if (mouseX<=80 && mouseY>=50 && mouseY<=110) {
      equationsBarOpen=true;
    }
  }
  
  // ZOOM IN AND OUT
  if (mouseX>=1395 && mouseX<=1435 && mouseY>=100 && mouseY<=140) {
    // zoom in
    if (zoomLevel>1) {
      zoomLevel/=2;
    }
  }
  if (mouseX>=1395 && mouseX<=1435 && mouseY>=140 && mouseY<=180) {
    // zoom out
    zoomLevel*=2;
  }
  
  setup();
}



// helper methods



void removeEquation() {
  if (numEquations>1) {
     numEquations--;
  }
  if (whichEquationSelected>1) {
    whichEquationSelected--;
  }
}

void graph() {
 int x = 0;
 int start = 720;
 int startNeg = 0;
 Equation e = new Equation("x*x"); 

 strokeWeight(5);
 stroke(38,89,255);
 if (equationsBarOpen){
   start = 940;
   startNeg = 440;
 }
 for (int i = start; i < 1440; i++){
   point(i, 460 - (100.0/zoomLevel) * (float)e.evaluate(x));
   x+=zoomLevel/100.0;

 }
 x = startNeg - start;
 for (int i = startNeg; i < start; i++){
   point((float)i, 460 - (float)e.evaluate(x));
   x++;

 }
}

void draw() {
}
