package main

import "fmt"

func main() {
	// a := []int{1, 9, 9}
	a := []int{9}
	fmt.Println(plusOne(a))
}

func plusOne(digits []int) []int {
	result := digits
	result[len(result)-1] = result[len(result)-1] + 1

	for i := (len(result) - 1); i > 0; i-- {
		if result[i] > 9 {
			result[i] = result[i] - 10
			result[i-1] = result[i-1] + 1
		}
	}

	if result[0] == 10 {
		result[0] = 0
		return append([]int{1}, result...)
	}

	return result
}
