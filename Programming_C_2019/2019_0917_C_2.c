#include <stdio.h>

void merge(int *A, int *B, int *C, int size) // 반환값이 없는 merge함수
{

	int i; // 8번 반복하기 위해 만든 int형 변수
	int a = 0; // a는 4개이기 때문에 8 /2 로 함
	int b = 0; // b도 마찬가지로 4개이기 때문에 8/2로 함

	for (i = 0; i < size; i++) // 8번 반복문이다.
	{
		if (A[a] < B[b]) // 배열 A가 B보다 작다는 조건문이다.
		{
			C[i] = A[a];
			if (a == 4 ) //혹시 A가 4이상일 경우를 대비한 조건문
			{
				C[i] = B[b];
				b++;
			}
			a++;
			
		}
		else if (A[a] > B[b]) // 배열 A가 B보다 클 때를 나타내는 조건문
		{
			C[i] = B[b];
			b++;
		}
	}

	printf("A = {"); //A 출력
	for (i = 0; i < size / 2; i++)
	{
		printf(" %d ", A[i]);
	}
	printf("} \n");

	printf("B = {"); //B 출력
	for (i = 0; i < size / 2; i++)
	{
		printf(" %d ", B[i]);
	}
	printf("} \n");

	printf("C = {"); //C 출력
	for (i = 0; i < size; i++)
	{
		printf(" %d ", C[i]);
	}
	printf("} \n");
}

int main(void)
{
	int A[] = { 1, 3, 4, 6 }; // 배열 A를 1,3,4,6으로 초기화
	int B[] = { 2,5,7,8 }; // 배열 B를 2,5,7,8으로 초기화
	int C[8]; //배열 길이가 8인 C배열

	merge(A, B, C, sizeof(C) / sizeof(int));
	return 0;
}
