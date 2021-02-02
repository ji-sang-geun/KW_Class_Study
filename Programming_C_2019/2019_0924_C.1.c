#include <stdio.h>

int main(void)
{
	int a = 10, b = 20; //정수형 변수 a에 10을 대입하고, 정수형 변수 b에 20을 대입한다.
	int *pa = &a, *pb = &b; // 정수형 포인터 변수 pa에 a의 주소값을 대입하고, 정수형 포인터 변수 pb에 b의 주소값을 대입한다.
	int **ppa = &pa, **ppb = &pb; ;// 정수형 이중 포인터 변수 ppa에 pa의 주소값을 대입하고, 정수형 이중 포인터 변수 ppb에 pb의 주소값을 대입한다.
	int *pt; // 정수형 포인터 pt를 선언한다.

	pt = *ppa; //pt는 *ppa인 a의 주소값을 대입한다.
	*ppa = *ppb; // *ppa는 *ppb인 b의 주소값을 대입한다.
	*ppb = pt; // *ppb는 pt를 대입한다. 여기서 pt는 a의 주소값임으로 따라서 *ppb는 a의 주소값이다.

	printf("a : %d, b : %d\n", a, b); // a와 b가 출력되는 출력문.
	printf("*pa : %d, *pb : %d \n", *pa, *pb); // *pa와 *pb가 출력되는 출력문

	return 0; // 반환값 0으로 프로그램 종료
}
