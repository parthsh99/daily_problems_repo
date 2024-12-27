/**
 * Problem - Palindrome Triangle Pattern
          1 
        2 1 2 
      3 2 1 2 3 
    4 3 2 1 2 3 4 
  5 4 3 2 1 2 3 4 5 
6 5 4 3 2 1 2 3 4 5 6  
 
 */

#include <iostream>
usign namespace std;

void Palindrome_tri_pattern(int n ){
    for(int i = 0 ; i < n ; i++){
        for(int j = 0; j < 2*(n - i) ; j++){
            cout << " ";
        }
        for(int j = i ; j >= 1 ; j-- ){
            cout << j << " ";
        }
        for(int j = 2; j <= i;j++){
            cout << j << " ";
        }
        cout << endl;
    }
}

int main(){
    int n = 6;
    Palindrome_tri_pattern(n);
}