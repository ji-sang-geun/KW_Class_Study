#include <stdio.h>

struct student //구조체 student 설정
{ 
	char StuNum[20]; //문자형 학번 배열
	char StuName[20]; //문자형 이름 배열
};

struct cominfor
{
	struct student a; // 구조체 안에 구조체 
	char grade;
};

int main(void)
{
	struct cominfor stu1, stu2; 
	printf("이름 입력 : ");
	scanf("%s", stu1.a.StuName); //구조체 안에 구조체 사용 구조체 안 구조체는 변수.멤버.멤버 순으로 접근
	printf("학번 입력 : ");
	scanf("%s", stu1.a.StuNum); //구조체 안에 구조체 사용 구조체 안 구조체는 변수.멤버.멤버 순으로 접근

	printf("이름 입력 : ");
	scanf("%s", stu2.a.StuName); //구조체 안에 구조체 사용 구조체 안 구조체는 변수.멤버.멤버 순으로 접근
	printf("학번 입력 : ");
	scanf("%s", stu2.a.StuNum); //구조체 안에 구조체 사용 구조체 안 구조체는 변수.멤버.멤버 순으로 접근
	
	printf("\n");

	printf("STU1 이름 : %s \n", stu1.a.StuName); //출력
	printf("STU1 학번 : %s \n", stu1.a.StuNum);

	printf("STU2 이름 : %s \n", stu2.a.StuName);
	printf("STU2 학번 : %s \n", stu2.a.StuNum);
	
	return 0; //프로그램 종료
}
