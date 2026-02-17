import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;
import static java.util.stream.Collectors.toList;

public class SmallestAndLargestString {

    public static String getSmallestAndLargest(String s, int k) {
        var subs = new java.util.ArrayList<String>();
        for (int i = 0; i + k <= s.length(); subs.add(s.substring(i, i + k)), i++)
            ;
        subs = subs.stream().sorted((s1, s2) -> s1.compareTo(s2)).collect(toList());
        return subs.get(0) + "\n" + subs.get(subs.size() - 1);
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String s = scan.next();
        int k = scan.nextInt();
        scan.close();
        System.out.println(getSmallestAndLargest(s, k));
    }
}
