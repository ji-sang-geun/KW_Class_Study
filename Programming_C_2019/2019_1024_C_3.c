#include <stdio.h>
struct e1 //구조체의 크기는 큰 자료형에 의해 표준이 정해지므로 여기선 int형이 표준이 된다. 따라서 4 + 5 +1 에 패딩 2바이트 붙어서 12바이트가 된다.
{
	int a;
	char b[5];
	char c;
};

struct e2 //여기선 bb가 기준이 되고, 크기가 4의 배수가 되도록 패딩이 지정됨으로 크기가 12 + 1 + 3인 16바이트가 된다.
{
	struct e1 aa;
	char bb; // int형일때도 e2의 크기는 16 double형일때는 e2의 크기는 8이 기준이 되므로 12 + 패딩 4바이트 + 8바이트 = 24이다.
};

int main(void)
{
	struct e1 A;
	struct e2 B;
	printf("struct e1과 e2의 크기 : %d %d \n", sizeof(struct e1), sizeof(struct e2)); // 12 16출력!
	printf("struct e1의 주소값 : %p %p %p \n", &A.a, &A.b, &A.c); // 4증가 5증가
	printf("struct e2의 주소값 : %p %p \n", &B.aa, &B.bb); // 12증가

	return 0;

}
