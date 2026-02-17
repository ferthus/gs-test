import java.lang.reflect.Method;

class CalculatorImpl {
    public Double sum(Double a, Double b) {
        return a + b;
    }

    public Double diff(Double a, Double b) {
        return a - b;
    }

    public Double div(Double a, Double b)
            throws ArithmeticException {
        if (b == 0) {
            throw new ArithmeticException("Divisor must be greater than zero");
        }
        return a / b;
    }

    public Double mul(Double a, Double b) {
        return a * b;
    }
}

public class Calculator {
    public static void main(String[] args) {
        try {
            if (args.length < 2) {
                throw new IllegalArgumentException("Calc command requires 3 arguments");
            }

            String methodName = args[0];
            Double inputOne = Double.parseDouble(args[1]);
            Double inputTwo = Double.parseDouble(args[2]);

            CalculatorImpl calc = new CalculatorImpl();
            Method method = calc.getClass().getMethod(methodName, Double.class, Double.class);
            Double result = (Double) method.invoke(calc, inputOne, inputTwo);
            System.out.printf("%s(%.1f, %.1f) = %.1f\n", methodName, inputOne, inputTwo, result);
        } catch (NoSuchMethodException e) {
            System.err.println(
                    "Calculator operator not available: " + args[0] + ". Available operators: sum, diff, mul and div.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}