#include <stdio.h>

int main(void)
{
	int arr[5] = { 1,2,3,4,5 }; //배열 5칸 1,2,3,4,5로 초기화
	int *ptr = &arr[4]; 
	int i;
	int total = 0; // total값 초기화

	for (i = 0; i < 5; i++) //5번 반복한다.
	{
		total = total + *(ptr--); 
	}

	printf("%d", total);

	return 0;
}
