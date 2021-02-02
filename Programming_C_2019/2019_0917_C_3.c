#include <stdio.h> // 헤더파일 정의
#include <string.h> // 헤더파일 정의

int main(void)
{
	char *emps[6][2] = { "김소미","서울 서초구 국립도서관", "안재은","부산시 해운대", "김원선","서울시 강남구 역삼동 SDS 멀티 캠퍼스", "진달래", "속초시 대포항 바다 1번지", "한송이", "인천시 남구 새마을 아파트", NULL, NULL }; // 처음 조건 
	char name[10] = { 0 }; //char형 name 배열 선언 및 0으로 초기화
	char *str1 = name; // char형 포인터 str1 선언 및 name으로 초기화
	char *str2; // char형 포인터 str2 선언
	int num = 0; // int형 num 선언 및 0으로 초기화

	printf("검색할 성명 ? "); // 출력문
	gets(str1); // str1 입력 받기

	for (int i = 0; i < 5; i++) // 5번 반복하는 반복문
	{
		str2 = emps[i][0]; // str2에 emp[i][0] 대입

		if (strcmp(str1, str2) == 0) // 만약 str1과 str2 비교해서 같다면
		{
			printf("%s, %s", str1, emps[i][1]); // 출력
			num++; // num 증가
			break; // 반복문에서 나가기
		}
		else if (strcmp(str1, str2) != 0) // 만약 str1과 str2 비교해서 str1이 str2보다 크면 양수 반환 / 작으면 음수 반환
		{
			continue; // 아래 코드를 실행하지 않고 건너뜀
		}
	}
	
	if (num == 0) // num이 0이라면?
	{
		printf("%s, 검색되지 않습니다.\n", str1); // 출력
	}

	printf("\n"); // 한 줄 띄우기

	return 0; // 프로그램 종료
}
