/**
 * Problem - Given an integer array of N elements. You need to find the maximum sum of two elements such that sum is closest to zero. 
 * Input: arr[] = {-8, 5, 2, -6}
 * Output: -1
 * Explanation: The min absolute sum pair is (5, -6)
 * 
 * Input:  arr[] = {0, -8, -6, 3}
 * Output: 3
 * Explanation: We have a tie between (0, 3) and (-6, 3). We pick the max sum in this case which is 0+3*   
 */

#include <iostream>

#include <bits/stdc++.h>
//! Naive approach
int TwoSumClosestZeroNaive(const vector<int>& arr){
    int min_sum = -100;
    for(int i = 0 ; i < arr.size() - 1 ; i++){
        for(int j = i + 1 ; j < arr.size() ; j++){
            if(abs(arr[i] + arr[j]) < abs(min_sum)){
                min_sum = arr[i] + arr[j];
            }
        }
    }
    return min_sum;
}

//! Better approach - binary sort and search
int TwoSumClosestZeroSortSearch(const vector<int>& arr){
    int min_sum = -100;
    // sort(arr.begin(), arr.end());
    // int left = 0, right = arr.size() - 1;
    // while(left < right){
    //     int mid = (left + right) / 2;
    //     if(abs(arr[left] + arr[right]) > abs(arr[mid]) ){
    //         left
    //     }
    // }
    return min_sum;
}

int TwoSumClosestZeroHashMap(const vector<int>& arr){

}


int main() {
    vector<int> arr = { 1, 60, -10, 70, -80, 85 };
    cout << TwoSumClosestZeroNaive(arr);
    return 0;
}