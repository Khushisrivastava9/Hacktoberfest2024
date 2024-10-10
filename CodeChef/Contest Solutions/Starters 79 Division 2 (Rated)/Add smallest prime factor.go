package main

import (
	"bufio"
	"fmt"
	"os"
)

func leastPrimeFactor(n *int, m int, ans *int) {
	*ans++

	least_prime := make([]int, *n+1)

	least_prime[1] = 1

	for i := 2; i <= *n; i++ {
		if least_prime[i] == 0 {
			least_prime[i] = i
			for j := i * i; j <= *n; j += i {
				if least_prime[j] == 0 {
					least_prime[j] = i
				}
			}
		}
	}

	*n += least_prime[*n]
	if *n%2 != 0 && *n < m {
		leastPrimeFactor(n, m, ans)
	}
}

/*
main function reads input values and processes multiple test cases to compute and print the result based on specific conditions.

Intuition:
- The goal is to compute a result based on the smallest prime factor of a number and certain arithmetic operations.
- For each test case, we read two integers, n and m, and perform calculations based on their values and properties.

Logic:
 1. Read the number of test cases, t.
 2. For each test case:
    a. Read integers n and m.
    b. Initialize ans to 0.
    c. If n is odd and less than m, call the leastPrimeFactor function to update n and ans.
    d. If n is still less than m after the update:
    - If the difference (m - n) is odd, print ans + (m - n)/2 + 1.
    - If the difference (m - n) is even, print ans + (m - n)/2.
    e. If n is not less than m, print ans.

Algorithm:
- The algorithm involves reading input values, checking conditions, and performing arithmetic operations.
- The leastPrimeFactor function (not shown here) is assumed to update n and ans based on the smallest prime factor of n.
- The logic ensures that the result is computed correctly based on the properties of n and m.
*/
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Split(bufio.ScanWords)

	var t, n, m, ans int
	fmt.Scan(&t)

	for i := 0; i < t; i++ {
		fmt.Scan(&n, &m)
		ans = 0
		if n%2 != 0 && n < m {
			leastPrimeFactor(&n, m, &ans)
		}
		if n < m {
			if (m-n)%2 != 0 {
				fmt.Println(ans + (m-n)/2 + 1)
			} else {
				fmt.Println(ans + (m-n)/2)
			}
		} else {
			fmt.Println(ans)
		}
	}
}
