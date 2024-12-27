/**
 * Problem - Program to print output of hollow square pattern with stars such as
    ******
    *    *
    *    *
    *    *
    *    *
    ******
 */

#include <iostream>
using namespace std;

void Square_pattern(int n ){
    for(int i = 0 ; i < n ; i++){
        for(int j = 0 ; j < n ; j++){
            if((i == 0 || i == n-1) || (j == 0 || j == n -1))
                cout << "*";
            else if(i > 0 || i < n - 1 ){
                cout << " ";
            }
        }
        cout << endl;
    }
}

int main(){
    int side_len = 0;
    cout <<"Enter number to print square hollow pattern:"<<endl;
    cin >> side_len;
    return 0;
}