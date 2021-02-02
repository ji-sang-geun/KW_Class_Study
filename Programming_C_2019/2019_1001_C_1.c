#include <stdio.h>

void print_arr(int (*arr)[3]) // 배열의 가로크기만 지정해주는 반환형이 없는 함수
{
	int i, j; //int형 i,j를 선언한다.

	for (i = 0; i < 4; i++) // 4번 반복하는 반복문.(세로)
	{
		for (j = 0; j < 3; j++) // 3번 반복하는 반복문. (가로)
		{
			printf("%d	", arr[i][j]); // arr[4][3] 출력.
		}
		printf("\n"); // 한줄 띄워주는 역할
	}

}

int main(void)
{
	int ary[4][3] = { 1,2,3,4,5,6,7,8,9,10,11,12 }; // 가로가 3이고 세로가 4인 배열지정

	print_arr(ary); // 함수 실행

	return 0; // 반환
}
