import java.io.*;
import java.util.*;

class Exercise2 {

  /**
   * FInd the maxNumber of a given numbers array
   */
  public static void firstProblem() {
    int[] numbers = {5,6,7,10,50,1,0};
    int maxNum = numbers[0];

    for(int number: numbers) {
      if (number > maxNum) {
        maxNum = number;
      }
    }

    System.out.println(maxNum);
  }

  /**
   * Remove duplicated values of a given array
   */
  public static void secondProblem(){
    int[] arr = {1, 5, 3, 3, 9, 2, 3};
    
    HashSet<Integer> checker = new HashSet<Integer>();
    ArrayList<Integer> result = new ArrayList<Integer>();

    for (int number: arr){
      if(checker.add(number)){
        result.add(number);
      }
    }

    System.out.println(result.toString());
  }


  public static void main(String[] args) {
    secondProblem();
  }
}
