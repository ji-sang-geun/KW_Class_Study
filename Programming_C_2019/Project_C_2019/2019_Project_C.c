#include <stdio.h> 
#include <conio.h> //_getch함수 사용하기 위한 헤더파일
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX 100		//MAX가 100으로 정의

struct Information {
	char food_time[40];		// 시간대
	char food_name[40];		// 식당 이름
	char food_phone[40];	// 전화번호
	char food_menu[40];		// 음식메뉴
	int food_price;			// 가격
}food[MAX];					//구조체 변수 food[MAX] 선언, 100개의 배열

typedef struct Information foodInfo;

char fname[] = "foodinfo.txt";//확인할 파일명
//"C:\\Users\\지상근\\source\\repos\\test1022\\foodinfo.txt";
//"C:\\Users\\지상근\\Desktop\\foodinfo.txt";
int size = 0;
int key_input;

int find_index(foodInfo food[], char *name);	//찾기
void add_food_Infomation(foodInfo food[]);		//추가
void output_food_Infomation(foodInfo food[]);	//출력
void delete_food_Infomation(foodInfo food[]);	//삭제
void update_food_Infomation(foodInfo food[]);	//수정
void sort_food_information(foodInfo food[]);	//정렬
void flip_food_information(foodInfo food[]);	//랜덤프로그램

//파일 저장, 로드
void file_save(foodInfo food[]);
void file_load(foodInfo food[]);

int flip();										//랜덤
void main(void)
{
	int menu = 0;	// 메뉴 번호 입력

	do
	{
		// 메뉴 입력 받기
		printf("=====<<		메뉴	>>===== \n");
		printf("\t0. 파일 불러 오기(두 번 사용 시 오류) \n");
		printf("\t1. 식당 추가\n");
		printf("\t2. 식당 삭제(조회후 사용 가능) \n");
		printf("\t3. 식당 수정\n");
		printf("\t4. 식당 목록\n");
		printf("\t5. 식당 정렬\n");
		printf("\t6. 랜덤 식당 추천(파일 불러 오기 후 사용) \n");
		printf("\t7. 프로그램 종료\n");
		printf("=============================== \n");
		printf("-------->메뉴선택[     ]\b\b\b\b");

		scanf("%d", &menu);

		switch (menu)
		{
		case 0: //불러오기
			file_load(food);
			break;
		case 1:	//추가
			add_food_Infomation(food);
			break;
		case 2:	//삭제
			delete_food_Infomation(food);
			break;
		case 3:	//수정
			update_food_Infomation(food);
			break;
		case 4:	//목록
			output_food_Infomation(food);
			break;
		case 5:	//정렬
			sort_food_information(food);
			break;
		case 6:	//랜덤프로그램
			flip_food_information(food);
			break;
		case 7: //종료
			printf("프로그램을 종료 합니다. \n\n");
			break;

		default: //재입력
			printf("잘못입력 하셨습니다. 다시 입력하세요. \n");
			break;
		}

		printf("\n >> 계속하시려면 아무키나 누르세요.\n");
 		key_input = _getch(); 
		system("cls");	//화면 초기화

	} while (menu != 7);

	file_save(food);		//파일에 저장
}

//추가
void add_food_Infomation(foodInfo food[]) {

	if (size < MAX){
		printf("\n 시간대를 입력하세요. ");
		scanf("%s", food[size].food_time);

		printf("\n 식당 이름을 입력하세요. ");
		scanf("%s", food[size].food_name);

		printf("\n 전화 번호를 입력하세요. ");
		scanf("%s", food[size].food_phone);

		printf("\n 음식 메뉴를 입력하세요. ");
		scanf("%s", food[size].food_menu);

		printf("\n 음식 가격을 입력하세요. ");
		scanf("%d", &food[size].food_price);		//숫자는 주소값을 넘겨 줘야 한다.!!!int형 !! 중요 !! & 확실히 붙이기 !!

		printf("\n %d번째 %s 식당의 정보 등록을 완료 하였습니다. \n", size + 1, food[size].food_name);

		size++;
	}
	else{
		printf("\n%d개를 초과해서 더이상 정보입력을 받을 수 없습니다. \n", MAX); // 100개를 넘어갈 시, 정보를 더이상 입력받지 못하게 설정하고 출력
	}

}

