public class FloatPrecisionAnalisys {
    // https://iamramishka.medium.com/the-surprising-truth-why-0-1-0-2-0-3-in-java-a99716560f35
    public static void main(String[] args) {
        System.out.println(0.1 + 0.2 - 0.3);
        System.out.println((0.1 + 0.2) == 0.3);
    }
}