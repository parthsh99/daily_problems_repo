/**
 * Problem - Number-increasing triangle Pattern
    1 
    1 2 
    1 2 3 
    1 2 3 4 
    1 2 3 4 5 
    1 2 3 4 5 6
 */
#include <iostream>
using namespace std;


void TriangleIncreasingPyramid(int n){
    for(int i = 1 ; i <= n ; i++){
        for(int j = 1 ; j <= i; j++){
            cout << j<<" ";
        }
        cout << endl;
    }
}


int main(){
    cout<<
    TriangleIncreasingPyramid(n);
    return 0;
}