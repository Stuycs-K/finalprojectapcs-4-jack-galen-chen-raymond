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
    if (whichEquationSelected>1) {
      whichEquationSelected--;
    }
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
    
    // the blue return/add butotn
    if (mouseX>=1030 && mouseX<=1185 && mouseY>=810 && mouseY<=855) {
      numEquations++;
    }
    
    // the delete button
    if (mouseX>=1070 && mouseX<=1185 && mouseY>=760 && mouseY<=805) {
      if (numEquations>1) {
         numEquations--;
      }
      if (whichEquationSelected>1) {
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
