/**
 * Problem - Diamond Star pattern
     *
    ***
   *****
  *******
 *********
***********
 *********
  *******
   *****
    ***
     *
 */

void Diamond_star_Pattern(int num){
    for(int i = 0 ; i < num ; i++){
        //! blank space print
        for(int j = 0 ; j < (n - i ) / 2; j++){
            cout << " ";
        }
        //upper half star pattern
        for(int j = 1 ; j < i ; j++ ){
            cout << "*";
        }
    }
}


int main(){
    Diamond_star_Pattern(5);
}