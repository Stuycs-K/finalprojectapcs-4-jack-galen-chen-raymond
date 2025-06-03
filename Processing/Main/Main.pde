import java.util.Arrays;

private int screenXFull = 1440;
private int screenXSide = 1000; //starts at 440
private int screenYFull = 820; //starts at 50

private ArrayList<Equation> eqs = new ArrayList<Equation>(Arrays.asList(new Equation())); 
// initialized with one empty equation to prevent index error

color blue = color(38, 89, 255);
color red = color(255, 23, 23);
color green = color(0, 235, 23);
color yellow = color(230, 238, 0);
color orange = color(238, 135, 0);
color violet = color(137, 0, 229);
color pink = color(229, 0, 183);
color black = color(0, 0, 0);

private color[] colors = {blue, red, green, yellow, orange, violet, pink, black};
                                   
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
      eqs.get(whichEquationSelected-1).removeFromEq();
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
    else {
      whichEquationSelected++;
    }
  }
  
  // FOR MODIFYING EQUATIONS
  if (key=='0' || key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' 
      || key=='x' || key=='y' 
      || key=='+' || key=='-' || key=='*' || key=='/' || key=='=' || key=='^' 
      || key=='√' || key=='<' || key=='>' || key=='|' || key==',' || key == '.' || key == '(' || key == ')' || key == 'e') 
      {
    eqs.get(whichEquationSelected-1).addToEq(""+key);
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
        eqs.get(whichEquationSelected-1).removeFromEq();
      }
    }
    
    // all the function buttons (left block) 
    if (mouseX>=230 && mouseX<=310 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("x");
    }
    if (mouseX>=315 && mouseX<=395 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("y");
    }
    if (mouseX>=400 && mouseX<=480 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("^2");
    }
    if (mouseX>=485 && mouseX<=565 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("^");
    }
    
    if (mouseX>=230 && mouseX<=310 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq("(");
    }
    if (mouseX>=315 && mouseX<=395 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq(")");
    }
    if (mouseX>=400 && mouseX<=480 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq("<");
    }
    if (mouseX>=485 && mouseX<=565 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq(">");
    }
    
    if (mouseX>=230 && mouseX<=310 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq("|");
    }
    if (mouseX>=315 && mouseX<=395 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq(",");
    }
    if (mouseX>=400 && mouseX<=480 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq("<=");
    }
    if (mouseX>=485 && mouseX<=565 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq(">=");
    }
    
    if (mouseX>=230 && mouseX<=310 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).addToEq("");
    }
    if (mouseX>=315 && mouseX<=395 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).addToEq("?");
    }
    if (mouseX>=400 && mouseX<=480 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).addToEq("√");
    }
    if (mouseX>=485 && mouseX<=565 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).addToEq("π");
    }
    
    // all the number buttons (middle block)
    if (mouseX>=625 && mouseX<=705 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("7");
    }
    if (mouseX>=710 && mouseX<=790 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("8");
    }
    if (mouseX>=795 && mouseX<=875 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("9");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=660 && mouseY<=705) {
      eqs.get(whichEquationSelected-1).addToEq("/");
    }
    
    if (mouseX>=625 && mouseX<=705 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq("4");
    }
    if (mouseX>=710 && mouseX<=790 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq("5");
    }
    if (mouseX>=795 && mouseX<=875 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq("6");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=710 && mouseY<=755) {
      eqs.get(whichEquationSelected-1).addToEq("*");
    }
    
    if (mouseX>=625 && mouseX<=705 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq("1");
    }
    if (mouseX>=710 && mouseX<=790 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq("2");
    }
    if (mouseX>=795 && mouseX<=875 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq("3");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=760 && mouseY<=805) {
      eqs.get(whichEquationSelected-1).addToEq("-");
    }
    
    if (mouseX>=625 && mouseX<=705 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).addToEq("0");
    }
    //if (mouseX>=710 && mouseX<=790 && mouseY>=810 && mouseY<=855) {
    //  eqs.get(whichEquationSelected-1).addToEq(".");
    //}
    if (mouseX>=795 && mouseX<=875 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).addToEq("=");
    }
    if (mouseX>=880 && mouseX<=960 && mouseY>=810 && mouseY<=855) {
      eqs.get(whichEquationSelected-1).addToEq("+");
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
  whichEquationSelected++;
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
 int start;
 strokeWeight(5);
 
 if (equationsBarOpen) {
   origin = 940;
   start = 440;
 }

 else {
   origin = 720;
   start = 0;
 }
 
 for (int i=0; i<numEquations; i++) {
   Equation equ = eqs.get(i);
   stroke(colors[i%7]);
   
   if (!equ.toString().equals("") && equ.validCheck()) {
     // if the Equation is not empty
     for (int j=start; j<1440; j++) {
       float x = (j - origin) * zoomLevel / 100.0;
       float y = 460 - (100.0f / zoomLevel) * (float)equ.evaluate(x);
       if (y > 50){
         point(j,y);
       }
     }
   }
 }
}

void draw() {
}
