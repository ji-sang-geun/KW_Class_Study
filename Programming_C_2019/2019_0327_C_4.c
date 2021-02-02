#include <stdio.h>
int main(void)
{
	int num1, num2;
	double divResult1; 
	double divResult2; 

	printf("num1의 값은?");
	scanf("%d", &num1);
	printf("num2의 값은?");
	scanf("%d", &num2);
    
	divResult1 = num1 / num2; //cast연산자 적용 전
	divResult2 = (double)num1 / (double)num2; // cast연산자 적용 후
	printf("나눗셈의 결과 (cast연산자 사용 전): %f \n", divResult1);
	printf("나눗셈의 결과 (cast연산자 사용 후): %f \n", divResult2);

	return 0;
}
