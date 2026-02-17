
class CheckAge {

  public static String checkAge(int age)
      throws Exception {
    if (age <= 18) {
      throw new Exception("You must be at least 18 years old.");
    }
    return "Access granted";
  }

  public static void main(String[] args) {
    int n = 17;
    try {
      System.out.println(checkAge(n));
    } catch (Exception e) {
      System.out.println("Access denied: " + e.getMessage());
    }
  }

}