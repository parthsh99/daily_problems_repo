class Solution {
public:
    int maxDistance(vector<vector<int>>& arrays) {
        // create var to store min, max and difference. 
        // there are 2 possible ways to solve this problem.
        // 1. Store previous min, max and find the max difference wrt. current array's min,max and all time min, max
        // 2. Iterate through all arrays while storing all time min, and all time low- but the key point where it fails 
        //    is, the min and max should be from 2 different arrays. To achieve this condition, there are lots of
        //    if,else, comparisons are needed. This approacha passed 75% test cases but failed in remaining due to this blocker.
        // Hence going with 1st approach
        int smallest = arrays[0][0];
        int biggest = arrays[0].back();
        int max_distance = 0;

        for (int i = 1; i < arrays.size(); ++i) {
            max_distance = max(max_distance, abs(arrays[i].back() - smallest));
            max_distance = max(max_distance, abs(biggest - arrays[i][0]));
            smallest = min(smallest, arrays[i][0]);
            biggest = max(biggest, arrays[i].back());
        }

        return max_distance;
    }
};