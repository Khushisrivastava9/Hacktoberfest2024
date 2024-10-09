package main

import (
	"fmt"
)

/*
	Problem: https://www.codechef.com/problems/BITEQU
	Logic:
		* We iterate through all the bits of the number (from 0 to 59)
		* For each bit, if it is not set in the number, we set it in one of the 3 variables (ans[0], ans[1], ans[2])
		* If the third variable (ans[2]) is set, we also set the same bit in the fourth variable (ans[3])
		* At the end, we check if the equation (ans[0] & ans[1]) | ans[2] ^ ans[3] is equal to the original number
		* If it is, we print the four numbers, otherwise we print -1
*/

func solve() {
	var n int64
	fmt.Scan(&n)

	if n == 0 {
		fmt.Println(1, 3, 4, 5)
		return
	}

	// Initialize the four variables with the original number
	ans := [4]int64{n, n, n, 0}

	// Iterate through all the bits of the number
	for i := int64(0); i < 60; i++ {
		// If the bit is not set in the number, set it in one of the three variables
		if n&(1<<i) == 0 {
			// Set the bit in the first variable if it is not set
			if ans[0]&(1<<i) == 0 {
				ans[0] += 1 << i
			} else if ans[1]&(1<<i) == 0 {
				// Set the bit in the second variable if it is not set
				ans[1] += 1 << i
			} else {
				// Set the bit in the third variable if it is not set
				ans[2] += 1 << i
				// Set the same bit in the fourth variable
				ans[3] += 1 << i
			}
		}
	}

	// Check if the equation is satisfied
	if ((ans[0]&ans[1])|ans[2])^ans[3] != n {
		fmt.Println(-1)
		return
	}

	// Print the four numbers
	for _, i := range ans {
		fmt.Print(i, " ")
	}
	fmt.Println()
}

func main() {
	var T int
	fmt.Scan(&T)

	for i := 0; i < T; i++ {
		solve()
	}
}
