#include <stdio.h>
int main(void)
{
	int num[10]; //배열 길이 10칸 지정 
	int i,j; 
	int change; 
	int *ptr1 = num; //포인터 지정

	for (i = 0; i < 10; i++)
	{
		printf("0~9 사이의 숫자 한번씩 입력하기 %d번째 : ", i+1);
		scanf("%d", &num[i]); //숫자 입력받기
	}

	printf("정렬 전 배열 : ");
	
	for (i = 0; i < 10; i++) //정렬 전 배열 출력하기 위한 반복 for문
	{
		printf("%d ", *(ptr1+ i)); 
	}

	printf("\n");

	for (i = 0; i < 9; i++) // 정렬을 하기 위해 버블정렬 사용 - 교수님께서 버블정렬 또는 선택정렬 둘다 가능하다 하셨음
	{
		for (j = i+1; j < 10; j++) 
		{
			if (*(ptr1 + i) > *(ptr1+j))
			{
				change = *(ptr1+i);
				*(ptr1 +i)= *(ptr1+j);
				*(ptr1+j) = change;
			}
			*(ptr1+j);
		}
		*(ptr1+i);
	}

	printf("정렬 후 배열 :"); 

	for (i = 0; i < 10; i++) //정렬 후 배열 출력하기 위한 반복 for문
	{
		printf("%d ", *(ptr1 + i));
	}

	printf("\n");

	return 0; 
}
