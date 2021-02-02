#include <stdio.h>
int main(void)
{
	char ch = 9; // char형은 1바이트 
	int inum = 1052; // int는 4바이트 
	double dnum = 3.1415; // int는 8바이트
	char num1 = 1, num2 = 2, result1 = 0;
	short num3 = 300, num4 = 400, result2 = 0;

	printf("변수 ch의 크기: %d \n", sizeof(ch));
	printf("변수 inum의 크기 %d \n", sizeof(inum)); 
	printf("변수 dnum의 크기 %d \n", sizeof(dnum)); // dnum은 double형태이므로 sizeof(double)과 형태가 같게 나옴

	printf("char의 크기: %d \n", sizeof(char));
	printf("int의 크기: %d \n", sizeof(int));
	printf("long의 크기: %d \n", sizeof(long));
	printf("long long의 크기: %d \n", sizeof(long long));
	printf("float의 크기: %d \n", sizeof(float));
	printf("double의 크기: %d \n", sizeof(double));

	printf("unsigned int의 크기: %d \n", sizeof(unsigned int)); //unsigned 함수는 범위만 달라지지 크기는 달라지지 않음
	printf("unsigned long의 크기: %d \n", sizeof(unsigned long));
	printf("unsigned char의 크기: %d \n", sizeof(unsigned char));
	printf("unsigned long long의 크기: %d \n", sizeof(unsigned long long));
	printf("unsigned short의 크기: %d \n", sizeof(unsigned short));

	printf("size of num1 & num2: %d, %d \n", sizeof(num1), sizeof(num2));
	printf("size of num3 & num4: %d, %d \n", sizeof(num3), sizeof(num4));
	printf("size of char add: %d \n", sizeof(num1 + num2)); //num1과 num2는 char형이지만, +형태가 붙으면 int형으로 바뀌어 4 bite가 출력
	printf("size of short add: %d \n", sizeof(num3 + num4));

	result1 = num1 + num2;
	result2 = num3 + num4;
	printf("size of result1 & result2: %d, %d \n", sizeof(result1), sizeof(result2));//result1는 char형, result2는 short형

	return 0;
}
