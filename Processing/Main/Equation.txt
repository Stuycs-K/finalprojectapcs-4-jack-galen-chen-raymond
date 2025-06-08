import java.util.Stack;
public class Equation {
  private String eq;
  private String evalEq = "";
  private double pi = 3.14159265358979323846264338327950288419716939937510;
  private double e = 2.718281828459045235360287471352662497757247093699959574966;
  private int whichColor = (int)(Math.random()*8);

  public Equation() {
    eq = "";
  }

  public void changeEq() {
    evalEq = "";
    int j = 0;
    while (j < eq.length() - 1) {
      char ch1 = eq.charAt(j);
      char chNext = eq.charAt(j + 1);
      evalEq += ch1;
      if ((Character.isDigit(ch1) && chNext == '(') ||
          (ch1 == ')' && Character.isDigit(chNext)) ||
          (ch1 == ')' && chNext == '(') ||
          (chNext == 'x' && Character.isDigit(ch1)) ||
          (chNext == 'x' && ch1 == 'x')) {
        evalEq += "*";
      }
      j++;
    }
    if (!eq.isEmpty()) {
      evalEq += eq.charAt(eq.length() - 1);
    }
    System.out.println(evalEq);
  }

  public void addToEq(String s){
    eq += s;
    changeEq();
  }

  public void removeFromEq(){
    if (!eq.isEmpty()) {
      eq = eq.substring(0, eq.length() - 1);
      if (!eq.isEmpty()) changeEq();
    }
  }

  @Override
  public String toString() {
    return eq;
  }

  public int getColor() {
    return whichColor;
  }

  public void changeColor() {
    whichColor = (whichColor + 1) % 8;
  }

  public double evaluate(double x) {
    Stack<Character> ops = new Stack<>();
    Stack<Double> vals = new Stack<>();
    String num = "";
    boolean negate = true;
    int absCount = 0;

    for (int i = 0; i < evalEq.length(); i++) {
      char ch = evalEq.charAt(i);

      if (Character.isWhitespace(ch)) {
        continue;
      }
      if (Character.isDigit(ch) || ch == '.') {
        num += ch;
        negate = false;
      }
      else if (ch == 'x' || ch == 'π' || ch == 'e') {
        if (!num.isEmpty()) {
          vals.push(Double.parseDouble(num));
          num = "";
        }
        if (ch == 'x')      vals.push(x);
        else if (ch == 'π') vals.push(pi);
        else                vals.push(e);
        negate = false;
      }
      else if (ch == '-' && negate) {
        num += ch;
        negate = false;
      }
      else {
        if (!num.isEmpty()) {
          vals.push(Double.parseDouble(num));
          num = "";
        }

        if (ch == '(') {
          ops.push(ch);
          negate = true;
        }
        else if (ch == ')') {
          while (!ops.isEmpty() && ops.peek() != '(') {
            applyOp(ops, vals);
          }
          if (!ops.isEmpty()) ops.pop();
          negate = false;
        }
        else if (ch == '|') {
          if (absCount == 0) {
            ops.push(ch);
            absCount++;
            negate = true;
          } else {
            while (!ops.isEmpty() && ops.peek() != '|') {
              applyOp(ops, vals);
            }
            if (!ops.isEmpty()) ops.pop();
            if (!vals.isEmpty()) {
              double v = vals.pop();
              vals.push(Math.abs(v));
            }
            absCount--;
            negate = false;
          }
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
      if (ops.peek() == '|') {
        ops.pop();
        continue;
      }
      applyOp(ops, vals);
    }
    return vals.isEmpty() ? 0 : vals.pop();
  }

  public boolean validCheck() {
    if (evalEq == null || evalEq.isEmpty()) return false;

    int parenCount = 0, absCount = 0;
    boolean lastWasOp = true, lastWasDeci = false, lastWasVar = false;

    for (int i = 0; i < evalEq.length(); i++) {
      char ch = evalEq.charAt(i);
      if (Character.isWhitespace(ch)) continue;

      if (Character.isDigit(ch) && lastWasVar) return false;
      if (ch == '(') {
        parenCount++; lastWasOp = true; lastWasDeci = false; lastWasVar = false;
        if (parenCount >= evalEq.length()/2.0) return false;
      }
      else if (ch == '|') {
        if (absCount == 0) { absCount++; lastWasOp = true; }
        else            { absCount--; lastWasOp = false; }
        lastWasDeci = false; lastWasVar = false;
      }
      else if (ch == ')') {
        parenCount--; if (parenCount < 0) return false;
        lastWasOp = false; lastWasDeci = false; lastWasVar = false;
      }
      else if (isOperator(ch)) {
        if (lastWasOp && ch != '-') return false;
        lastWasVar = false; lastWasOp = true; lastWasDeci = false;
      }
      else if (ch == '.') {
        if (i == evalEq.length() - 1 || lastWasDeci) return false;
        lastWasVar = false; lastWasDeci = true; lastWasOp = false;
      }
      else if (Character.isDigit(ch) || ch == 'x' || ch == 'e' || ch == 'π') {
        lastWasVar = (ch == 'x');
        lastWasOp = false; lastWasDeci = false;
      }
      else return false;
    }

    return (!lastWasOp && parenCount == 0 && absCount == 0);
  }

  private static boolean isOperator(char ch) {
    return ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^';
  }

  private static void applyOp(Stack<Character> ops, Stack<Double> vals) {
    if (ops.isEmpty() || vals.size() < 2) return;
    char op = ops.pop();
    double b = vals.pop(), a = vals.pop();
    if (op == '+') {
      vals.push(a + b);
    } else if (op == '-') {
      vals.push(a - b);
    } else if (op == '*') {
      vals.push(a * b);
    } else if (op == '/') {
      vals.push(a / b);
    } else if (op == '^') {
      vals.push(Math.pow(a, b));
    } // stray '|' is ignored
  }

  private static int precedence(char op) {
    if (op == '+' || op == '-') {
      return 1;
    } else if (op == '*' || op == '/') {
      return 2;
    } else if (op == '^') {
      return 3;
    } else {
      return 0;
    }
  }
}
