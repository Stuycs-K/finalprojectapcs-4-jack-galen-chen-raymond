import java.util.Stack;
public class Equation {
  private String eq;
  private double pi = 3.14159265358979323846264338327950288419716939937510;
  private double e = 2.718281828459045235360287471352662497757247093699959574966;
  private int whichColor = (int)(Math.random()*8);
  private int cursorPos;
  private boolean isNote = false;
  
  public Equation() {
    eq = "";
  }

  public boolean isNote() {
    return isNote;
  }
  
  public boolean setNote(boolean note) {
    isNote = note;
  }
  
  public void addToEq(String s){
    if (cursorPos == eq.length()) {
      // if adding to end of equation
      eq+=s;
      cursorPos+=(s.length());
    }
    
    else if (cursorPos == 0) {
      // if adding to beginning of equation
      eq = s+eq;
      cursorPos+=1;
    }
    
    else {
      eq = eq.substring(0, cursorPos)+s+eq.substring(cursorPos);
      cursorPos+=1;
    }
  }
  
  public void removeFromEq() {
    if (cursorPos > 0) {
      eq = eq.substring(0, cursorPos-1) + eq.substring(cursorPos);
      cursorPos-=1;
    }
  }
  
  public void setEq(String s) {
    eq = s;
  }
  
  public String toString() {
    return eq;
  }
  
  public int getColor() {
    return whichColor;
  }
  
  public void changeColor() {
    if (whichColor>=7) {
      whichColor=0;
    }
    else {
      whichColor++;
    }
  }
  
  public int getCursorPos() {
    return cursorPos;
  }
  
  public void decCursorPos() {
    cursorPos -= 1;
  }
  
  public void incCursorPos() {
    cursorPos += 1;
  }
  
  public void setCursorPos(int pos) {
    cursorPos = pos;
  }

  public double evaluate(double x) {
    Stack<Character> ops = new Stack<>();
    Stack<Double> vals = new Stack<>();
    String num = "";
    boolean negate = true;
    for (int i = 0; i < eq.length(); i++) {
      char ch = eq.charAt(i);

      if (Character.isWhitespace(ch)) { //Ignores spaces 
        continue;
      }
      if (Character.isDigit(ch) || ch == '.') { //Checks for digits
        num += ch; //This works by "buildng" num and then resetting it as appropriate
        negate = false;
      }
      else if (ch == 'x') {
        if (!num.isEmpty()) {
          vals.push(Double.parseDouble(num));
          num = "";
        }
        vals.push(x); // push x's value directly to stack
        negate = false;
      }
      else if (ch == 'π') {
        if (!num.isEmpty()) {
          vals.push(Double.parseDouble(num));
          num = "";
        }
        // System.out.println("pi");
        vals.push(pi); // push x's value directly to stack
        negate = false;
      }
      else if (ch == 'e') {
        if (!num.isEmpty()) {
          vals.push(Double.parseDouble(num));
          num = "";
        }
        // System.out.println("E");
        vals.push(e); // push x's value directly to stack
        negate = false;
      }
      else if (ch == '-' && negate) {
        num += ch; 
        negate = false;
      } 
      else { // we're checking if 
        if (!num.isEmpty()) {
          vals.push(Double.parseDouble(num));
          num = "";
        }

        if (ch == '(') {
          ops.push(ch);
          negate = true;
        } 
        else if (ch == ')') {
          while (!ops.isEmpty() && ops.peek() != '(') { //when you reach the end of the expression, go through and apply everything
            applyOp(ops, vals);
          }
          if (!ops.isEmpty()) {
            ops.pop(); 
          }
          negate = false;
        } 
        else if (isOperator(ch)) {
          while (!ops.isEmpty() && precedence(ops.peek()) >= precedence(ch)) {
            applyOp(ops, vals);
          }
          ops.push(ch);
          negate = true;
        }
      }
    }

    if (!num.isEmpty()) {
      vals.push(Double.parseDouble(num));
    }

    while (!ops.isEmpty()) {
      applyOp(ops, vals);
    }
    return vals.pop();
  }

  public boolean validCheck() {
    if (eq == null || eq.isEmpty()) return false;
  
    int parenCount = 0;
    boolean lastWasOp = true;
    boolean lastWasDeci = false;
  
    for (int i = 0; i < eq.length(); i++) {
      char ch = eq.charAt(i);
  
      if (Character.isWhitespace(ch)) continue;
  
      if (ch == '(') {
        parenCount++;
        lastWasOp = true;
        lastWasDeci = false;
      } else if (ch == ')') {
        parenCount--;
        if (parenCount < 0) return false;
        lastWasOp = false;
        lastWasDeci = false;
      } else if (isOperator(ch)) {
        if (lastWasOp && ch != '-') return false;
        lastWasOp = true;
        lastWasDeci = false;
      } else if (ch == '.') {
        if (lastWasDeci) return false;
        lastWasDeci = true;
        lastWasOp = false;
      } else if (Character.isDigit(ch) || ch == 'x' || ch == 'e' || ch == 'π') {
        lastWasOp = false;
        lastWasDeci = false;
      } else {
        return false;
      }
    }
    return !lastWasOp && parenCount == 0;
  }
  private static boolean isOperator(char ch) { //Conditional to make sure the character is one we want
    return ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^';
  }

  private static void applyOp(Stack<Character> ops, Stack<Double> vals) {
    if (vals.size() < 2) return;

    double b = vals.pop();
    double a = vals.pop();
    char op = ops.pop();

    if (op == '+') {   //Checks what the operation is, applies the appropriate operation
        vals.push(a + b);
    } else if (op == '-') {
        vals.push(a - b);
    } else if (op == '*') {
        vals.push(a * b);
    } else if (op == '/') {
        vals.push(a / b);
    } else if (op == '^') {
      vals.push(Math.pow(a,b));
    }
  }

  private static int precedence(char op) { //Allows the code to look back at previous terms
    if (op == '+' || op == '-') {
        return 1;
    } else if (op == '*' || op == '/') {
        return 2;
    } else if (op == '^'){
        return 3;
    }
    else {
        return 0; 
    }
  }
}
