import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;
import static java.text.NumberFormat.getCurrencyInstance;

public class CurrencyInstanceExample {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double payment = scanner.nextDouble();
        scanner.close();

        // Write your code here.
        System.out.println("US: " + getCurrencyInstance(Locale.US).format(payment));
        System.out.println("India: " + getCurrencyInstance(new Locale("en", "IN")).format(payment));
        System.out.println("China: " + getCurrencyInstance(Locale.CHINA).format(payment));
        System.out.println("France: " + getCurrencyInstance(Locale.FRANCE).format(payment));
    }
}