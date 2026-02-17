import java.io.*;
import java.util.*;

public class PalindromicWordsEvaluator {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String A = sc.next();
        sc.close();

        System.out.println(
                new StringBuilder(A).reverse().toString().compareTo(A) == 0 ? "Yes" : "No");
    }
}
