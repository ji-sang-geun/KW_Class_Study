#include <stdio.h> //헤더파일 정의
int main(void)
{
	int n = 0; //쓰레기 값 초기화
	int i;
	int sum = 0, max = 0, min = 0;
	int number[1000]; // 배열에는 상수값을 써야하므로 값을 크게 잡음
	
	printf("몇 개의 정수를 입력하시겠습니까? : ");
	scanf("%d", &n); // n개 정수 입력받도록 함

	for (i = 0; i < n; i++) // n번 반복하도록 하는 반복문 
	{
		printf("숫자를 입력하세요: ");
		scanf("%d", &number[i]); //0부터 n-1개까지 입력
	}

	max = min = sum = number[0]; //number[0]값을 max , min, sum이 가짐
	for (i = 1; i < n; i++) //i가 1부터 n-1까지 반복
	{
		sum = sum + number[i];

		if (max < number[i]) //max가 배열[i]보다 작을시 max = 배열[i]가 됨
		{
			max = number[i];
		}

		if (min > number[i]) //min이 배열[i]보다 클시 min = 배열[i]가 됨
		{
			min = number[i];
		}
	}
	
	printf("최댓값 : %d \n", max);
	printf("최솟값 : %d \n", min);
	printf("합 : %d \n", sum);
	
	return 0;
}