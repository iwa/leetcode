type P = Promise<number>

async function addTwoPromises(promise1: P, promise2: P): P {
    let res1 = await promise1;
    let res2 = await promise2;

    return new Promise(resolve => resolve(res1 + res2));
};

// test
addTwoPromises(Promise.resolve(2), Promise.resolve(2))
  .then(console.log); // 4