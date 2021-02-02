#include <stdio.h> // 헤더파일 지정

int power(int x, int y) // power 함수 지정
{
	int xsum = 1; // xsum =1로 초기화
	int ysum = 1; // ysum =1로 초기화

	for (int i = 0; i < y; i++) // y번 반복하는 반복문
	{
		xsum = x * xsum; // xsum 에 xsum * x를 대입
	}
	for (int i = 0; i < x; i++) // x번 반복하는 반복문
	{
		ysum = y * ysum; // ysum 에 ysum * y를 대입
	}
	
	printf("x의 y승 = %d \n", xsum); // xsum 출력하는 출력문
	printf("y의 x승 = %d \n", ysum); // ysum 출력하는 출력문
	return; // 반환
}

int main(void) 
{
	int x; // 정수형 x 선언
	int y; // 정수형 y 선언
	printf("정수 x를 입력하고 Enter>"); // 출력문
	scanf("%d", &x); // x 입력하는 입력문
	printf("정수 y를 입력하고 Enter>"); // 출력문
	scanf("%d", &y); // y 입력하는 입력문

	power(x, y); // power함수 사용
	return 0; // 프로그램 종료
}
