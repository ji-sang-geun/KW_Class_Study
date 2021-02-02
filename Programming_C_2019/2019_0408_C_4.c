#include <stdio.h>
int main(void)
{
	int gugu = 1; //dump값이 나오는걸 방지한다.
	int dan = 0; //dump값이 나오는걸 방지한다.

	while (gugu < 10) // gugu가 2단부터 9단까지 while문 반복해야한다.
	{
		dan = 2; // dan에 2를 대입
		while (dan < 10) // dan은 10보다 작아야한다.
		{
			printf("%d x %d = %d \t", dan, gugu, gugu*dan); //가독성을 높이기 위해 \t를 사용하였다.
			dan++; //dan에 1씩 추가한다.
		}
		printf("\n"); // 가독성을 높이기 위해서 \n을 사용하였다.
		gugu++; //gugu에 1씩 추가한다.
	}
	return 0;
}
