#include <stdio.h>
int main(void)
{
	int cur; // cur 정의
	int is; // is 정의

	for (cur = 2; cur < 10; cur++)// cur 초기값 2 정의 cur 10 미만일때만 반복 cur은 1씩 추가
	{
		for (is = 1; is < 10; is++)// is 초기값 1 정의 is 10미만일때만 반복 is는 1씩 추가	
		{
			printf("%d x %d = %d \n", cur, is, cur*is);
		}
	}
	return 0;
}
