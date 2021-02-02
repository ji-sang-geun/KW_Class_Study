#include <stdio.h>
int main(void)
{
	int total = 0; //total에 덤프값이 안작성되도록 미리 0으로 초기화
	int num; //num변수 선언
	while (1) // while (1)문은 참일때 계속 반복하는 무한루프문 
	{
		printf("정수를 입력하시오: ");
		scanf("%d", &num);
		total = num + total;
		if (num == 0) //만약 num이 0이 된다면
		{
			break; // break로 while(1)인 무한루프문을 빠져나간다
		}
	}
	printf("입력된 모든 정수의 합: %d", total); // total값 출력
	return 0;
}
