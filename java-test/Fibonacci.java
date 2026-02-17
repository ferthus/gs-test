class Fibonacci {
  public static int solution(int n, int tabs) {
    for (int i = 0; i < tabs; System.out.print("\t"), i++)
      ;
    if (n <= 1) {
      System.out.printf("f(%d) = %d\n", n, n);
    } else {
      System.out.printf("f(%d) = f(%d) + f(%d)\n", n, n - 1, n - 2);
    }

    return n <= 1 ? n : solution(n - 1, tabs + 1) + solution(n - 2, tabs + 1);
  }

  public static long solution(int n) {
    return n <= 1 ? (long) n : solution(n - 1) + solution(n - 2);
  }

  public static long solution2(int n) {
    long prev1 = 1, prev2 = 0, tmp = -1;

    for (int i = 2; i <= n; i++) {
      tmp = prev1;
      prev1 = prev1 + prev2;
      prev2 = tmp;
    }

    return prev1;
  }

  public static void main(String[] args) {
    int n = Integer.parseInt(args[0]);
    long start = System.currentTimeMillis();
    System.out.printf("\n\nfibonacci(%d) = %d\n", n, solution(n));
    long end = System.currentTimeMillis();
    System.out.printf("Execution time: %,2d s\n", (end - start) / 1000);

    start = System.currentTimeMillis();
    System.out.printf("\n\nfibonacci(%d) = %d\n", n, solution2(n));
    end = System.currentTimeMillis();
    System.out.printf("Execution time: %,2d s\n", (end - start) / 1000);
  }
}

// f(6) = f(5) + f(4)
// = f(4) + f(3) + f(3) + f(2)
// = f(3) + f(2) + f(2) + f(1) + f(2) + f(1) + f(1) + f(0)
// = [f(2) + f(1)] + [f(1) + f(0)] + [f(1) + f(0)] + 1 + [f(1) + f(0)] + 1 + 1 +
// 0
// = [f(2) + 1] + [1 + 0] + [1 + 0] + 1 + [1 + 0] + 1 + 1 + 0
// = [[f(1) + f(0)] + 1] + [1 + 0] + [1 + 0] + 1 + [1 + 0] + 1 + 1 + 0
// = [1 + 0 + 1] + [1 + 0] + [1 + 0] + 1 + [1 + 0] + 1 + 1 + 0
// = 8

// f(6) = f(5) + f(4)
// = f(4) + f(3) + f(3) + f(2)
// = f(3) + f(2) + f(2) + f(1) + f(2) + f(1) + f(1) + f(0)
// = { [f(2) + f(1)] + [f(1) + f(0)] } + [f(1) + f(0) + f(1)] + [f(1) + f(0) +
// f(1)] + f(1) + f(0)
// = [f(2) + 1] + [1 + 0] + [1 + 0] + 1 + [1 + 0] + 1 + 1 + 0
// = [[f(1) + f(0)] + 1] + [1 + 0] + [1 + 0] + 1 + [1 + 0] + 1 + 1 + 0
// = [1 + 0 + 1] + [1 + 0] + [1 + 0] + 1 + [1 + 0] + 1 + 1 + 0
// = 8

// 102334155