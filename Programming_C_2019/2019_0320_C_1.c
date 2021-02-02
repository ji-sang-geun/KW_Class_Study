#include <stdio.h>

int main(void)
{
	int num1;
	int num2; 

	scanf("%d", &num1); //%d는 int형을 나타내기 위한 서식문자
	num2 = ~num1+1;// 2의 보수를 나타내기 위해선 1의 보수를 취한후 +1을 해야한다.
	printf("%d", num2);

	return 0;
}
