import java.util.Stack;

public class Equation {
  private static String eq;

  public Equation(String s) {
    eq = s;
  }

  public static void main(String[] args) {
    Equation e = new Equation("1+4+(30*6)");
    e.convert();

  }

  public void convert(String stringInput) {
    Stack<Character> ops = new Stack<>();
    Stack<Double> vals = new Stack<>();
    String num = "";
    boolean negate = true;
    for (int i = 0; i < eq.length(); i++) {
      char ch = eq.charAt(i);

      if (Character.isWhitespace(ch)) {
        continue;
      }

      if (Character.isDigit(ch) || ch == '.') {
        num += ch;
        expectingUnary = false;
      } else if (ch == '-' && expectingUnary) {
        num += ch; 
        expectingUnary = false;
      } else {
        if (!num.isEmpty()) {
          vals.push(Double.parseDouble(num));
          num = "";
        }

        if (ch == '(') {
          ops.push(ch);
          expectingUnary = true;
        } else if (ch == ')') {
          while (!ops.isEmpty() && ops.peek() != '(') {
            applyOp(ops, vals);
          }
          if (!ops.isEmpty()) {
            ops.pop(); 
          }
          expectingUnary = false;
        } else if (isOperator(ch)) {
          while (!ops.isEmpty() && precedence(ops.peek()) >= precedence(ch)) {
            applyOp(ops, vals);
          }
          ops.push(ch);
          expectingUnary = true;
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
}


private static void getComp(Stack<String> ops, Stack<Double> vals) {
  String op = ops.pop();
  if (op.equals("+")) {
    vals.push(vals.pop() + vals.pop());
  } else if (op.equals("*")) {
    vals.push(vals.pop() * vals.pop());
  }
}
