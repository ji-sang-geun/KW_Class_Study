#include <stdio.h> // 헤더파일 정의하기.

int main(void)

{
	char ch1[100] = { 0 }; //문자형 ch1배열 정의 및 초기화.
	char ch2[100] = { 0 }; //문자형 ch2배열 정의 및 초기화.

	fputs("문자를 입력하세요 \n", stdout); // 오늘 배운 입출력함수 사용
	fgets(ch1, sizeof(ch1), stdin); //오늘 배운 입출력함수 사용


	for (int i = 0; i < sizeof(ch1); i++) // for문으로 문자열 입력 받은 것을 하나씩 대문자 혹은 소문자로 바꾸는 것을 반복하는 반복문
	{
		if (65 <= ch1[i] && ch1[i] <= 90) // 대문자에서 소문자로 바꿔주는 조건문
		{
			ch2[i] = ch1[i] + 32; // 소문자와 대문자의 아스키 코드 크기 차이가 32이기 때문에 32를 더함
		}

		else if (97 <= ch1[i] && ch1[i] <= 122) // 소문자에서 대문자로 바꿔주는 조건문
		{
			ch2[i] = ch1[i] - 32; // 소문자와 대문자의 아스키 코드 크기 차이가 32이기 때문에 32를 뺌
		}

		else if (ch1[i] == 32) // 만약 띄어쓰기가 공백인 경우 공백도 나타내줘야하기 때문에 해준 조건문
		{
			ch2[i] = ch1[i];
		}
	}
	fputs(ch2, stdout); printf("\n"); // 출력문
	return 0;
}			else // 대문자 혹은 소문자를 제외한 문자를 썼을때 종료하는 조건문
			{
				return 0; 
			}
		}
		return 0;
	}
}
