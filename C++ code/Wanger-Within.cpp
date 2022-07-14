#include<bits/stdc++.h>
using namespace std;


// Parameter D(t) demand for the item during the time t
// Parameter f(t) fixed cost in time t
// Parameter h(t) per unit inventory carrying cost in time t - expenses related to storing unsold goods
// parameter T maximum time
// Variables x(t) amount produced in time t
// Binary Variable t2, t3

int main(){

    // Taking input of all the variables.
    int T;
    // cin>>T;
    T=30;

    int arr[T+1][T+1]={0};
    int D[T+1]={0}, f[T+1]={0}, h[T+1]={0}, x[T+1];

    for(int t =1; t<=T; t++){
        cin>>f[t];
    }
    for(int t =1; t<=T; t++){
        cin>>D[t];
    }
    for(int t =1; t<=T; t++){
        cin>>h[t];
    }


    arr[1][1]=f[1];
    x[1]=f[1];
    for(int i =2; i<=T; i++){
        arr[i][i] = x[i-1]+ f[i];
        x[i]=arr[i][i];
        for(int j =i-1; j>=1; j--){
            int inv_carr_charge=0;
            for(int k =j; k<i; k++){
                inv_carr_charge+=h[k];
            }
            arr[i][j] = arr[i-1][j]+ inv_carr_charge*D[i];
            x[i]=min(x[i], arr[i][j]);
            if(arr[i-1][j]==x[i-1]){
                break;
            }
        }
    }
    cout<<x[T]<<endl;
    // for(int i =1; i<=30; i++){
    //     cout<<x[i]<<" ";
    // }
    // cout<<endl;
    // for(int i =1; i<=T; i++){
    //     for(int j=1; j<=T; j++){
    //         cout<<arr[j][i]<<" ";
    //     }
    //     cout<<endl;
    // }
}