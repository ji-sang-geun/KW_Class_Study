#include <stdio.h>
int main(void)
{
	int num1 = 10 + 20; 

	printf("literal int size: %d \n", sizeof(10)); //int형의 크기 구하기 입니다.
	printf("literal double size: %d \n", sizeof(6.25)); 
	printf("literal char size: %d \n", sizeof('C')); // 원래 char형은 1바이트지만 ASCII코드 때문에 int형으로 바뀌어 4바이트의 크기를 가진다.

	printf("literal int size: %d \n", sizeof(num1)); // 리터럴 상수의 크기 구하기 입니다.
	printf("literal long size: %d \n", sizeof(2019L));  // long형의 크기를 구하기 입니다.
	printf("literal long long size: %d \n", sizeof(2018LL)); // long long형의 크기 구하기 입니다.

	return 0;
}
