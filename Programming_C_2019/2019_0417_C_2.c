#include <stdio.h>
int main(void)
	{
	int n1 = 0;
	int n2 = 0;
	char c;

	printf("첫번째 수 입력하기: ");
	scanf("%d", &n1);

	printf("계산할 연산자 입력: ");
	scanf(" %c", &c); //문자 하나를 입력받을 때 한칸을 띄워 주어야한다.

	printf("두번째 수 입력하기: ");
	scanf("%d", &n2);

	switch (c)
	{
	case '+': //c에 +를 입력할 때 밑문장이 출력됨
		printf("%d + %d = %d", n1, n2, n1 + n2);
		break;

	case '-': //c에 -를 입력할 때 밑문장이 출력됨
		printf("%d - %d = %d", n1, n2, n1 - n2);
		break;

	case '*': //c에 *를 입력할 때 밑문장이 출력됨
		printf("%d * %d = %d", n1, n2, n1 * n2);
		break;

	case '/'://c에 /를 입력할 때 밑문장이 출력됨
		printf("%d / %d = %d", n1, n2, n1 / n2);
		break;

	default://c에 +,-,*,/를 제외한 문자를 입력할 때 밑문장이 출력됨
		printf("잘못 입력하셨습니다.");

	}

	return 0;
}
