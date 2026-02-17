import java.util.*;
import java.io.*;

class FitNumberDataStructure {
    public static void main(String[] argh) {
        Scanner sc = new Scanner(System.in);
        int no_input = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < no_input; i++) {
            String xString = sc.nextLine();
            try {
                Long x = Long.parseLong(xString);

                System.out.println(xString + " can be fitted in:");
                if (x >= (-1) * Math.pow(2, 7) && x <= Math.pow(2, 7) - 1)
                    System.out.println("* byte");
                if (x >= (-1) * Math.pow(2, 15) && x <= Math.pow(2, 15) - 1)
                    System.out.println("* short");
                if (x >= (-1) * Math.pow(2, 31) && x <= Math.pow(2, 31) - 1)
                    System.out.println("* int");
                if (x >= (-1) * Math.pow(2, 63) && x <= Math.pow(2, 63) - 1)
                    System.out.println("* long");
            } catch (Exception e) {
                System.out.println(xString + " can't be fitted anywhere.");
            }
        }
    }
}
