function countLargestGroup(n: number): number {
    let result = 0;
    let map: number[][] = [];

    for (let i = 1; i <= n; i++) {
        let num = i;
        let localSum = 0;

        while (num > 9) {
            localSum += num % 10;
            num = (num - num % 10) / 10;
        }
        localSum += num;

        map[localSum] ? map[localSum].push(i) : map[localSum] = [i];
    }

    let highest = 0;
    map.forEach(m => {
        if (m.length > highest) {
            highest = m.length;
            result = 0;
        }

        m.length == highest ? result++ : null;
    });

    console.debug(map);

    return result;
};

// console.log(countLargestGroup(13));
// console.log(countLargestGroup(2));
console.log(countLargestGroup(24)); // 5