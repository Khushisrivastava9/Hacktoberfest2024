import java.util.Scanner

/**
 * This program reads in t test cases, and for each one, it reads in two numbers, n and x.
 * It then prints out a string of n *'s and +'s and -'s such that the total sum of the
 * expression is x. If such an expression is not possible, it prints -1.
 */
fun main() {
    val scanner = Scanner(System.`in`)
    val t = scanner.nextInt()
    repeat(t) { solve(scanner) }
}

/**
 * This function reads in a single test case from the scanner and prints out the result
 * to the console.
 * @param scanner the scanner to read from
 */
fun solve(scanner: Scanner) {
    val n = scanner.nextLong()
    val x = scanner.nextLong()
    val tot = n + 1
    if ((1 - n) <= x && x <= (n + 1)) {
        // x is within the range of possible sums, so we can calculate the expression
        if (x < 0) {
            // x is negative, so we need to subtract from the total
            val ms = Math.abs(x) + 1
            val mul = n - ms
            // print the correct number of -'s and *'s
            repeat(ms.toInt()) { print("-") }
            repeat(mul.toInt()) { print("*") }
            println()
            return
        }
        if (x > 0) {
            // x is positive, so we need to add to the total
            val pl = Math.abs(x) - 1
            val mul = n - pl
            // print the correct number of +'s and *'s
            repeat(pl.toInt()) { print("+") }
            repeat(mul.toInt()) { print("*") }
            println()
            return
        }
        if (x == 0L) {
            // x is 0, so we just need to subtract 1 from the total
            val mul = n - 1
            repeat(mul.toInt()) { print("*") }
            println("-")
            return
        }
    }
    // if x is not within the range of possible sums, print -1
    println(-1)
}

