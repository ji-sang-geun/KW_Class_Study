#include <stdio.h>
int main(void)
{
	char ch1 = 'A', ch2 = 65; //문자는 작은 따옴표 사용 문자 A의 아스키 코드값은 65
	int ch3 = 'Z', ch4 = 90; 
	
	printf("%c %d \n", ch1, ch1); //%c는 아스키 코드 형태 출력 %d는 int형 출력
	printf("%c %d \n", ch2, ch2);
	printf("%c %d \n", ch3, ch3);
	printf("%c %d \n", ch4, ch4);
    
	return 0;
}
