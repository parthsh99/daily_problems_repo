#9 . Palindrom Number


#Given an integer x, return true if x is palindrome integer.

#An integer is a palindrome when it reads the same backward as forward.

#For example, 121 is a palindrome while 123 is not.

#Example 1:

#Input: x = 121
#Output: true
#Explanation: 121 reads as 121 from left to right and from right to left.

#Constraints:
#-231 <= x <= 231 - 1
---------------------------------------------------------------------------

#My solution:
class Solution {
    public boolean isPalindrome(int x) {
        if (x < 0 || x % 10 == 0 && x != 0){
            return false;
        }
        int rev = 0,temp = 0;
        temp = x;
        while (x!=0){
            rev = 10*rev + (x % 10);
            x/=10;
        }
        return temp == rev;
    }
}



# Time complexity : O(n)




^G Help      ^O Write Out ^W Where Is  ^K Cut       ^T Execute   ^C Location
^X Exit      ^R Read File ^\ Replace   ^U Paste     ^J Justify   ^/ Go To Line
