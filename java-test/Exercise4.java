import java.io.*;
import java.util.*;
import java.util.stream.*;
import static java.util.stream.Collectors.toList;

/**
 * Problem:
 * 
 * Sort an array in ascending order taking care of following restrictions:
 *  - Odd cells should be used to store positive numbers and zero;
 *  - Even cells should be used to store negative values;
 *  - Repeated values ​​should be ignored;
 *  - If there are more negative numbers than positive numbers or vice versa, 
 *    the remaining numbers must be added to the end of the array in ascending order.
 * 
 * Examples:
 * 1:
 *  Input: [-5, 1, 2, 10, -3, 1]
 *  Output: [1, -5, 2, -3, 10]
 * 
 * 2:
 *  Input: [-1, -8, -3, 3, 0, 1]
 *  Output: [0, -8, 1, -3, 3, -1]
 * 
 * 3:
 *  Entry: [-1, -8, -3, 3, 0, 1, 5, 4, 4, 4, 10, 11]
 *  Output: [0, -8, 1, -3, 3, -1, 4, 5, 10, 11]
 * 
 * 4:
 *  Entry: [-1, -8, -3, 3, 0, 1, 5, 4, 11, -2, -11, -7, -6, -5, -4]
 *  Output: [0, -11, 1, -8, 3, -7, 4, -6, 5, -5, 11, -4, -3, -2, -1]
 */
public class Exercise4 {

  public static List<Integer> applyStoreRules(List<Integer> input) {
    ArrayList<Integer> result = new ArrayList();

    List<Integer> cleanedInput = input.stream().distinct().sorted().collect(toList());
    List<Integer> positives = cleanedInput.stream().filter(n -> n >= 0).collect(toList());
    List<Integer> negatives = cleanedInput.stream().filter(n -> n < 0).collect(toList());

    for (Integer positive: positives) {
      result.add(positive);
      if (negatives.size()>0) {
        result.add(negatives.remove(0));
      }
    }

    result.addAll(negatives);
    return result;
  }

  public static void main(String [] args) {
    List<Integer> input = Arrays.asList(new Integer[]{-5, 1, 2, 10, -3, 1});
    List<Integer> output = applyStoreRules(input);

    System.out.println("Input: " + input);
    System.out.println("Output: " + output);
  }
}