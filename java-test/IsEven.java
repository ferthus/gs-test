
public class IsEven {

    public static Boolean isEven(Integer number) {
        return !( (number / 2) * 2 == number );
    }

    public static void main(String[] args) {
        Integer input = Integer.parseInt(args[0]);
        System.out.println(isEven(input));
    }
}