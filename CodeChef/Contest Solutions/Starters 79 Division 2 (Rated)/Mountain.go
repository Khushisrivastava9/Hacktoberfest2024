package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	var n, m, q int64
	fmt.Scan(&n, &m, &q)

	in := bufio.NewReader(os.Stdin)
	for i := int64(0); i < q; i++ {
		var x int64
		fmt.Fscan(in, &x)

		t := int64(0)
		for t < n {
			if x > t {
				x -= t + 1
			} else {
				break
			}
			t++
		}
		fmt.Println("1", t)

		a := make([]int64, 0)
		for t >= 1 {
			a = append(a, min(x/t, m-1))
			x -= a[len(a)-1] * t
			t--
		}
		for i := len(a) - 1; i >= 0; i-- {
			fmt.Print(a[i]+1, " ")
		}
		fmt.Println()
	}
}

func min(a, b int64) int64 {
	if a < b {
		return a
	}
	return b
}
