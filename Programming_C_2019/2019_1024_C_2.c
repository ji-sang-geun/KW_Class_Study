#include <stdio.h>

struct e1 //컴파일러가 가장 큰 걸 기준으로 잡음 -> 효율적인 처리를 위해 ex) (double) 의 크기로 잡고 char a; int b넣고 다음 double의 크기로 잡고 double c넣고 double의 크기로 잡고 char d를 넣음
{
	char a;
	int b;
	double c;
	char d;
};

struct e2 // double의 크기를 기준으로 삼고 a,b = 1바이트 c = 4바이트 나머지 2바이트는 패딩바이트 그리고 d 8바이트로 총 16바이트 생성
{
	char a;
	char b;
	int c;
	double d;
};

int main(void)
{
	struct e1 A;
	struct e2 B;
	printf("struct e1과 e2의 크기 구하기 : %d %d \n", sizeof(struct e1), sizeof(struct e2)); // 24 16 출력!
	printf("struct e1의 주소값 : %p %p %p %p\n", &A.a, &A.b, &A.c, &A.d); //&A와 &A.a는 같다. 4증가 4증가 8증가
	printf("struct e2의 주소값 : %p %p %p %p\n", &B.a, &B.b, &B.c, &B.d); //1 3 4증가

	return 0;
}	