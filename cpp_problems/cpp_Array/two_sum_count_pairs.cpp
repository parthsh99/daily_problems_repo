/**
 *  Problem - Given an array arr[] of n integers and a target value, 
 *            the task is to find the number of pairs of integers in the array whose sum is equal to target.
 *  
 *  Input: arr[] = {1, 5, 7, -1, 5}, target = 6
 *  Output:  3
 *  Explanation: Pairs with sum 6 are (1, 5), (7, -1) & (1, 5)
 * 
 *  Input: arr[] = {1, 1, 1, 1}, target = 2
 *  Output:  6
 *  
 */

#include <iostream>
using namespace std;

//! Naive approach - using 2 for loops
int CountPairsTwoSumNaive(vector<int> arr, int sum){
    int sum_pair_count = 0;
    for(int i = 0 ; i < arr.size() - 1; i++){
        for(int j = i+1 ; j < arr.size() ; j++){
            if(arr[i] + arr[j] == sum){
                sum_pair_count += 1;
            }
        }
    }
    return sum_pair_count;
}


//! Optimized approach - Using HashMaps
int CountPairsTwoSumMap(vector<int> arr, int sum){
    int count = 0;
    unordered_map<int , int> freq_map;
    for(int i = 0 ; i < arr.size() ; i++){
        int complement = sum - arr[i];
        if(freq_map.find(complement) != freq_map.end()){
            count += freq_map[complement];
        }
        //! Add the found element and it's frequency in the map
        freq_map[arr[i]]++;
    }
    return count;
}

int main() {
  
    vector<int> arr = {1, 5, 7, -1, 5};
    int target = 6;

    // Call the twoSum function and print the result
    cout << CountPairsTwoSumMap(arr, target) << endl;

    return 0;
}
