class OverloadingExample {
    public static void printNumber(String input) {
        System.out.println("Converting to number format...");
        printNumber(Integer.parseInt(input));
    }

    public static void printNumber(Integer input) {
        System.out.println(input);
    }

    public static void main(String[] args) {
        printNumber("123");
        printNumber(456);
    }
}