package main

import (
	"fmt"
)

func main() {
	fmt.Println(countLargestGroup(24))
}

func countLargestGroup(n int) int {
	result := 0
	var curMap [][]int = make([][]int, n)

	for i := range curMap {
		curMap[i] = make([]int, n)
	}

	for i := 1; i <= n; i++ {
		num := i
		localSum := 0

		for num > 9 {
			localSum += num % 10
			num = (num - num%10) / 10
		}

		localSum += num

		curMap[localSum] = append(curMap[localSum], i)
	}

	highest := 0

	for _, element := range curMap {
		if len(element) > highest {
			highest = len(element)
			result = 0
		}

		if len(element) == highest {
			result += 1
		}
	}

	return result
}
