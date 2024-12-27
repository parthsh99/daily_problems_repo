/**
 * Problem: Print array after it is right rotated K times
 * Given an Array of size N and a value K, around which we need to right rotate the array. How do you quickly print the right rotated array?
 * Input: Array[] = {1, 3, 5, 7, 9}, K = 2.
 * Output: 7 9 1 3 5
 * Input: Array[] = {1, 2, 3, 4, 5}, K = 4.
 * Output: 2 3 4 5 1      
 */

    //Optimized approach - Kadane's algorithm
    // Function to rightRotate array
    void rotate(vector<int>& nums, int k) {
            int n = nums.size();
            k = k % n;
            // reverse the first n-k items
            reverseArr(nums, 0, n - k - 1);
            // reverse 2nd part of array
            reverseArr(nums, n - k , n-1);
            //reverse whole array
            reverseArr(nums, 0, n-1);
        }
        
    void reverseArr(vector<int>& arr, int start, int end){
        int left = start, right = end, temp = 0;
        while(left <= right){
            temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
            left++;
            right--;
        }
    }

// Driver code
int main()
{
    int Array[] = { 1, 2, 3, 4, 5 };
    int N = sizeof(Array) / sizeof(Array[0]);
    int K = 2;
    
    RightRotate(Array, N, K);
}