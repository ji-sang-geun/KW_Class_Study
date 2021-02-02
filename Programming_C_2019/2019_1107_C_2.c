#include <stdio.h> //헤더파일 지정

int n; // 정수형 n선언
int sum = 0; // 정수형 sum = 0 으로 초기화

int sumFunc(int count) // sumFunc함수 선언
{
	if (count == 0) // count가 0이라면
	{
		return sum; // sum 반환
	}

	sum = sum + count; // sum에 sum + count 대입

	
	sumFunc(--count); // 재귀함수 
}

int main(void) 
{
	printf("합계를 원하는 정수를 입력하세요 : "); // 출력문
	scanf("%d", &n); // n을 입력받는 입력문
	printf("1부터 %d까지의 합 : ",n); // 출력문
	sumFunc(n); //재귀함수 사용
	printf("%d ", sum); // sum 출력
    
	return 0; // 프로그램 종료
}
