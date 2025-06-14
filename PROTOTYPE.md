AP Computer Science Semester 2 pd. 4 \
Raymond Chen, Galen Jack \
The Desmos Duo \
This is a replica of the online graphing calculator Desmos. It will be able to take in user-inputted equations and graph them on a grid. There is an on-screen keyboard that can be accessed on the screen, and the grid can zoom in an out.

# Technical Details:

The user interface will replicate Desmos'. There will be a bar on the left where the user can input equations into the graphing calculator. There will be a bar on the bottom of the screen where symbols like the square root symbol, absolute value bars, and exponent can be accessed. The majority of the screen will be taken up by the graph itself, and there will be buttons in the top right to zoom in and out of the graph. 

We **hope** to have a few other features as well. These include allowing the user to change the color of a graph (**Added**), incorporating some of the available functions in Desmos (such as sine, cosine, logarithms, etc.) (**eventually decided not to add these functions** We did add absolute value and fractional/negative powers as well as constants such as pi however), allowing the user to manually change the scale and dimensions of the graph (**Added** though not with dimensions), and incorporating polar functions and the polar grid. (**Chose not to add:** We discovered that the base graphing calculator was difficult enough to code and that polar functions would likely not be feasible within our timeframe). We also hope to have the feature in Desmos where clicking on the graph can reveal the coordinates of the point that was clicked on. (**Added**) Another feature would be the slider that is available for variables that are not defined in the equations bar, and the reverse contrast mode. (**not added**)

Mostly, these will be using a mouseclicked() method and finding the coordinates in order to function (since zooming in/out, using the function buttons, etc. requires clicking). The keypressed() method along with the key variable created by it will be used to log the keys pressed so that the user can type in an equation. Colors will, of course, be used to change the colors of the graphs. Reverse contrast mode can be achieved with a kernel, as done in class. 

~~A 2D ArrayList~~ An ArrayList of Equations (updated) will be used to keep track of the equations on the left side of the screen. The current index of the ~~2D array~~ ArrayList will change based on which equation slot is selected by the user ~~and each subarray in the 2D ArrayList will be an equation~~. Each equation is written by the user and displayed in a slot on the left. With the index, each equation can be selected and modified by the user. To plot the graphs, we will compute the f(x) value for each x over the range of the graph (with the x values in an increment that yields the most continuous graph while not sacrificing runtime), and plot each point. ~~Each point will also be saved in an arraylist to make deleting the graph easier.~~ ~~The draw() method will redraw the screen based on the 2D arraylist of whenever a modification is made to it (e.g. changing an equation, zooming out on the graph, etc.).Deleting a graph (if an equation is deleted, if an equation is invalid, etc.) will be done by looping over the arraylist of points for the graph, coloring each point white, and redrawing the grid and other graphs.~~ Instead of draw() constantly running and slowing down the sketch, setup() will be called each time there is a modification from mouseClicked() or keyPressed().

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

![Alt text](UML.jpg?raw=true "First UML")
![Alt text](uml.png?raw=true "Updated UML")
![Updated UML 2.0](newUML.png?raw=true "Updated UML 2.0")
![Final UML](newUML.png?raw=true "Final UML")

The Main class has an ArrayList of equations ~~and a corresponding ArrayList of graphs (these will be indexed simultaneously so that edits to equations will show up as edits to the corresponding graph)~~. keyPressed() will mainly edit the equations, mouseClicked() will select equations and click on functions or graphs. addEq and removeEq will add a new equation or remove an equation, and the corresponding graph. Overall, the Main class implements functionality.

Most of the Screen class's methods were intended to be in the Main class (they are all intended for setting up the screen and drawing the UI), but the Main and Screen were separated for convenience and organization. The Screen class draws all the UI.

As for the Equation itself, it will have a String as a field and, and addToEq and ~~deleteFromEq~~ removeFromEq to edit the String. A cursor will allow for navigation within the equation string. (**new**) ~~makeGraph~~ graph() will create a graph based on the current equation String. Screen will display each Equation's String on the left, in the appropriate slot. A separate graph() object is not necessary.

We will use a two stack algorithm (one for vals, one for operations) in order to take in user input. We will use a precedence system in order to deal with PEMDAS. We will construct values as strings in order to deal with decimals and the evaluate function will be non static and take in the value of x at which it is evaluated (if it does not have an x, it evaluates as a simple expression) (**new**) We will use a private evalEq to store a version of the equation with explicit multiplication which is generated by parsing equations with implicit multiplication and adding in appropriate '*' symbols (**Added**). We will write a method to accurately determine wether a method is valid in order to decide wether not to graph it(**Added**)

~~The Graph object will contain the function (the Equation) and a set of points generated over the range of the graph displayed in an ArrayList. The Graph will have a method to display the graph, graph(), and a method to redo the points, redoPoints, when the equation is changed.~~

# Intended pacing:
May 24th:
- Equation should be completed and tested
  - Either of us can work on this, Equation on its own shouldn't be hard

May 26th: 
- Graph should be completed and tested
  - An optimal interval for generating points should be found by one person for redoPoints()
  - graph() should be able to be moved around on the screen and modified based on the size of the grid/the range of the grid
    - This should be collaborated on by both group members

May 28th:
- Desmos UI should be created
  - Both group members know what Desmos looks like and can work on this

May 29th:
- Integration into main:  
  - Equations and graphs should be linked and work with both classes
  - addEq and removeEq should be able to add and remove equations and their corresponding graphs
  - All of this should work with user input and keyPressed()

May 30th:
- mouseClicked():
  - UI should have the keyboard of functions on the bottom already
  - Now, mouseClicked() should be able to click on a ~~function~~ character or number and insert it into the selected equation

May 31st:
- More Desmos UI:
  - Zoom in/out should be done
  - Should be thoroughly tested by both group members to ensure the program is fast and works properly