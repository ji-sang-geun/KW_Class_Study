#include <stdio.h>	
int main(void)
{
	double num1 = 250;
	int num2 = 2.0193;
	int num3 = 150;
	char ch = num3;

	printf("정수 250을 실수로: %f \n", num1);
	printf("정수 250을 실수를 나타내는 lf형으로: %lf \n", num1); // %f대신 %lf를 사용하여 정수를 실수의 형태로 나타낸다.
	printf("실수 2.0193을 정수로: %d \n", num2);// 실수를 정수의 형태로 나타낸다.
	printf("큰 정수 150을 작은 정수로: %d \n", ch);
	printf("큰 정수 150을 문자형으로: %c \n", ch); // %c를 사용하여 ch의 int값으로 ASCII코드를 찾아 문자형을 나타낸다.

    return 0;
}
