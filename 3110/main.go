package main

func scoreOfString(s string) int {
	res := 0

	for i := 0; i < (len(s) - 1); i++ {
		temp := int(s[i]) - int(s[i+1])

		if temp >= 0 {
			res += temp
		} else {
			res += (temp * -1)
		}
	}

	return res
}

func main() {
	println(scoreOfString("hello"))
}
