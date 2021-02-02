#include <stdio.h>
int main(void)
{
	double rad;
	double area; // 반지름과 넓이를 받는 실수형 변수들 선언
	printf("원의 반지름 입력: ");
	scanf("%lf", &rad); //%lf를 통해서 실수형 변수에 입력 받기 

	area = rad * rad * 3.1415;
	printf("원의 넓이: %lf \n", area); //%lf를 통해서 실수형 변수 출력 
	return 0;
}
