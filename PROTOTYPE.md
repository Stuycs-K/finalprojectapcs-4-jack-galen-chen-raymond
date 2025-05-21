
# Technical Details:

The user interface will replicate Desmos'. There will be a bar on the left where the user can input equations into the graphing calculator. There will be a bar on the bottom of the screen where symbols like the square root symbol and absolute value bars can be accessed. The majority of the screen will be taken up by the graph itself, and there will be buttons in the top right to zoom in and out of the graph. 

We hope to have a few other features as well. These include allowing the user to change the color of a graph, incorporating all the available functions in Desmos (such as sine, cosine, logarithms, etc.), allowing the user to manually change the scale and dimensions of the graph, and incorporating polar functions and the polar grid. We also hope to have the feature in Desmos where clicking on the graph can reveal the coordinates of the point that was clicked on. Another feature would be the slider that is available for variables that are not defined in the equations bar, and the reverse contrast mode.

Mostly, these will be using a mouseclicked() method and finding the coordinates in order to function (since zooming in/out, using the function buttons, etc. requires clicking). The keypressed() method along with the key variable created by it will be used to log the keys pressed so that the user can type in an equation. Colors will, of course, be used to change the colors of the graphs. Reverse contrast mode can be achieved with a kernel, as done in class. 

A 2D ArrayList will be used to keep track of the equations on the left side of the screen. The current index of the 2D array will change based on which equation slot is selected by the user, and each subarray in the 2D ArrayList will be an equation, written by the user and displayed in a slot on the left. With the index, each equation can be selected and modified by the user. To plot the graphs, we will compute the f(x) value for each x over the range of the graph (with the x values in an increment that yields the most continuous graph while not sacrificing runtime), and plot each point. Each point will also be saved in an arraylist to make deleting the graph easier. The draw() method will redraw the screen based on the 2D arraylist of whenever a modification is made to it (e.g. changing an equation, zooming out on the graph, etc.). Deleting a graph (if an equation is deleted, if an equation is invalid, etc.) will be done by looping over the arraylist of points for the graph, coloring each point white, and redrawing the grid and other graphs. 

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.


    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

