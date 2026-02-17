import java.io.*;
import java.util.*;

public class SquareArea {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Integer bread = in.nextInt();
        in.nextLine();
        Integer height = in.nextInt();
        in.close();
        if (bread <= 0 || height <= 0) {
            System.out.println("java.lang.Exception: Breadth and height must be positive");
        } else {
            System.out.println(bread * height);
        }
    }
}