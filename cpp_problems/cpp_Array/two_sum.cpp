/**
 * Problem - Given an array arr[] of n integers and a target value, 
 *           the task is to find whether there is a pair of elements in the array whose sum is equal to target.
 *   
 *   Input: arr[] = {0, -1, 2, -3, 1}, target = -2
 *   Output: True
 *   Explanation: If we calculate the sum of the output,1 + (-3) = -2
 *   Input: arr[] = {1, -2, 1, 0, 5}, target = 0
 *   Output: False
 * 
 */

#include <unordered_map>
#include <iostream>
#include <vector>
#include <bits/stdc++.h>
using namespace std;

// Naive Approach
bool TwoSumNaive(vector<int> &arr, int target){
    //! Iterate over the array twice to find the sum matching equals target
    for(int i = 0; i < arr.size() - 1 ; i++){
        for(int j = i; j < arr.size(); j++){
            if(arr[i] + arr[j] == target){
                return true;
            }
        }
    }
    return false;
}

// Better Approach 1 - Sorting and search

bool binarySearch(vector<int>& arr, int left, int right, int target){
    int mid;
    while(left < right){
        mid = (left + right ) /2 ;
        if(arr[mid] < target){
            left = mid+1;
        }else if(arr[mid]>target){
            right = mid-1;
        }
        else if(arr[mid] == target){
            return true;
        }
        
    }
    return false;
}

bool TwoSumBinSort(vector<int>& arr, int target){
    //! Sort the array using binary sorting technique
    sort(arr.begin(), arr.end());
    // Iterate through each element in the array
    for (int i = 0; i < arr.size(); i++){
        int complement = target - arr[i];
        // Use binary search to find the complement
        if (binarySearch(arr, i + 1, arr.size() - 1, complement))
            return true;
    }
    return false;
}

// Best Optimized Approach - using hashmap
bool TwoSumHashMap(vector<int> &arr, int target){
    unordered_map<int, int> map_with_freq;
    for(int i = 0; i < arr.size(); i++){
        int complement = target - arr[i];
        if(map_with_freq[complement]){
            return true;
        }
        map_with_freq[arr[i]] += 1;
    }
    return false;
}


int main() {
  
    vector<int> arr = {0, -1, 2, -3, 1};
    int target = -1;

    // Call the twoSum function and print the result
    if(TwoSumBinSort(arr, target))
      cout << "true";
    else
      cout << "false";

    return 0;
}