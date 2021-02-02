#include <stdio.h>
int main(void)
{
	int total = 0; //total 값은 결과를 나타내기 때문에 중요하므로 dump값이 안쓰이게끔 0으로 정의시켜준다.
	int num; 
	int su = 0; //su 값은1~100 사이 num값의 배수들을 찾는 역할을 하기 때문에 dump값이 안쓰이게끔 0으로 정의시켜준다. 
	while (1)
	{
		while (1) // 결과가 참이면 무한 반복을 시켜주는 무한반복 while문이다.
		{
			printf("정수를 입력하세요 : ");
			scanf("%d", &num);

			if (num > 0 && num <= 100)
			{
				break; // num이 0 초과 또는 100 이하면 무한 반복 while문에서 나오는 역할을 한다.
			}
			else if (num == 0)
			{
				return 0; // 과제에 0값을 입력할 때까지 반복하라해서 0값을 입력하면 프로그램이 종료가 되게 한다.
			}
			else
			{
				printf("다시 입력해주세요 \n"); // 0초과 100이하가 아니거나 0이 아니면 반복되게끔 하였다.
				continue;
			}
		}
			for (su = num; su <= 100; su++) //su를 입력받은 num부터 100까지 1개씩 반복한다.
			{
				if (su % num == 0)  // su를 num으로 나눠서 0이나오면 num에 대한 배수가 된다.
				{
					total = su + total; //su를 total에 num의 100까지 배수의 합까지 더한다.
				}
			}
			printf("총 배수의 합은 : %d \n", total);
			total = 0; // 해당 정수의 100까지 배수들의 합이기 때문에 값 초기화를 시켜줘야 한다. 안그러면 값이 섞인다.
	}
}