//삭제
void delete_food_Infomation(foodInfo food[]) {
	int i;
	int index;
	char name[20];
	char menu[20];

	printf("\n 삭제할 식당 이름을 입력하세요. ");
	scanf("%s", name);

	printf("\n 삭제할 메뉴 이름을 입력하세요. ");
	scanf("%s", menu);

	index = find_index(food, name, menu);
	if (index == -1) {
		printf("찾지 못 하였습니다.");
	}
	else {
		for (i = index; i < size - 1; i++)
		{
			food[i] = food[i + 1];
			printf("\n %s 식당의 정보를 삭제 하였습니다. \n", name);
		}
		size--;
	}
}

//찾는 식당 이름을 각 배열의 이름들과 비교를 하여 맞을 경우 거기에 해당하는 인덱스 값을 넘겨 준다. 
//그 후 그 인덱스 값을 이용하여 삭제나 검색을 하게 된다.
int find_index(foodInfo food[], char *name, char *menu)
{
	int i;
	int n = 0;
	for (i = 0; i < size; i++)
	{
		if (strcmp(food[i].food_name, name) == 0)
		{
			if (strcmp(food[i].food_menu, menu) == 0)
			{
				return i;
			}
		}
	}
	if (n == 0)
	{
		return -1;
	}
}


//수정
void update_food_Infomation(foodInfo food[]){
	int index, i, x;
	char name[20];
	char menu[20];
	printf("검색하고 싶은 식당 이름을 입력해 주세요 : ");
	scanf("%s", name);
	printf("검색하고 싶은 메뉴 이름을 입력해 주세요 : ");
	scanf("%s", menu);

	index = find_index(food, name, menu);
	if (index == -1)
	{
		printf("존재하지 않는 데이터입니다. \n");
	}
	else
	{
		printf("수정하고 싶은 데이터를 입력해 주세요 \n ");
		printf("(1 : 시간대 / 2 : 이름 / 3 : 전화번호 / 4 : 음식메뉴 / 5: 음식가격) : ");
		scanf("%d", &x);

		switch (x)
		{
		case 1:
		{
			printf("수정할 시간대 : ");
			scanf("%s", food[index].food_time);
			break;
		}
		case 2:
		{
			printf("수정할 식당 이름 : ");
			scanf("%s", food[index].food_name);
			break;
		}
		case 3:
		{
			printf("수정할 전화 번호 : ");
			scanf("%s", food[index].food_phone);
			break;
		}
		case 4:
		{
			printf("수정할 음식 메뉴 : ");
			scanf("%s", food[index].food_menu);
			break;
		}
		case 5:
		{
			printf("수정할 음식 가격 : ");
			scanf("%d", &food[index].food_price);
			break;
		}
		default:
		{
			printf("잘못된 입력입니다. \n");
			break;
		}
		}
	}
}


//목록
void output_food_Infomation(foodInfo food[]) {
	//구조체 배열에 있는 내용을 불러 온다.
	int i;
	printf("\n		<<	식당 정보 리스트	>>		\n\n");
	for (i = 0; i < size; i++)
	{
		printf(" 시간대 : %s / 식당 이름 : %s / 전화 번호 : %s / 음식 메뉴: %s / 음식 가격 : %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
	}
}

//파일 저장
void file_save(foodInfo food[]) {
	int i;

	FILE *f = fopen(fname, "w");	//파일 열기
	if (f == NULL) {
		printf("에러가 발생했습니다!");
	}
	else
	{
		for (i = 0; i < size; i++)
			fprintf(f, " %s %s %s %s %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
	}
	fclose(f);
}

//파일에 내용 불러오기
void file_load(foodInfo food[]) {
	int i = 0;

	FILE *f = fopen(fname, "r");
	if (f == NULL) {
		printf("파일을 불러오던 중 에러가 발생했습니다!!\n");
	}
	else
	{
		while (!feof(f)) {
			fscanf(f, "%s %s %s %s %d \n",food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, &food[i].food_price);
			printf(" 시간대 : %s / 식당 이름 : %s / 전화 번호 : %s / 음식 메뉴: %s / 음식 가격 : %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
			i++;
			size++;

		}//while(i<j);
		printf(" 파일의 데이터를 가져 왔습니다.\n");

	}
	fclose(f);
}

//정렬
void sort_food_information(foodInfo food[]) {
	int x, i, j;
	foodInfo temp;

	printf("정렬하고 싶은 데이터를 입력해 주세요 \n");
	printf("(오름차순으로 정렬됩니다.) \n");
	printf("(1 : 시간대 / 2 : 이름 / 3 : 전화번호 / 4 : 음식메뉴 / 5: 음식가격) : ");
	scanf("%d", &x);

	switch (x)
	{
	case 1:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)의 경우 반환값은 st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // 여기서는 st1이 st2보다 작을 경우에만 자리 바꿔줌
				if (strcmp(food[i].food_time, food[j].food_time) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	식당 시간대별 정렬	>>		\n\n");
		break;
	}

	case 2:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)의 경우 반환값은 st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // 여기서는 st1이 st2보다 작을 경우에만 자리 바꿔줌
				if (strcmp(food[i].food_name, food[j].food_name) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	식당 이름별 정렬	>>		\n\n");
		break;
	}

	case 3:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)의 경우 반환값은 st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // 여기서는 st1이 st2보다 작을 경우에만 자리 바꿔줌
				if (strcmp(food[i].food_phone, food[j].food_phone) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	식당 전화 번호별 정렬	>>		\n\n");
		break;
	}

	case 4:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)의 경우 반환값은 st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // 여기서는 st1이 st2보다 작을 경우에만 자리 바꿔줌
				if (strcmp(food[i].food_menu, food[j].food_menu) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	식당 메뉴별 정렬	>>		\n\n");
		break;
	}

	case 5:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)의 경우 반환값은 st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // 여기서는 st1이 st2보다 작을 경우에만 자리 바꿔줌
				if (food[i].food_price > food[j].food_price)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	식당 가격별 정렬	>>		\n\n");
		break;
	}
	
	default:
	{
		printf("잘못된 입력입니다. \n");
		break;
	}
	}

	for (i = 0; i < size; i++)
	{
		printf(" 시간대 : %s / 식당 이름 : %s / 전화 번호 : %s / 음식 메뉴: %s / 음식 가격 : %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
	}
}

