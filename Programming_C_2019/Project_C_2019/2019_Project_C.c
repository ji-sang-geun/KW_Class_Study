#include <stdio.h> 
#include <conio.h> //_getch�Լ� ����ϱ� ���� �������
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX 100		//MAX�� 100���� ����

struct Information {
	char food_time[40];		// �ð���
	char food_name[40];		// �Ĵ� �̸�
	char food_phone[40];	// ��ȭ��ȣ
	char food_menu[40];		// ���ĸ޴�
	int food_price;			// ����
}food[MAX];					//����ü ���� food[MAX] ����, 100���� �迭

typedef struct Information foodInfo;

char fname[] = "foodinfo.txt";//Ȯ���� ���ϸ�
//"C:\\Users\\�����\\source\\repos\\test1022\\foodinfo.txt";
//"C:\\Users\\�����\\Desktop\\foodinfo.txt";
int size = 0;
int key_input;

int find_index(foodInfo food[], char *name);	//ã��
void add_food_Infomation(foodInfo food[]);		//�߰�
void output_food_Infomation(foodInfo food[]);	//���
void delete_food_Infomation(foodInfo food[]);	//����
void update_food_Infomation(foodInfo food[]);	//����
void sort_food_information(foodInfo food[]);	//����
void flip_food_information(foodInfo food[]);	//�������α׷�

//���� ����, �ε�
void file_save(foodInfo food[]);
void file_load(foodInfo food[]);

int flip();										//����
void main(void)
{
	int menu = 0;	// �޴� ��ȣ �Է�

	do
	{
		// �޴� �Է� �ޱ�
		printf("=====<<		�޴�	>>===== \n");
		printf("\t0. ���� �ҷ� ����(�� �� ��� �� ����) \n");
		printf("\t1. �Ĵ� �߰�\n");
		printf("\t2. �Ĵ� ����(��ȸ�� ��� ����) \n");
		printf("\t3. �Ĵ� ����\n");
		printf("\t4. �Ĵ� ���\n");
		printf("\t5. �Ĵ� ����\n");
		printf("\t6. ���� �Ĵ� ��õ(���� �ҷ� ���� �� ���) \n");
		printf("\t7. ���α׷� ����\n");
		printf("=============================== \n");
		printf("-------->�޴�����[     ]\b\b\b\b");

		scanf("%d", &menu);

		switch (menu)
		{
		case 0: //�ҷ�����
			file_load(food);
			break;
		case 1:	//�߰�
			add_food_Infomation(food);
			break;
		case 2:	//����
			delete_food_Infomation(food);
			break;
		case 3:	//����
			update_food_Infomation(food);
			break;
		case 4:	//���
			output_food_Infomation(food);
			break;
		case 5:	//����
			sort_food_information(food);
			break;
		case 6:	//�������α׷�
			flip_food_information(food);
			break;
		case 7: //����
			printf("���α׷��� ���� �մϴ�. \n\n");
			break;

		default: //���Է�
			printf("�߸��Է� �ϼ̽��ϴ�. �ٽ� �Է��ϼ���. \n");
			break;
		}

		printf("\n >> ����Ͻ÷��� �ƹ�Ű�� ��������.\n");
 		key_input = _getch(); 
		system("cls");	//ȭ�� �ʱ�ȭ

	} while (menu != 7);

	file_save(food);		//���Ͽ� ����
}

//�߰�
void add_food_Infomation(foodInfo food[]) {

	if (size < MAX){
		printf("\n �ð��븦 �Է��ϼ���. ");
		scanf("%s", food[size].food_time);

		printf("\n �Ĵ� �̸��� �Է��ϼ���. ");
		scanf("%s", food[size].food_name);

		printf("\n ��ȭ ��ȣ�� �Է��ϼ���. ");
		scanf("%s", food[size].food_phone);

		printf("\n ���� �޴��� �Է��ϼ���. ");
		scanf("%s", food[size].food_menu);

		printf("\n ���� ������ �Է��ϼ���. ");
		scanf("%d", &food[size].food_price);		//���ڴ� �ּҰ��� �Ѱ� ��� �Ѵ�.!!!int�� !! �߿� !! & Ȯ���� ���̱� !!

		printf("\n %d��° %s �Ĵ��� ���� ����� �Ϸ� �Ͽ����ϴ�. \n", size + 1, food[size].food_name);

		size++;
	}
	else{
		printf("\n%d���� �ʰ��ؼ� ���̻� �����Է��� ���� �� �����ϴ�. \n", MAX); // 100���� �Ѿ ��, ������ ���̻� �Է¹��� ���ϰ� �����ϰ� ���
	}

}

