#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main(void)
{
	char adress[1000]; // char형 문자열 배열을 설정 크기는 최대한 크게 해놨습니다.
	char *str; 
	int i = 0; //라인 줄을 출력하라 해서 만든 줄수 체크용 int형 변수 

	printf("파일 이름을 입력하시오 : "); // 파일 이름을 입력하라고 내오는 출력문
	scanf("%s", adress); // 주소를 받는 입력문

	FILE *fp = fopen(adress, "r"); //

	if (fp == NULL) // 만약 그 파일이름이 존재하지 않을 시 
	{
		printf("원본파일 %s을 열 수가 없습니다", adress); // 출력되는 출력문
		return -1; // 프로그램 종료
	}
	
	while(!feof(fp)) //파일을 읽어나가다 파일 끝에 도달하게 되면 0이 아닌 값을 리턴받아 while문을 종료하는 문장
	{
		i++; // 줄수 체크용 전위연산자 사용
		str = fgets(adress, sizeof(adress), fp); // str에 파일 안에 존재하는 문장 대입
		printf("%3d : %s",i, str); // 라인과 명령문을 출력하는 출력문

	}
	fclose(fp); // 파일 스트림을 닫는 문장

	return 0; // 프로그램 종료
}
