#include <stdio.h>

int InzaMax(int num1, int num2, int num3) // 가장 큰 함수 정의
{
	if (num1 > num2) // num1 > num2일때
	{
		if (num1 > num3)
		{
			return num1;
		}
		else
		{
			return num3;
		}
	}
	else //num1 =< num2일때
	{
		if (num2 > num3) 
		{
			return num2;
		}
		else
		{
			return num3;
		}
	}

}

int InzaMin(int num1, int num2, int num3) //가장 작은 함수 정의
{
	if (num1 < num2) // num1 < num2 일때
	{
		if (num1 < num3)
		{
			return num1;
		}
		else
		{
			return num3;
		}
	}
	else // num1 >= num2 일때
	{
		if (num2 < num3)
		{
			return num2;
		}
		else
		{
			return num3;
		}
	}
}

int input(void) //입력하는 함수 정의
{
	int num;
	scanf("%d", &num);
	return num;
}

int main(void)
{
	int result1, result2, num1, num2, num3;
	num1 = input();//num1 입력
	num2 = input();//num2 입력
	num3 = input();//num3 입력
	
	result1 = InzaMax(num1, num2, num3); //가장 큰 값 찾기
	result2 = InzaMin(num1, num2, num3); //가장 작은 값 찾기
	printf("가장 큰 수 : %d \n", result1); //가장 큰 값 출력
	printf("가장 작은 수 : %d \n", result2); //가장 작은 값 출력

	return 0;
	
}
