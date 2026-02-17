import java.util.Scanner;

/**
 * Task
 * In this challenge, you must read integers from stdin 
 * and then print them to stdout. Each integer must be printed
 * on a new line. To make the problem a little easier, a portion
 * of the code is provided for you in the editor below.
 * 
 * nput Format
 * 
 * There are lines of input, and each line contains a single integer.
 * 
 * Sample Input
 * 
 * 42
 * 100
 * 125
 * 
 * Sample Output
 * 
 * 42
 * 100
 * 125
 * 
 */
class JavaStdInStdOut {
  public static void main(String[] args) {
    int[] input = new int[3];
    int numberOfInputs = input.length;
    Scanner scan = new Scanner(System.in);

    for(int i=0;i<numberOfInputs;i++){
      input[i] = scan.nextInt();
    }

    for(int i=0;i<numberOfInputs;i++){
      System.out.println(input[i]);
    }

    scan.close();
  }
}