# Dev Log:

This document must be updated daily every time you finish a work session.

## Galen Jack 





### 2025-05-27 - Getting Equation.java up and running
Today I worked on writing a preliminary version of Equation.java. The Equation class is constructed with
a string which is then evaluated using the convert method. The convert method takes in the instance variable 
for the string and returns the convert value. I don't yet have support for variables and equation is only working with 
addition. This took me 2 hours.

### 2025-05-28 - Expanding Equation.java
Expanded equation to take in multiple operators by using precedence which tracks
what the highest priority operators are. This took me 1 hour.

### 2025-05-29 - Adding support for variables to Equation.java
Added support for variables in the convert method which is now evaluate. Now we can call evaluate with a double value
which evaluates the equation at that value. I added add and remove methods to interface with the GUI. This took 45 minutes.

### 2025-05-30 - GRAPH!
I connected the GUI and Equation backend today! Now equations can be graphed with support for zoom but no support for input. This took me 1 hour.

### 2025-05-31 - More features for equation
Added support for parenthesis and ^ in equation.java. This meant adding a new precedence level and tracking parenthesis to check when they are closed and open.

### 2025-06-01 - Fixing bug where incomplete expressions would break the graph
Me and Raymond were struggling with an issue where our graph would break whenever we were typing 
in an expression because there would be moments where while typing the expression wouldn't be totally 
valid. In order to fix this, I added a method to Equation.java that checks if an equation is valid. 
I then called this before graphing in Main.pde. This took me 1 hour.

## 2025-06-02 - Dynamic step size
I improved our system for supporting constants including pi and e. I added support in the GUI for these constants so there is now the capability of typing in e and entering pi with the GUI.
This took me 1 hour.


## 2025-06-03 - Dynamic step size
I added support for Dynamic step size which adjusts the distance between points based on the difference between points. This works but it is inconsistant and buggy. I am fine tuning the rights values.
This took me 1 hour.

## 2025-06-04 - Dynamic step size
I improved support for Dynamic step size which makes equations smoother. I am still experiencing issues where one side is less smooth. 
This took me 45 minutes.

## 2025-06-06 - Line implementation
After spending a while trying out different ways of making the graphs smoother, I figured out that using lines was the best solution. This took 1 hour.

## 2025-06-08 - Absolute value, implied multiplication and many many bugfixes
I created a copy of the instance variable eq, evalEq which is invisible to the user. This version of the equation allows us to keep the equation looking clean for the user and readable for our code. As of right now, we parse the users input for implied multiplication and replace it with regular multiplication. I then added support for absolute value symbols which was extremely buggy and took a long time to get working. I fixed a number of bugs we've found over the past week which crash the program when specific sequences of characters are entered. I improved our system for figuring out if an equation should be graphed greatly, accounting for all sorts of ungraphable equations which might include empty parenthesis.
This took me 8 hours.

I believe this document accurately reflects the contributions of my teammate. ~Raymond Chen