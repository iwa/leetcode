/*
In a row of dominoes, tops[i] and bottoms[i] represent the top and bottom halves of the ith domino.
(A domino is a tile with two numbers from 1 to 6 - one on each half of the tile.)

We may rotate the ith domino, so that tops[i] and bottoms[i] swap values.

Return the minimum number of rotations so that all the values in tops are the same, or all the values in bottoms are the same.

If it cannot be done, return -1.
*/

function minDominoRotations(tops: number[], bottoms: number[]): number {
    let topsMostMap = new Map<number, number>;
    let bottomsMostMap = new Map<number, number>;

    for (let i = 0; i < tops.length; i++) {
        topsMostMap.set(tops[i], (topsMostMap.get(tops[i]) || 0) + 1);
        bottomsMostMap.set(bottoms[i], (bottomsMostMap.get(bottoms[i]) || 0) + 1);
    }

    let topBest = 0;
    let topBestValue = 0;
    topsMostMap.forEach((value, key) => {
        if (value > topBestValue) {
            topBest = key;
            topBestValue = value;
        }
    });

    let bottomBest = 0;
    let bottomBestValue = 0;
    bottomsMostMap.forEach((value, key) => {
        if (value > bottomBestValue) {
            bottomBest = key;
            bottomBestValue = value;
        }
    });

    let resultTop = 0;

    for (let i = 0; i < tops.length; i++) {
        if (tops[i] === topBest) {
            continue;
        } else if (bottoms[i] === topBest) {
            resultTop++;
        } else {
            resultTop = -1;
            break;
        }
    }


    let resultBottom = 0;

    for (let i = 0; i < bottoms.length; i++) {
        if (bottoms[i] === bottomBest) {
            continue;
        } else if (tops[i] === bottomBest) {
            resultBottom++;
        } else {
            resultBottom = -1;
            break;
        }
    }

    if (resultTop === -1 && resultBottom === -1) {
        return -1;
    } else if (resultTop >= 0 && resultTop < resultBottom) {
        return resultTop;
    }

    return resultBottom;
};

// console.log(minDominoRotations([2, 1, 2, 4, 2, 2], [5, 2, 6, 2, 3, 2])); // 2
// console.log(minDominoRotations([3, 5, 1, 2, 3], [3, 6, 3, 3, 4])); // -1
// console.log(minDominoRotations([1,2,1,1,1,2,2,2], [2,1,2,2,2,2,2,2])); // 1
console.log(minDominoRotations([1,2,3,4,6], [6,6,6,6,5])); // 1