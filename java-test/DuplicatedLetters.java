
/*
 * Click `Run` to execute the snippet below!
 */
import java.io.*;
import java.util.*;

/*
 * To execute Java, please define "static void main" on a class
 * named Solution.
 *
 * If you need more classes, simply define them inline.
 *
 *
 * Can you implement a method to udentify the given string has duplicate charecters or not.
 * Example: String str1 = "apple"; Output true
 * String str2 = "abcdf"; Output false
 */
class DuplicatedLetters {
    public static boolean solution(String input) {
        char[] letters = input.toCharArray();
        HashSet<Character> bucket = new HashSet<Character>();
        for (char letter : letters) {
            if (bucket.contains(letter)) {
                return true;
            }
            bucket.add(letter);
        }
        return false;
    }

    public static boolean solution2(String input) {
        HashSet<Character> bucket = new HashSet<Character>();
        for (int i = 0; i < input.length(); i++) {
            if (bucket.contains(input.charAt(i))) {
                return true;
            }
            bucket.add(input.charAt(i));
        }
        return false;
    }

    public static void main(String[] args) {
        String input = "apple";
        System.out.println(letters(input));
    }
}