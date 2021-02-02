#include <stdio.h>
void Swap3(int *ptr1, int *ptr2, int *ptr3) //swap3함수 정의
{
	int temp = *ptr3; //temp = ptr3의 주소값 대입
	*ptr3 = *ptr2; // ptr3의 주소값 = ptr2의 주소값 대입
	*ptr2 = *ptr1; // ptr2의 주소값 = ptr1의 주소값 대입
	*ptr1 = temp; //ptr1의 주소값 = temp 대입
	
}

int main(void)
{
	int num1 = 10; 
	int num2 = 20;
	int num3 = 30;
	printf("%d %d %d \n", num1, num2, num3); // 처음 수 보여주는 출력문

	Swap3(&num1, &num2, &num3); //swap3함수 실행
	printf("%d %d %d \n", num1, num2, num3); // 바뀐 수 보여주는 출력문

	return 0; 
}
