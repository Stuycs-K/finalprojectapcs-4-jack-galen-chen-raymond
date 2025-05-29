import java.util.Stack;

public class Equation {
  private static String eq;

  public Equation(String s) {
    eq = s;
  }

  public static void main(String[] args) {
    Equation e = new Equation("1 + 4 + (30 * 6 - 5) / 5");
    e.convert();

  }

  public void convert() {
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
    System.out.println(vals.pop());
  }


  private static boolean isOperator(char ch) { //Conditional to make sure the character is one we want
    return ch == '+' || ch == '-' || ch == '*' || ch == '/';
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
    }
  }

  private static int precedence(char op) { //Allows the code to look back at previous terms
    if (op == '+' || op == '-') {
        return 1;
    } else if (op == '*' || op == '/') {
        return 2;
    } else {
        return 0;
    }
  }
}