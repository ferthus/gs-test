import java.io.*;
import java.util.*;

public class LineNumber {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = 1;
        while (in.hasNext()) {
            System.out.println(n++ + " " + in.nextLine());
        }
    }
}