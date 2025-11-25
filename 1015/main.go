package main

/*
Le but est de voir si la division de res / k est possible (sans reste), soit res % k == 0
Afin de produire res, on démarre à res = 1, puis res = res * 10 + 1
res pouvant devenir grand très rapidement, on calcule le modulo en direct, soit res = (res * 10 + 1) % k
Le calcul est possible par une propriété de congruence : (a * 10 + 1) % k = ((a % k) * 10 + 1) % k
 res ≡ (10^i + 10^i-1 + ... + 10^0) (mod k)
*/

func smallestRepunitDivByK(k int) int {
    if k % 2 == 0 || k % 5 == 0 {
        return -1
    }

	res := 0
	for i := 0; i < k; i++ {
        res = (res * 10 + 1) % k

        if res == 0 {
            return i + 1
        }
	}
    return -1
}

func main() {
	println(smallestRepunitDivByK(2))
	println(smallestRepunitDivByK(29))
}