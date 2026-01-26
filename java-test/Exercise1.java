import java.util.HashMap;
import java.util.HashSet;

class Exercise1 {

  /**
   * remove duplicated words from a string
   */
  public static String solution2(String input) {
    String[] words = input.trim().split(" ");
    HashSet<String> wordsSet = new HashSet<String>();
    String result = "";
    
    for(String word: words) {
      if(wordsSet.add(word)){
        result += " " + word;
      }
    }

    return result.trim();
  }

  public static void main(String[] args) {
    String input = "hi hi hi world from Ricardo Bermudez Bermudez computer";
    String result = solution2(input);
    System.out.println(result);
  }
}