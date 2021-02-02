#include <stdio.h>
int n = 0; // 전역변수 n 제시

int sumFunc(int count) //sumFunc함수 정의
{
	if (count > 0) //count가 0보다 크면 그 밑 함수 작동 하기
	{
		return count + sumFunc(count - 1); // count에 sumFunc(count - 1) 더하는 반환값 가짐
	}
	else // 만약 count가 0이면 그 밑 함수 되게끔 하기
	{
		return 0;//반환값 0가짐
	}
}

int main(void)
{
	
	printf("합게를 원하는 정수를 입력하시오 : ");
	scanf("%d", &n);
	printf("1부터 %d까지의 합: %d", n, sumFunc(n)); //sumFunc함수 출력

	return 0; // 프로그램 종료
}

