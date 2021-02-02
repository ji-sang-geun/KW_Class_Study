#include <stdio.h> // 헤더파일 선언

int score[5] = { 0 }; //배열 초기화 
int max = 0 , min = 0, mid = 0; // max min 평균 초기화 -> 덤프값 버리기 위해서
int i; // 정수형 i 선언

int main(void)
{
	for (i = 0; i < 5; i++) // 5번 반복하는 반복문
	{
		printf("%d, 학생 점수<0~100> ? ", i+1); // 출력
		scanf("%d", &score[i]); // 입력하게끔 함
		if((score[i] > 100 || score[i]<0)) // 100을 넘거나 0을 넘지 못하는 입력값의 경우 프로그램 종료
		{
			printf("%d, 학생 점수<0~100> ? ", i + 1); //재 출력
			scanf("%d", &score[i]); // 다시 재 입력
		}
	}

	printf("\n"); // 한줄 띄어주는 문장

	for (i = 0; i < 5; i++) // 5번 반복하는 반복문
	{
		printf("%d, ", score[i]); // 무엇을 입력했는지 보여주는 출력문
		mid = score[i] + mid; // 평균값을 구하기 위해 총합을 더함
	}
	printf("\n"); // 한줄 띄어주는 문장

	printf("평균 점수: %.2f \n", (double)mid / 5); // 평균 점수를 출력하는 출력문

	max = score[0]; // 최댓값을 지정
	min = score[0]; // 최솟값을 지정

	for (i = 1; i <= 4; i++) // 4번 반복하는 반복문
	{
		if (max > score[i]) // 만약 max가 score[i]보다 크다면
		{
			max = max; // max에 max 대입
		}
		else // 아니라면
		{
			max = score[i]; // max에 score[i] 대입
		}
	}

	for (i = 1; i <= 4; i++) // 4번 반복하는 반복문
	{
		if (min < score[i]) // 만약 min이 score[i]보다 작다면
		{
			min = min; // min에 min 대입
		}
		else // 아니라면
		{
			min = score[i]; // min에 score[i] 대입
		}
	}
	printf("최고 점수 : %d , 최저 점수 : %d", max, min); // 최고 점수 최저 점수 출력
	return 0; // 프로그램 종료
}
