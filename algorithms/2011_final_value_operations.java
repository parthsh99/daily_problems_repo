/*
2011. Final Value of Variable After Performing Operations
There is a programming language with only four operations and one variable X:

++X and X++ increments the value of the variable X by 1.
--X and X-- decrements the value of the variable X by 1.
Initially, the value of X is 0.

Given an array of strings operations containing a list of operations, return the final value of X after performing all the operations.

Example 1:

Input: operations = ["--X","X++","X++"]
Output: 1

*/

class Solution {
    public int finalValueAfterOperations(String[] operations) {
        int op = 0;
        for (int i = 0 ; i<operations.length;i++){
            if (operations[i].equals("++X") || operations[i].equals("X++")){
                op++;
            }else if (operations[i].equals("--X") || operations[i].equals("X--")){
                op--;
            }
        }
        return op;
    }
}
