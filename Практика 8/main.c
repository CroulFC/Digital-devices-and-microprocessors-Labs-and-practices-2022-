#include "8051.h"

void main(){
	short unsigned int upper = 0;
	while(1){

		P27 = 0;
		P26 = 0;
		P25 = 0;
		P24 = 0;

		if(P33 == 1){
			P24 = 1;
			upper = 3;
		}
		else{
			if(P32 == 1){
				P25 = 1;
				upper = 2;
			}
			else{
				if(P31 == 1){
					P26 = 1;
					upper = 1;
				}
				else{
					P27 = 1;
					upper = 0;
				}
			}
		}

		P27 = 0;
		P26 = 0;
		P25 = 0;
		P24 = 0;

		while(P37 == 1){}

		P20 = upper%2;
		P21 = upper >> 1;
		P0 = P1;
	}
}
