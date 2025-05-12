/*
There are n dominoes in a line, and we place each domino vertically upright.
In the beginning, we simultaneously push some of the dominoes either to the left or to the right.

After each second, each domino that is falling to the left pushes the adjacent domino on the left.
Similarly, the dominoes falling to the right push their adjacent dominoes standing on the right.

When a vertical domino has dominoes falling on it from both sides, it stays still due to the balance of the forces.

For the purposes of this question, we will consider that a falling domino expends no additional force to a falling or already fallen domino.

You are given a string dominoes representing the initial state where:

    dominoes[i] = 'L', if the ith domino has been pushed to the left,
    dominoes[i] = 'R', if the ith domino has been pushed to the right, and
    dominoes[i] = '.', if the ith domino has not been pushed.

Return a string representing the final state.
*/

function pushDominoes(dominoes: string): string {
    // Add sentinels to handle edge cases more easily
    dominoes = 'L' + dominoes + 'R';

    let result: string[] = [];
    let chars = dominoes.split('');

    // Process the dominoes between each pair of non-'.' characters
    for (let i = 0, j = 1; j < chars.length; j++) {
        if (chars[j] === '.') continue;

        // Process the substring between i and j
        // First, handle the characters at positions i and j
        if (i > 0) { // Skip the first sentinel
            result.push(chars[i]);
        }

        const middle = j - i - 1; // Number of dots between i and j

        if (middle > 0) {
            // Three possible scenarios for the dominoes between i and j
            if (chars[i] === 'L' && chars[j] === 'L') {
                // All dominoes fall to the left
                result.push('L'.repeat(middle));
            } else if (chars[i] === 'R' && chars[j] === 'R') {
                // All dominoes fall to the right
                result.push('R'.repeat(middle));
            } else if (chars[i] === 'L' && chars[j] === 'R') {
                // Forces moving away from each other, dominoes stay upright
                result.push('.'.repeat(middle));
            } else { // chars[i] === 'R' && chars[j] === 'L'
                // Forces moving toward each other
                const half = Math.floor(middle / 2);
                const isEven = middle % 2 === 0;

                result.push('R'.repeat(half)); // Right-falling dominoes
                if (!isEven) {
                    result.push('.'); // Middle domino stays upright if odd number
                }
                result.push('L'.repeat(half)); // Left-falling dominoes
            }
        }

        i = j; // Move to the next non-'.' segment
    }

    return result.join('');
};

console.log(pushDominoes("RR.L")) // "RR.L"
console.log(pushDominoes(".L.R...LR..L..")) // "LL.RR.LLRRLL.."