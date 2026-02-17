import java.util.*;
import java.io.*;

class QuerySeriesGenerator {
    public static List<Integer[]> getQueries() {
        Scanner in = new Scanner(System.in);
        ArrayList<Integer[]> queries = new ArrayList<Integer[]>();
        Integer noOfQueries = in.nextInt();

        in.nextLine();
        for (int i = 0; i < noOfQueries; i++) {
            queries.add(new Integer[] {
                    in.nextInt(), in.nextInt(), in.nextInt()
            });
        }
        in.close();

        return queries;
    }

    public static String generateSeries(Integer a, Integer b, Integer n) {
        Integer kElement = a;
        String series = "";

        for (int i = 0; i < n; i++) {
            kElement += new Double(Math.pow(2, i) * b).intValue();
            series += " " + kElement;
        }
        return series.trim();
    }

    public static String generateSeries(Integer[] query) {
        return generateSeries(query[0], query[1], query[2]);
    }

    public static void main(String[] argh) {
        List<Integer[]> queries = getQueries();
        for (Integer[] query : queries) {
            System.out.println(generateSeries(query));
        }
    }
}
