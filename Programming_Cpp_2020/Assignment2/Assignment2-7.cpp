#include <iostream> // Input / output standard header file definition

using namespace std;

class Pharmacist // Define class Pharmacist
{
	// The initial value of the mask is set to 5 and 1000 won per piece to implement as exactly as the example.
public:
	int number = 5;
	int price = 1000;
};

class Buyer // Define class Buyer 
{
	// The initial value of money is set to 3000 won to implement as much as possible in the example.
public:
	int get = 0;
	int number = 0;
	int money = 3000;
};

int main(void)
{
	Pharmacist Sellmask;
	Buyer Buymask;
	int number = 9; // Prevents the garbage value from entering the number, and 0 ~ 5 is the number used in the program.
	int coin = 0; // Initialize to zero to prevent the garbage value from entering the coin

	while (number != 0)
	{
		cout << "0. 프로그램 종료" << endl;
		cout << "1. 마스크 재고 물어보기" << endl;
		cout << "2. 마스크 가격 물어보기" << endl;
		cout << "3. 마스크 구매하기" << endl;
		cout << "4. 내 마스크 갯수 확인하기" << endl;
		cout << "5. 내 지갑 확인하기" << endl;
		cin >> number;

		if (number == 0) // If number is 0, the program ends.
		{
			cout << endl;
			cout << "프로그램 종료";
			return 0;
		}
		else if (number == 1) // Condition statement that outputs the number of remaining masks when number is 1
		{
			cout << "남은 마스크 갯수: " << Sellmask.number << "개";
			cout << endl;
			cout << endl;
		}
		else if (number == 2) // Conditional statement to output mask price when number is 2
		{
			cout << "마스크 가격: " << Sellmask.price << "원";
			cout << endl;
			cout << endl;
		}
		else if (number == 3) // If number is 3, conditional statement to purchase a mask
		{
			cout << "몇 개를 구매하시겠습니까? "; 
			cout << endl;
			cin >> Buymask.number;
			while (Buymask.number <= 0)
			{
				cout << "몇 개를 구매하시겠습니까? ";
				cout << endl;
				cin >> Buymask.number;
			}
			if (Buymask.money - (Sellmask.price * Buymask.number) >= 0 && Sellmask.number - Buymask.number >= 0) //If the money I have is confirmedand the money I have is more than the money I buy, I can buy it.
			{
				cout << Buymask.number << "개를 구매 완료." << endl;

				Sellmask.number = Sellmask.number - Buymask.number; // The number of digging masks also decreases.
				Buymask.get = Buymask.number + Buymask.get; // The number of masks to buy increases.
				Buymask.money = Buymask.money - (Sellmask.price * Buymask.number); // The buyer's money is reduced by subtracting the price of the mask.
			}
			else if (Sellmask.number - Buymask.number < 0 && coin == 0) // If you buy a mask without checking the money you have, you will be told that you are out of stock when the number of masks you buy exceeds the number of masks you sell.
			{
				cout << "마스크 재고가 부족합니다." << endl;
			}
			else if (Buymask.money - (Sellmask.price * Buymask.number) < 0 && Sellmask.number - Buymask.number >= 0 && coin == 1) // If you check the money you have and try to buy more masks than you have, ask them to fill out the balance.
			{
				cout << "잔액이 부족합니다." << endl;
			}
			else if (Buymask.money - (Sellmask.price * Buymask.number) < 0 && Sellmask.number - Buymask.number < 0 && coin == 1) // If you check the money you haveand buy more masks than you have, consider buying more than the number of masks you sell.
			{
				cout << "마스크 재고와 잔액 모두 부족합니다." << endl;
			}
			cout << endl;
		}
		else if (number == 4) // If number is 4, the number of masks that I currently have is displayed.
		{
			cout << "내 마스크 갯수: " << Buymask.get << "개";
			cout << endl;
			cout << endl;
		}
		else if (number == 5) // If number is 5, it prints the amount I have.
		{
			coin = 1;
			cout << "내 잔액: " << Buymask.money << "원";
			cout << endl;
			cout << endl;
		}
		else // if an error message is outputted when the values ​​excluding the given values ​​are entered.
		{
			system("cls");
			cout << "[ERROR] Please Write Again" << endl;
			cout << endl;
		}
	}
	return 0; // End of Program
}