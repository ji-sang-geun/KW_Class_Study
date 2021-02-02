#include <stdio.h>

int main(void)
{
	int arr[5] = { 1,2,3,4,5 }; //배열을 1,2,3,4,5로 초기화 시킨다.
	int * ptr = arr; // 주소값이 변경되는 포인터와 배열 arr은 같음
	int i; 

	for (i = 0; i < 5; i++)
	{
		*ptr = *ptr + 2;//ptr의 값을 2증가
		ptr++; //ptr[0] -> ptr[1] 이런식으로 다음 배열로 이동
	}

	for (i = 0; i < 5; i++)
	{
		printf("%d ", *(arr + i));// 출력문 5번 반복
	}

	return 0;

}
