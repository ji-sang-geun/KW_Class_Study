#include <stdio.h>
int main(void)
{
	int gugu; //gugu 정의
	int dan; //dan 정의

	for (gugu = 2; gugu < 10; gugu++) // gugu 초기값 2 정의 gugu 10 미만일때만 반복 gugu는 1씩 추가
	{
		for (dan = 1; dan < 10; dan++) // dan 초기값 1 정의 dan 10미만일때만 반복 dan은 1씩 추가
		{
			printf("%d x %d = %d \t", gugu, dan, gugu*dan); 
		}
		printf("\n");
	}
    
	return 0;
}
