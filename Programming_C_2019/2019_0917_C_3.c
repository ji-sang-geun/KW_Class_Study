#include <stdio.h>
#include <string.h>

void format_display(char money[])
{
	size_t strlen(const char* str); //size_t = unsigned int와 같음
	char *str = money; // char형 포인터 str = &money[0]와 같음

	printf("단위를 뺀 금액 입력하고 Enter > ");
	scanf("%s", money);

	size_t length = strlen(str); // 문자열 길이 구하는 것 

	for (int i = length; i > 0;) // int i가 length와 같고 i>0일때, 반복하는 반복문
	{
		printf("%c", *str++); // *str이 배열 한칸 뒤로가는 후위연산자.
		i--; // 뒤에서 부터 ,을 해야하므로 i를 1 줄인다.
		if (i > 0 && i % 3 == 0) // i>0이고, i%3 ==0일때 , 작성
		{
			printf(",");
		}
	}
	printf("\n");
	printf("문자열의 길이 : %d \n", length);
}

int main(void)
{
	char money[50];
	format_display(money);

	return 0;
}
