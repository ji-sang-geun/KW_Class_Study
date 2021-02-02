#include <stdio.h> //헤더파일을 정의한다
int main(void)
{
	char str1[1000]; //배열 정의
	char str2; 
	int idx1 = 0;
	int i;

	printf("영단어를 입력하시오: ");
	scanf("%s", str1); //str1을 입력하게끔한다.

	while (str1[idx1] != '\0') // str[idx1]이 '\0'이 아니라면 idx1이 하나씩 늘어난다.
	{
		idx1++;
	}

	for (i = 0; i < idx1 / 2; i++) // i= 0이고 i가 idx/2로 나누는거보다 작을 때 i는 1씩 늘어난다.
	{
		str2 = str1[i];//str2에 i가 1씩 늘어나는 str[i]를 저장
		str1[i] = str1[(idx1 - i) - 1];
		str1[(idx1 - i) - 1] = str2;
	}

	printf("%s", str1); //결과 출력
	return 0;
}
