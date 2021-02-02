#include <stdio.h>

int main(void)
{
	int i, j;

	int darr1[8][8] = { // 상을 입력받을 세로 가로 8 x 8 배열을 만들었습니다
		{0}, {0}
	};
	int darr2[8][8] = { // 근을 입력받을 세로 가로 8 x 8 배열을 만들었습니다.
		{0},{0}
	};

	for (i = 0; i < 8; i++) // 8 x 8 배열에 "상" 을 적을 반복문 입니다.
	{
		for (j = 0; j < 8; j++) 
		{
			if (i==0)
			{
				if(j==2 || j==6)
				{
					printf("*", darr1[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 1)
			{
				if (j == 1 || j == 3 || j==6)
				{
					printf("*", darr1[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 2)
			{
				if (j == 0 || j == 4 || j==6 || j==7)
				{
					printf("*", darr1[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 3)
			{
				if (j == 6)
				{
					printf("*", darr1[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 4)
			{
				if (j == 3 || j==4)
				{
					printf("*", darr1[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 5)
			{
				if (j == 2 || j == 5)
				{
					printf("*", darr1[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 6)
			{
				if (j == 3 || j==4)
				{
					printf("*", darr1[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else
			{
				printf(" ");
			}
			
		}
		printf("\n");
	}

	for (i = 0; i < 8; i++) // 8 x 8 배열에 "근" 을 적을 반복문 입니다.
	{
		for (j = 0; j < 8; j++)
		{
			if (i == 0)
			{
				if (j == 1 || j == 2 || j==3 || j==4)
				{
					printf("*", darr2[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 1)
			{
				if (j == 4)
				{
					printf("*", darr2[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 2)
			{
				if (j==4)
				{
					printf("*", darr2[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 3)
			{
				if (j == 0 || j==1 || j==2 || j==3 || j==4 || j==5 || j==6 || j==7)
				{
					printf("*", darr2[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 4)
			{
				if (j == 3)
				{
					printf("*", darr2[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 5)
			{
				if (j ==3)
				{
					printf("*", darr2[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else if (i == 6)
			{
				if (j == 3 || j == 4 || j==5 || j==6)
				{
					printf("*", darr2[i][j]);
				}
				else
				{
					printf(" ");
				}
			}
			else
			{
				printf(" ");
			}

		}
		printf("\n");
	}
    return 0;
}
