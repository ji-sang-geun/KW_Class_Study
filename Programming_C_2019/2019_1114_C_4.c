#include <stdio.h> // 헤더파일 정의

typedef struct point{ // 구조체 point 정의
	int x; // 구조체 멤버 x;
	int y; // 구조체 멤버 y;
} POINT; // typedef를 이용하여 구조체 별칭을 POINT로 정의

struct rectangle { // 구조체 rectangle 정의
	int width; // 구조체 멤버 width
	POINT p[2]; // 구조체 안 구조체 멤버 배열 p[2]
};

int main(void)
{
	struct rectangle rect; //구조체 변수 선언
	POINT rightTop = { 7,10 }; // 구조체 별칭인 POINT로 변수를 선언함과 동시에 {7,10}으로 초기화
	POINT leftDown = { 3,5 }; // 구조체 별칭인 POINT로 변수를 선언함과 동시에 {3,5}로 초기화

	rect.p[0] = rightTop; // rect.p[0]에 rightTop 대입함으로서 x는 7 / y는 10
	rect.p[1] = leftDown; // rect.p[1]에 lefrDown 대입함으로서 x는 3 / y는 5

	rect.width = (rect.p[0].x - rect.p[1].x) * (rect.p[0].y - rect.p[1].y); // 넓이를 구하는 공식으로 rect.p[0].x - rect.p[1].x를 뺌으로서, 가로를 구하고 rect.p[0].y - rect.p[1].y를 뺌으로서, 세로를 구해서 곱한다.

	printf("가로:%d, 세로:%d, 사각형의 넓이:%d 이다.", (rect.p[0].x - rect.p[1].x), (rect.p[0].y - rect.p[1].y), rect.width); // 가로, 세로, 넓이 출력
	printf("\n\n"); // 두줄 띄우기

	return 0; // 프로그램 종료
}
