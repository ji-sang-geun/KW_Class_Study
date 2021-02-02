int main(void) // 메인 함수 정의
{
	char ch, *cp; // 문자형 ch와 문자형 포인터 cp정의
	int num, *ip; // 정수형 num과  정수형 포인터 ip정의
	float f_num, *fp; // float형 f_num과 float형 포인터 fp정의
	double d_num, *dp; // double형 d_num과 double형 포인터 dp정의

	ch = 'A'; num = 100; // ch를 A에 대입하여 초기화, num에 100을 대입하여 초기화
	f_num = 5.6; d_num = 17.5; // f_num에 5.6을 대입하여 초기화, d_num에도 17.5를 대입하여 초기화
	
	cp = &ch; // cp에 ch의 주소값을 대입
	ip = &num; // ip에 num의 주소값을 대입
	fp = &f_num; // fp에 f_num의 주소값을 대입
	dp = &d_num; // dp에 d_num의 주소값을 대입

	printf("1 증가하기 전 변수와 포인터 변수. \n"); 
	printf("변수들의 값 : %5c %5d %10.2f %10.2lf \n", ch, num, f_num, d_num); // 증가하기 전 변수들의 값을 출력 
	printf("포인터 변수에 저장된 주소 : %p %p %p %p \n\n", cp, ip, fp, dp);  // 증가하기 전 변수들의 주소값을 출력

	ch++; num++; f_num++; d_num++; // 후위 연산자로 ch, num, f_num, d_num 1씩 증가
	cp++; ip++; fp++; dp++; // 후위 연산자로 cp, ip, fp, dp 1씩 증가

	printf("1 증가한 후 변수와 포인터 변수. \n");
	printf("변수들의 값 : %5c %5d %10.2f, %10.2lf \n", ch, num, f_num, d_num); // 증가한 후 변수들의 값을 출력  ( 증가하기 전 변수들에 비해 값이 1씩 증가하여 B, 101, 6.60, 18.50 출력)
	printf("포인터 변수에 저장된 주소 : %p %p %p %p \n\n", cp, ip, fp, dp); // 증가한 후 변수들의 주소값을 출력 ( 증가하기 전 변수들의 주소값에 비해 1, 4, 4, 8 바이트씩 증가 ) 

	return 0; // 프로그램 종료
}
