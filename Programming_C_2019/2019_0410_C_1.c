#include <stdio.h>
int main(void)
{
	int total1 = 0 , num = 1; //dump값이 쓰이는 걸 방지하기 위함 입니다.
	while (num != 0)
	{
		printf("정수를 입력하시오: ");
		scanf("%d", &num); 
		total1 = num + total1; //기존에 입력된 total1값에서 num값을 더하여 새로운 total1값을 만듭니다.
	}
	printf("입력된 모든 정수의 합: %d", total1); // 0이 나온다면 그동안 입력된 모든 정수의 합이 출력됩니다.
    
	return 0; // return 0;문을 통하여 종료가 됩니다.
}
