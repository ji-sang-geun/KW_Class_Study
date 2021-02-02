#include <stdio.h>
int main(void)
{
	int dan; //dan 정의
	int gugu; //gugu 정의

	for (gugu = 1; gugu < 10; gugu++) // gugu 초기값 1 정의 gugu 10 미만일때만 반복 gugu는 1씩 추가
	{
		for (dan = 2; dan < 10; dan++) // dan 초기값 2 정의 dan 10미만일때만 반복 dan은 1씩 추가
		{
			printf("%d x %d = %d \t", dan, gugu, gugu*dan); // dan, gugu, gugu*dan과 서식문자 \t 출력 
		}
		printf("\n"); // 서식문자 \n 출력
	}
	return 0; // dan이 10이 되고 gugu가 10이 될때 종료
}