//����
void delete_food_Infomation(foodInfo food[]) {
	int i;
	int index;
	char name[20];
	char menu[20];

	printf("\n ������ �Ĵ� �̸��� �Է��ϼ���. ");
	scanf("%s", name);

	printf("\n ������ �޴� �̸��� �Է��ϼ���. ");
	scanf("%s", menu);

	index = find_index(food, name, menu);
	if (index == -1) {
		printf("ã�� �� �Ͽ����ϴ�.");
	}
	else {
		for (i = index; i < size - 1; i++)
		{
			food[i] = food[i + 1];
			printf("\n %s �Ĵ��� ������ ���� �Ͽ����ϴ�. \n", name);
		}
		size--;
	}
}

//ã�� �Ĵ� �̸��� �� �迭�� �̸���� �񱳸� �Ͽ� ���� ��� �ű⿡ �ش��ϴ� �ε��� ���� �Ѱ� �ش�. 
//�� �� �� �ε��� ���� �̿��Ͽ� ������ �˻��� �ϰ� �ȴ�.
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


//����
void update_food_Infomation(foodInfo food[]){
	int index, i, x;
	char name[20];
	char menu[20];
	printf("�˻��ϰ� ���� �Ĵ� �̸��� �Է��� �ּ��� : ");
	scanf("%s", name);
	printf("�˻��ϰ� ���� �޴� �̸��� �Է��� �ּ��� : ");
	scanf("%s", menu);

	index = find_index(food, name, menu);
	if (index == -1)
	{
		printf("�������� �ʴ� �������Դϴ�. \n");
	}
	else
	{
		printf("�����ϰ� ���� �����͸� �Է��� �ּ��� \n ");
		printf("(1 : �ð��� / 2 : �̸� / 3 : ��ȭ��ȣ / 4 : ���ĸ޴� / 5: ���İ���) : ");
		scanf("%d", &x);

		switch (x)
		{
		case 1:
		{
			printf("������ �ð��� : ");
			scanf("%s", food[index].food_time);
			break;
		}
		case 2:
		{
			printf("������ �Ĵ� �̸� : ");
			scanf("%s", food[index].food_name);
			break;
		}
		case 3:
		{
			printf("������ ��ȭ ��ȣ : ");
			scanf("%s", food[index].food_phone);
			break;
		}
		case 4:
		{
			printf("������ ���� �޴� : ");
			scanf("%s", food[index].food_menu);
			break;
		}
		case 5:
		{
			printf("������ ���� ���� : ");
			scanf("%d", &food[index].food_price);
			break;
		}
		default:
		{
			printf("�߸��� �Է��Դϴ�. \n");
			break;
		}
		}
	}
}


