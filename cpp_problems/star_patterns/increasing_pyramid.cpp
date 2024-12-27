/**
 * Problem - Number-increasing triangle Pattern
     1 
    2 2 
   3 3 3 
  4 4 4 4 
 5 5 5 5 5 
6 6 6 6 6 6 

 */
#include <iostream>
using namespace std;
void PrintNumberPyramid(int n){
    for(int i = 0 ; i < n ; i++){
        for (int j = 0 ; j < n ; j++){
            for(int k = 0 ; k < j / 2; k++){
                cout <<" ";
            }

            cout << "i ";
        }
    }
}

int main(){
    cout >> " Enter lenght for pyramid number triangle:"<< endl;
    int n = 0 ;
    cin >> n;
    PrintNumberPyramid(n);
    return 0;
}