//랜덤 프로그램
void flip_food_information(foodInfo food[]) {
	
	int list[1];
	srand(time(NULL));

	int i,j;
	int x;

	printf("\n 시간대를 입력하세요. \n");
	printf("(1 : 아침 / 2 : 점심 / 3 : 저녁) : ");
	scanf("%d", &x);

	switch (x)
	{
		case 1:
		{
			while (1)
			{
				i = 0;
				int idx = 0;
				int number = flip();

				while (idx < i)
				{
					if (list[idx++] == number)
					{
						number = flip();
						idx = 0;
						continue;
					}
				}
				list[i] = number;
				if (strcmp(food[list[i]].food_time, "breakfast") == 0)
				{
					break;
				}
				else
				{
					continue;
				}
			}

			printf("\n		<<	아침 식당 추천 결과	>>		\n\n");

			for (int i = 0; i < 1; i++)
			{
				printf("식당 이름 : %s / 전화 번호 : %s / 음식 메뉴 : %s / 가격 : %d \n", food[list[i]].food_name, food[list[i]].food_phone, food[list[i]].food_menu, food[list[i]].food_price);
				printf("=============================== \n");
			}
			break;
				
		}

		case 2:
		{
			while (1)
			{
				i = 0;
				int idx = 0;
				int number = flip();

				while (idx < i)
				{
					if (list[idx++] == number)
					{
						number = flip();
						idx = 0;
						continue;
					}
				}
				list[i] = number;
				if (strcmp(food[list[i]].food_time, "lunch") == 0)
				{
					break;
				}
				else
				{
					continue;
				}
			}

			printf("\n		<<	점심 식당 추천 결과	>>		\n\n");

			for (int i = 0; i < 1; i++)
			{
				printf("식당 이름 : %s / 전화 번호 : %s / 음식 메뉴 : %s / 가격 : %d \n", food[list[i]].food_name, food[list[i]].food_phone, food[list[i]].food_menu, food[list[i]].food_price);
				printf("=============================== \n");
			}
			break;

		}

		case 3:
		{
			while (1)
			{
				i = 0;
				int idx = 0;
				int number = flip();

				while (idx < i)
				{
					if (list[idx++] == number)
					{
						number = flip();
						idx = 0;
						continue;
					}
				}
				list[i] = number;
				if (strcmp(food[list[i]].food_time, "dinner") == 0)
				{
					break;
				}
				else
				{
					continue;
				}
			}

			printf("\n		<<	저녁 식당 추천 결과	>>		\n\n");

			for (int i = 0; i < 1; i++)
			{
				printf("식당 이름 : %s / 전화 번호 : %s / 음식 메뉴 : %s / 가격 : %d \n", food[list[i]].food_name, food[list[i]].food_phone, food[list[i]].food_menu, food[list[i]].food_price);
				printf("=============================== \n");
			}
			break;

		}
	}
}
	
int flip()
{
	return rand() % size;
}