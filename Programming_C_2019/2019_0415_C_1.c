#include <stdio.h>
int main(void)
	{
	int n = 0;
	
	printf("n값을 입력하시오: "); 
	scanf("%d", &n); // n값을 입력한다.

	switch (n/10) //n을 10으로 나누었을 때, n이 0이상 10미만이면 0, 10이상 20미만이면 1, 20이상 30미만이면 2로 나온다.
		{
		case 0: // n이 0이상 10 미만일 때 입니당.
			printf("0이상 10미만");
			break;
		
		case 1: // n이 10이상 20미만일 때 입니당.
			printf("10이상 20미만");
			break;

		case 2: // n이 20이상 30미만일 떄 입니당.
			printf("20이상 30미만");
			break;

		default: //30이상일 때, 입니당.
			printf("30이상");
		}
	return 0;
}
