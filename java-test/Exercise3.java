/**
 * Given an unsorted array, sort it using ascending order approach and
 * find the smallest positive number which is not in array
 *
 * 1.
 * input: {-3,-2,1,3,2,7}
 * output 4
 */
import java.util.Arrays;
import java.util.List;

public class Solution {

	public static void main(String[] args) {
		List<int[]> myList = Arrays.asList(new int[] {-3,-2,1,3,2,7});
		
		myList.forEach(l -> System.out.println("The smallest positive number which is not in the array " + 
				Arrays.toString(l) + ", is: " + findSmallestPositiveNumber(l)));	
	}
	
	public static int findSmallestPositiveNumber(int[] numbers) {
		int resp = 0;
		
		Arrays.sort(numbers);
		
		int min = 0, index = 0;
		
		for(int i = 0; i < numbers.length; i++) {
			if(numbers[i] > 0) {
				min = numbers[i];
				index = i;
				break;
			}
		}		
		
		for(int i = min; i < numbers.length; i++) {
			if(i != numbers[index++]) {
				resp = i;
				break;
			}
		}
		
		return resp;
	}
}