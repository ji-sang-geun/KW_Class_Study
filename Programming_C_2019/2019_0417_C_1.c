#include <stdio.h>
int main(void) {
	int j = 0; // int j s g 정의
	int s = 0; // dump값 쓰이는걸 방지
	int g = 0;

	for (j = 1; j <= 10; j++) // j가 1부터 10보다 작거나 같을 때까지 반복한다. j는 반복할때마다 1씩 증가한다. 
	{
		for (s = 0; s <= 10 - j; s++) // s가 0부터 10 - j 보다 작거나 같을 때까지 반복한다. s도 반복할때마다 1씩 증가한다. 
		{
			printf(" "); // 공백 출력
		}
		for (g = 0; g < 2 * j - 1; g++)//g가 0부터 2 * j - 1보다 작을때까지 반복한다. g도 반복할때마다 1씩 증가한다.
		{
			printf("*"); // 별 출력
		}
		printf("\n"); //줄바꿈 개행문자
	}

	return 0;
}