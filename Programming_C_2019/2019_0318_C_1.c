#include <stdio.h>
int main(void)
{
	int num1 = 0xA7;
	int num2 = 0x43;
	int num3 = 032;
	int num4 = 024;

	printf("0xA7의 10진수 정수 값: %d \n", num1); // %d는 10진수를 나타낼때 사용하는 서식문자
	printf("0xA7의 16진수 정수 값: %#x \n", num1); // %#x는 16진수를 0x꼴로 나타내는 것이고 %x는 16진수를 나타낼때 사용하는 서식문자

	printf("0x43의 10진수 정수 값: %d \n", num2);
	printf("0x43의 16진수 정수 값: %#x \n", num2); 

	printf("032의 10진수 정수 값: %d \n", num3);
	printf("032의 8진수 정수 값: %#o \n", num3); // %#o는 8진수를 0꼴로 나타내는 것이고 %o는 8진수를 나타낼때 사용하는 서식문자 

	printf("024의 10진수 정수 값: %d \n", num4);
	printf("024의 8진수 정수 값: %#o \n", num4);

	printf("%d - %d = %d \n", num1, num2, num1 - num2);
	printf("%#x - %#x = %#x \n", num1, num2, num1 - num2);

	printf("%d + %d = %d \n", num3, num4, num3 + num4);
	printf("%#o + %#o = %#o \n", num3, num4, num3 + num4);
    
	return 0;
}