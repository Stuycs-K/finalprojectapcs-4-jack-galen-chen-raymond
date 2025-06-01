import java.util.Arrays;

private int screenXFull = 1440;
private int screenXSide = 1000; //starts at 440
private int screenYFull = 820; //starts at 50

private ArrayList<Equation> eqs = new ArrayList<Equation>(Arrays.asList(new Equation()));

void setup() {
  size(1440, 870); // FULL SIZE OF MACBOOK SCREEN
  
  background(255); // clear screen
  
  graph();
  equationsBar();
  grid();
  topBar();
  if (equationsBarOpen) {
    functionsBar();
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    addEquation();
  }
  if (keyCode == BACKSPACE || keyCode == DELETE) {
    if ((eqs.get(whichEquationSelected-1).toString()).equals("")) {
      // if the equation is empty, remove the equation
      removeEquation();
    }
    else {
      // if the equation has stuff in it, delete from the equation
      eqs.get(whichEquationSelected-1).remove();
    }
  }
  
  if (keyCode == UP) {
    if (whichEquationSelected > 1) {
      whichEquationSelected--;
    }
  }
  if (keyCode == DOWN) {
    if (whichEquationSelected >= numEquations) {
      addEquation();
    }
    whichEquationSelected++;
  }
  
  // FOR MODIFYING EQUATIONS
  if (key=='0' || key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' 
      || key=='x' || key=='y' 
      || key=='+' || key=='-' || key=='*' || key=='/') 
      {
    eqs.get(whichEquationSelected-1).add(""+key);
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
      addEquation();
    }
    
    // the delete button
    if (mouseX>=1070 && mouseX<=1185 && mouseY>=760 && mouseY<=805) {
      if ((eqs.get(whichEquationSelected-1).toString()).equals("")) {
        // if the equation is empty, remove the equation
        removeEquation();
      }
      else {
        // if the equation has stuff in it, delete from the equation
        eqs.get(whichEquationSelected-1).remove();
      }
    }
    
    // all the number buttons
    if (mouseX>=625 && mouseX<=705 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).add("7");
    }
    if (mouseX>=710 && mouseX<=790 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).add("8");
    }
    if (mouseX>=795 && mouseX<=875 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).add("9");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).add("/");
    }
    
    if (mouseX>=625 && mouseX<=705 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).add("4");
    }
    if (mouseX>=710 && mouseX<=790 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).add("5");
    }
    if (mouseX>=795 && mouseX<=875 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).add("6");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).add("*");
    }
    
    if (mouseX>=625 && mouseX<=705 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).add("1");
    }
    if (mouseX>=710 && mouseX<=790 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).add("2");
    }
    if (mouseX>=795 && mouseX<=875 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).add("3");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).add("*");
    }
    
    if (mouseX>=625 && mouseX<=705 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).add("0");
    }
    if (mouseX>=710 && mouseX<=790 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).add(".");
    }
    if (mouseX>=795 && mouseX<=875 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).add("=");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).add("+");
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

void addEquation() {
  numEquations++;
  eqs.add(new Equation());
}

void removeEquation() {
  if (numEquations>1) {
     numEquations--;
     eqs.remove(whichEquationSelected-1);
  }
  if (whichEquationSelected>1) {
    whichEquationSelected--;
  }
}

void graph() {
 int origin;
 strokeWeight(5);
 stroke(38,89,255);
 
 if (equationsBarOpen) {
   for (Equation eq : eqs) {
     if (!eq.toString().equals("")) {
       // if the Equation is not empty
       origin = 940;
       for (int i = 440; i < 1440; i++){
         float x = (i - origin) * zoomLevel / 100.0;
         float y = 460 - (100.0f / zoomLevel) * (float)(eqs.get(whichEquationSelected-1)).evaluate(x);
         if (y > 50){
           point(i,y);
         }
       }
     }
   }
 }
 else {
   for (Equation eq : eqs) {
     if (!eq.toString().equals("")) {
       // if the Equation is not empty
       origin = 720;
       for (int i = 0; i < 1440; i++){
         float x = (i - origin) * zoomLevel / 100.0;
         float y = 460 - (100.0f / zoomLevel) * (float)(eqs.get(whichEquationSelected-1)).evaluate(x);
         if (y > 50){
           point(i,y);
         }
       }
     }
   }
 }
}

void draw() {
}
