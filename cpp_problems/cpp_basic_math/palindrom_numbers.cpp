/**
  Problem:  We are given an n-digit number. The task is to find if the number is palindrome or not, provided that, n>=0.
    If the Reversed Number is equal to the original number, then the number is said to be a palindrome number, otherwise not.
   Input: 78987
   Output: Yes
   Input: 21
   Output: No   
 */
#include <iostream>
#include <limits.h>
using namespace std;

bool isPal(int n)
{
	int rev = 0;
	int temp = n;
	while(temp != 0)
	{
		int ld = temp % 10;
		rev = rev * 10 + ld;
		temp = temp / 10;
	}	
	return rev==n;
}
int main() {
    	int number = 4553;
    	cout<<(bool)isPal(number);
    	return 0;
}