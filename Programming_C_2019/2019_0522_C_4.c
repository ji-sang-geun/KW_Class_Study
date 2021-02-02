#include <stdio.h>

int main(void)
{
	int arr[6] = { 1,2,3,4,5,6 }; //배열 6칸은 1,2,3,4,5,6으로 초기화
	int *ptr1 = &arr[0]; //*ptr1은 배열 1번째
	int *ptr2 = &arr[5]; //*ptr2는 배열 6번째
	int i, change;

	for (i = 0; i < 3; i++) //3번 반복
	{
		change = *ptr1; 
		*ptr1 = *ptr2;
		*ptr2 = change;

		ptr1 = ptr1 + 1;
		ptr2 = ptr2 - 1;
	}

	for (i = 0; i < 6; i++) //6번 반복
	{
		printf("%d ", *(arr + i));
	}
    
	return 0;
}
