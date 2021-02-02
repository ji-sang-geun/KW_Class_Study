#include <stdio.h>

struct point // 포인트 구조체 정의
{

	int xpos; //x좌표 정의
	int ypos; //y좌표 정의
	struct point *ptr1; //구조체 포인터 정의
	struct point *ptr2; 
};

int main(void)
{
	struct point pos1 = { 1,1 }; // 구조체 값 1,1로 초기화 
	struct point pos2 = { 2,2 }; // 구조체 값 2,2로 초기화
	struct point pos3 = { 3,3 }; // 구조체 값 3,3로 초기화

	pos1.ptr1 = &pos2; // pos1.ptr1이 pos2의 주소값에 대입
	pos2.ptr1 = &pos3; // pos2.ptr1이 pos3의 주소값에 대입
	pos3.ptr1 = &pos1; // pos3.ptr1이 pos1의 주소값에 대입

	pos1.ptr2 = &pos3; // pos1.ptr2이 pos3의 주소값에 대입
	pos2.ptr2 = &pos1; // pos2.ptr2이 pos1의 주소값에 대입
	pos3.ptr2 = &pos2; // pos3.ptr2이 pos2의 주소값에 대입

	printf("실행 결과 \n");
	printf("[%d %d]와 [%d %d]와 [%d %d]의 연결 \n", pos1.ptr2->xpos, pos1.ptr2->ypos, pos1.xpos, pos1.ypos, pos1.ptr1->xpos, pos1.ptr1->ypos); //실행 결과 출력
	printf("[%d %d]와 [%d %d]와 [%d %d]의 연결 \n", pos2.ptr2->xpos, pos2.ptr2->ypos, pos2.xpos, pos2.ypos, pos2.ptr1->xpos, pos2.ptr1->ypos); //실행 결과 출력
	printf("[%d %d]와 [%d %d]와 [%d %d]의 연결 \n", pos3.ptr2->xpos, pos3.ptr2->ypos, pos3.xpos, pos3.ypos, pos3.ptr1->xpos, pos3.ptr1->ypos); //실행 결과 출력

	return 0;
}
