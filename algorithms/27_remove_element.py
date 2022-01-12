#Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.
#Return k after placing the final result in the first k slots of nums.

#Do not allocate extra space for another array. 
#You must do this by modifying the input array in-place with O(1) extra memory.

"""
Custom Judge

int[] nums = [...]; // Input array
int val = ...; // Value to remove
int[] expectedNums = [...]; // The expected answer with correct length.
                            // It is sorted with no values equaling val.

int k = removeElement(nums, val); // Calls your implementation

assert k == expectedNums.length;
sort(nums, 0, k); // Sort the first k elements of nums
for (int i = 0; i < actualLength; i++) {
    assert nums[i] == expectedNums[i];
}
"""

# Python solution

class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        i = 0
        for x in nums:
            if x != val:
                nums[i] = x
                i += 1
        return i