//���
void output_food_Infomation(foodInfo food[]) {
	//����ü �迭�� �ִ� ������ �ҷ� �´�.
	int i;
	printf("\n		<<	�Ĵ� ���� ����Ʈ	>>		\n\n");
	for (i = 0; i < size; i++)
	{
		printf(" �ð��� : %s / �Ĵ� �̸� : %s / ��ȭ ��ȣ : %s / ���� �޴�: %s / ���� ���� : %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
	}
}

//���� ����
void file_save(foodInfo food[]) {
	int i;

	FILE *f = fopen(fname, "w");	//���� ����
	if (f == NULL) {
		printf("������ �߻��߽��ϴ�!");
	}
	else
	{
		for (i = 0; i < size; i++)
			fprintf(f, " %s %s %s %s %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
	}
	fclose(f);
}

//���Ͽ� ���� �ҷ�����
void file_load(foodInfo food[]) {
	int i = 0;

	FILE *f = fopen(fname, "r");
	if (f == NULL) {
		printf("������ �ҷ����� �� ������ �߻��߽��ϴ�!!\n");
	}
	else
	{
		while (!feof(f)) {
			fscanf(f, "%s %s %s %s %d \n",food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, &food[i].food_price);
			printf(" �ð��� : %s / �Ĵ� �̸� : %s / ��ȭ ��ȣ : %s / ���� �޴�: %s / ���� ���� : %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
			i++;
			size++;

		}//while(i<j);
		printf(" ������ �����͸� ���� �Խ��ϴ�.\n");

	}
	fclose(f);
}

//����
void sort_food_information(foodInfo food[]) {
	int x, i, j;
	foodInfo temp;

	printf("�����ϰ� ���� �����͸� �Է��� �ּ��� \n");
	printf("(������������ ���ĵ˴ϴ�.) \n");
	printf("(1 : �ð��� / 2 : �̸� / 3 : ��ȭ��ȣ / 4 : ���ĸ޴� / 5: ���İ���) : ");
	scanf("%d", &x);

	switch (x)
	{
	case 1:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)�� ��� ��ȯ���� st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // ���⼭�� st1�� st2���� ���� ��쿡�� �ڸ� �ٲ���
				if (strcmp(food[i].food_time, food[j].food_time) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	�Ĵ� �ð��뺰 ����	>>		\n\n");
		break;
	}

	case 2:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)�� ��� ��ȯ���� st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // ���⼭�� st1�� st2���� ���� ��쿡�� �ڸ� �ٲ���
				if (strcmp(food[i].food_name, food[j].food_name) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	�Ĵ� �̸��� ����	>>		\n\n");
		break;
	}

	case 3:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)�� ��� ��ȯ���� st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // ���⼭�� st1�� st2���� ���� ��쿡�� �ڸ� �ٲ���
				if (strcmp(food[i].food_phone, food[j].food_phone) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	�Ĵ� ��ȭ ��ȣ�� ����	>>		\n\n");
		break;
	}

	case 4:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)�� ��� ��ȯ���� st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // ���⼭�� st1�� st2���� ���� ��쿡�� �ڸ� �ٲ���
				if (strcmp(food[i].food_menu, food[j].food_menu) > 0)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	�Ĵ� �޴��� ����	>>		\n\n");
		break;
	}

	case 5:
	{
		for (i = 0; i < size-1; i++)
		{
			for (j = i+1; j < size; j++) //strcmp(st1,st2)�� ��� ��ȯ���� st1 = st2 : 0 , st1 < st2 : -1 , st1 > st2 : 1
			{ // ���⼭�� st1�� st2���� ���� ��쿡�� �ڸ� �ٲ���
				if (food[i].food_price > food[j].food_price)
				{
					temp = food[i];
					food[i] = food[j];
					food[j] = temp;
				}
			}
		}
		printf("\n		<<	�Ĵ� ���ݺ� ����	>>		\n\n");
		break;
	}
	
	default:
	{
		printf("�߸��� �Է��Դϴ�. \n");
		break;
	}
	}

	for (i = 0; i < size; i++)
	{
		printf(" �ð��� : %s / �Ĵ� �̸� : %s / ��ȭ ��ȣ : %s / ���� �޴�: %s / ���� ���� : %d \n", food[i].food_time, food[i].food_name, food[i].food_phone, food[i].food_menu, food[i].food_price);
	}
}

//���� ���α׷�
void flip_food_information(foodInfo food[]) {
	
	int list[1];
	srand(time(NULL));

	int i,j;
	int x;

	printf("\n �ð��븦 �Է��ϼ���. \n");
	printf("(1 : ��ħ / 2 : ���� / 3 : ����) : ");
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

			printf("\n		<<	��ħ �Ĵ� ��õ ���	>>		\n\n");

			for (int i = 0; i < 1; i++)
			{
				printf("�Ĵ� �̸� : %s / ��ȭ ��ȣ : %s / ���� �޴� : %s / ���� : %d \n", food[list[i]].food_name, food[list[i]].food_phone, food[list[i]].food_menu, food[list[i]].food_price);
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

			printf("\n		<<	���� �Ĵ� ��õ ���	>>		\n\n");

			for (int i = 0; i < 1; i++)
			{
				printf("�Ĵ� �̸� : %s / ��ȭ ��ȣ : %s / ���� �޴� : %s / ���� : %d \n", food[list[i]].food_name, food[list[i]].food_phone, food[list[i]].food_menu, food[list[i]].food_price);
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

			printf("\n		<<	���� �Ĵ� ��õ ���	>>		\n\n");

			for (int i = 0; i < 1; i++)
			{
				printf("�Ĵ� �̸� : %s / ��ȭ ��ȣ : %s / ���� �޴� : %s / ���� : %d \n", food[list[i]].food_name, food[list[i]].food_phone, food[list[i]].food_menu, food[list[i]].food_price);
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