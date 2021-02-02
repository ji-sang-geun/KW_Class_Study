#include <stdio.h>
int main(void)
{
	char munja; // 문자를 받기 때문에 char형으로 정의
	
	printf("알파벳 문자 하나를 입력하시오:");
	scanf("%c", &munja); // char값을 받음
	printf("아스키 코드 값은: %d \n", munja); //문자를 아스키 코드 값으로 바꿈
	
	return 0;
}
