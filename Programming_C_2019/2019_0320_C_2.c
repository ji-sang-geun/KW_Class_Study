#include <stdio.h>

int main(void)
{
	int num1 = 3; // 3은 00011을 나타냅니다.
	int result1;

	result1 = num1 << 3; // 3(00011)을 왼쪽으로 3칸씩 이동시켜 3*8인 24(11000)를 만들었습니다.
	result1 = result1 >> 2; // 24(11000)을 오른쪽으로 2칸씩 이동시켜 24/4인 6(00110)을 만들었습니다.

	printf("%d", result1);

	return 0;
}