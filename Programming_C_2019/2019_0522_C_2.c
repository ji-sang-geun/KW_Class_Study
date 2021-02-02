#include <stdio.h>

int main(void)
{
	int arr[5] = { 1,2,3,4,5 }; //배열을 1,2,3,4,5로 초기화 시킨다.
	int * ptr = arr; // 주소값이 변경되는 포인터와 배열 arr은 같음
	int i;

	for (i = 0; i < 5; i++)
	{
		*(ptr + i) = *(ptr + i) + 2;//변수 ptr에 저장된 값을 변경시키지않고 덧셈연산을 하기위해 사용
	}

	for (i = 0; i < 5; i++)
	{
		printf("%d ", *(arr + i));// 출력문
	}

	return 0;
}
