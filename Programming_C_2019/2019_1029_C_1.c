#include <stdio.h>

typedef struct point { //typedef struct point 는 Point와 같다. 
	int xpos;
	int ypos;

}Point;

void SwapPoint(Point *x, Point *y) // 리턴값이 없는 Swap 함수 정의
{
	Point temp; 
	temp = *x;
	*x = *y;
	*y = temp;
}


int main(void)
{
	Point xpos = { 2,4 };
	Point ypos = { 5,7 };

	SwapPoint(&xpos, &ypos); // Swap함수를 사용해 값 변경

	printf("xpos의 좌표 : %d %d \n", xpos.xpos, xpos.ypos); // xpos좌표 출력
	printf("ypos의 좌표 : %d %d \n", ypos.xpos, ypos.ypos); // ypos좌표 출력
	
	return 0;
}
