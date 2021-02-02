#include <stdio.h> // 헤더파일 지정
#include <math.h> // 헤더파일 지정

int main(void)
{
	int x; // 정수형 x 지정
	int y; // 정수형 y 지정

	printf("실수 x를 입력하고 Enter>"); // 출력문
	scanf("%d", &x); //x를 입력하는 입력문
	printf("실수 y를 입력하고 Enter>"); // 출력문
	scanf("%d", &y); //y를 입력하는 입력문
	
	printf("x의 y승 = %lf \n", pow(x,y)); //pow(x,y)를 출력하는 출력문
	printf("y의 x승 = %lf \n", pow(y,x)); //pow(y,x)를 출력하는 출력문
	
	return 0;//프로그램 종료
}
