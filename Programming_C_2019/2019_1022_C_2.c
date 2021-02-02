#include <stdio.h>

struct square // 구조체 사각형 설정
{
	int Xpos; // 정수형 x좌표
	int Ypos; // 정수형 y좌표
};

int main(void)
{
	struct square pos1, pos2; // 변수 설정 
	double area; // 넓이 변수 지정

	fputs("1번 좌표 입력 : ", stdout);
	scanf("%d %d", &pos1.Xpos, &pos1.Ypos); //첫번째 좌표 입력

	fputs("2번 좌표 입력 : ", stdout);
	scanf("%d %d", &pos2.Xpos, &pos2.Ypos); //두번째 좌표 입력

	if (pos1.Xpos > pos2.Xpos && pos1.Ypos > pos2.Ypos) //넓이 값이 -가 나오는걸 방지하는 조건문
	{
		area = ((double)(pos1.Xpos - pos2.Xpos) * (pos1.Ypos - pos2.Ypos)); // 넓이 구하는 공식
	}

	else if (pos1.Xpos > pos2.Xpos && pos1.Ypos < pos2.Ypos) //넓이 값이 -가 나오는걸 방지하는 조건문
	{
		area = ((double)(pos1.Xpos - pos2.Xpos) * (pos2.Ypos - pos1.Ypos)); // 넓이 구하는 공식
	}
	
	else if (pos1.Xpos < pos2.Ypos && pos1.Ypos > pos2.Ypos) //넓이 값이 -가 나오는걸 방지하는 조건문
	{
		area = ((double)(pos2.Xpos - pos1.Xpos) * (pos1.Ypos - pos2.Ypos)); // 넓이 구하는 공식
	}
	
	else //넓이 값이 -가 나오는걸 방지하는 조건문
	{
		area = ((double)(pos1.Xpos - pos2.Xpos) * (pos1.Ypos - pos2.Ypos)); // 넓이 구하는 공식
	}

	printf("사각형의 넓이 : %g ", area); //출력
	return 0; //프로그램 종료
}
