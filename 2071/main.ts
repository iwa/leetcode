/*
You have n tasks and m workers. Each task has a strength requirement stored in a 0-indexed integer array tasks,
with the ith task requiring tasks[i] strength to complete.

The strength of each worker is stored in a 0-indexed integer array workers,
with the jth worker having workers[j] strength.

Each worker can only be assigned to a single task and must have a strength greater than or equal
to the task's strength requirement (i.e., workers[j] >= tasks[i]).

Additionally, you have pills magical pills that will increase a worker's strength by strength.
You can decide which workers receive the magical pills, however, you may only give each worker at most one magical pill.

Given the 0-indexed integer arrays tasks and workers and the integers pills and strength,
return the maximum number of tasks that can be completed.
*/

/*
function maxTaskAssign(tasks: number[], workers: number[], pills: number, strength: number): number {
    let workersLen = workers.length;
    let result = 0;

    // normal loop without pills
    for (let j = 0; j < workersLen; j++) {
        const worker = workers[j];
        let bestTask = 0;

        for (let i = 0; i < tasks.length; i++) {
            const task = tasks[i];

            if (worker - task === 0 || worker - task === 1) {
                bestTask = i;
                break;
            }
        }

        console.log("best determined ", worker, bestTask, workers, tasks, (worker+strength));

        if (worker >= tasks[bestTask]) {
            workers.splice(j, 1);
            tasks.splice(bestTask, 1);
            result++;
            console.log("ok")
            j--;
            workersLen--;
        }

        console.log("end round ", worker, bestTask, workers, tasks);
    }

    while (workers.length > 0) {
        const worker = workers[0];
        let bestTask = 0;

        for (let i = 0; i < tasks.length; i++) {
            const task = tasks[i];

            if (worker - task === (-strength)) {
                bestTask = i;
                break;
            }
        }

        console.log("best determined ", worker, bestTask, workers, tasks, (worker+strength));

        if (pills > 0 && (worker+strength) >= tasks[bestTask]) {
            pills--;

            tasks.splice(bestTask, 1);
            result++;
            console.log("ok with pill")
        }
        workers.shift();

        console.log("end round ", worker, bestTask, workers, tasks);
    }

    return result;
};
*/

function maxTaskAssign(tasks: number[], workers: number[], pills: number, strength: number): number {
    tasks.sort((a, b) => a - b); // Sort tasks in ascending order (easiest first)
    workers.sort((a, b) => a - b); // Sort workers in ascending order (weakest first)

    // Binary search to find maximum tasks that can be assigned
    let left = 0;
    let right = Math.min(tasks.length, workers.length);

    while (left <= right) {
        const mid = Math.floor((left + right) / 2);

        if (canAssign(mid, tasks, workers, pills, strength)) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }

    return right;
}

function canAssign(taskCount: number, tasks: number[], workers: number[], pills: number, strength: number): boolean {
    // We'll take the taskCount easiest tasks
    const taskSubset = tasks.slice(0, taskCount);
    // We'll take the taskCount strongest workers
    const workerSubset = workers.slice(workers.length - taskCount);

    let remainingPills = pills;

    // Process tasks from hardest to easiest
    for (let i = taskCount - 1; i >= 0; i--) {
        const currentTask = taskSubset[i];

        // Try to find a worker who can complete the task without a pill
        if (workerSubset.length > 0 && workerSubset[workerSubset.length - 1] >= currentTask) {
            // The strongest worker can do this task without a pill
            workerSubset.pop();
            continue;
        }

        // Need to use a pill
        if (remainingPills <= 0) {
            return false; // No pills left
        }

        // Find the weakest worker who can do the task with a pill
        let workerIndex = -1;
        for (let j = 0; j < workerSubset.length; j++) {
            if (workerSubset[j] + strength >= currentTask) {
                workerIndex = j;
                break;
            }
        }

        if (workerIndex === -1) {
            return false; // No worker can do this task even with a pill
        }

        // Use this worker and a pill
        workerSubset.splice(workerIndex, 1);
        remainingPills--;
    }

    return true; // All tasks assigned successfully
}

// console.log(maxTaskAssign([3,2,1], [0,3,3], 1, 1)) // 3
// console.log(maxTaskAssign([5,4], [0,0,0], 1, 5)) // 1
// console.log(maxTaskAssign([5,9,8,5,9], [1,6,4,2,6], 1, 5)) // 3
console.log(maxTaskAssign([33,58,22,87,38], [84,46,17,58,98,30,56,78,48], 1, 5)) // 5