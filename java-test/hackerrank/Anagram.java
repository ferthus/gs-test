import java.util.Scanner;
import java.util.HashMap;
import java.util.Optional;

public class Anagram {

    public static java.util.HashMap<Character, Integer> getFrequencies(String input) {
        var bucket = new HashMap<Character, Integer>();
        for (Character letter : input.toLowerCase().toCharArray()) {
            int counter = Optional.ofNullable(bucket.get(letter)).orElse(0);
            bucket.put(letter, counter + 1);
        }
        return bucket;
    }

    static boolean isAnagram(String a, String b) {
        if (a.length() != b.length()) {
            return false;
        }
        var aFrequencies = getFrequencies(a);
        var bFrequencies = getFrequencies(b);
        for (char letter : aFrequencies.keySet()) {
            Integer bLetterFrequecy = bFrequencies.get(letter);
            if (!bLetterFrequecy || bLetterFrequecy != aFrequencies.get(letter)) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        String a = scan.next();
        String b = scan.next();
        scan.close();
        boolean ret = isAnagram(a, b);
        System.out.println((ret) ? "Anagrams" : "Not Anagrams");
    }
}
