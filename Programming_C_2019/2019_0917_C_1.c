#include <stdio.h>

int main(void)
{
	int a[] = {9,8,7,6};
	int *p = a;

	printf("%d ", *p++); // *p = &a[0]이고 *(p++)랑 같으므로 9가 출력
	printf("%d ", (*p)++); // (*p)++이니 (*p)에서 주소언급이 끝났으므로 8출력
	printf("%d ", *++p); // *++p는 *(++p)이므로 7 출력
	printf("%d ", ++*p); //++(*p)이므로 1이 더해지고  8 출력

	return 0;
}
