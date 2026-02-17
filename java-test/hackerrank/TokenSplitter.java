import java.io.*;
import java.util.*;
import static java.util.stream.Collectors.toList;

public class Solution {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String input = scan.nextLine();
        scan.close();
        List<String> tokens = new ArrayList<String>();

        for (String token : input.split("[^a-zA-Z]")) {
            var t = token.length() > 0 && tokens.add(token);
        }

        System.out.println(tokens.size());
        tokens.forEach(System.out::println);
    }
}

public class Solution2 {
    public static void main(String[] args) {
        var scan = new Scanner(System.in);
        var input = scan.nextLine();
        scan.close();
        var tokens = Arrays
                .asList(input.split("[^a-zA-Z]"))
                .stream().filter(t -> t.length() > 0).collect(toList());
        System.out.println(tokens.size());
        tokens.forEach(System.out::println);
    }
}

public class Solution3 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String input = scan.nextLine();
        scan.close();
        List<String> tokens = new ArrayList<String>();

        for (String token : input.split("[^a-zA-Z]")) {
            if (token.length() > 0) {
                tokens.add(token);
            }
        }

        System.out.println(tokens.size());
        tokens.forEach(System.out::println);
    }
}
