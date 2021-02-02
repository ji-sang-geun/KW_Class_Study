#include <iostream> // Input / output standard header file definition
#include <cstring> 
#include <cctype> // If you include this header, the name declared using the external link in the standard C library header is also declared in the std namespace.
#include <cstdlib> // Header file containing C standard utility functions.

using namespace std;

class exchange //define exchange class 
{
private:
	double money = 0; // money
	char* beforechange; // Currency of the country that changed money
	char* afterchange; // Currency of the country to change money
	char* to; // char pointer to

	char JPY[5] = "JPY"; // Japanese yen comparison
	char KRW[5] = "KRW"; // Comparison of Korean Won
	char CNY[5] = "CNY"; // Chinese Yuan Comparison
	char EUR[5] = "EUR"; // Euro Euro Comparison
	char USD[5] = "USD"; // US Dollar Comparison

public:
	exchange(double money, char* beforechange, char* to, char* afterchange);

};

exchange::exchange(double money, char* beforechange, char* to, char* afterchange) // Constructor with arguments
{
	this->money = money; // Use this to access members that exist in privateand assign values
	this->beforechange = beforechange;
	this->to = to;
	this->afterchange = afterchange;
}

class ToUSD : public exchange // child class of the exchange function
{
private:
	double money;
	char* afterchange;

	int count = 0;
	int coin = 0;

public:
	ToUSD(double money, char* beforechange, char* to, char* afterchange);
	void ShowExchange();
};

ToUSD::ToUSD(double money, char* beforechange, char* to, char* afterchange) : exchange(money, beforechange, to, afterchange) // Constructor with arguments of inherited child class
{
	coin = 0;

	if (strcmp(beforechange, "JPY") == 0)
	{
		this->money = round(money * 11 / 1200); // Converted to Korean money and divided by US money to count dollars
		this->afterchange = afterchange;
		coin = 1; // coin is assigned to 1
	}

	if (strcmp(beforechange, "KRW") == 0) // Convert to Korean money
	{
		this->money = round(money / 1200);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "CNY") == 0) // Converted to Korean money and then divided into US money
	{
		this->money = round(money * 170 / 1200);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "EUR") == 0)  // Converted to Korean moneyand then divided into European money
	{
		this->money = round(money * 1300 / 1200);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "USD") == 0) // US money is printed in US dollars.
	{
		this->money = round(money);
		this->afterchange = afterchange;
		coin = 1;
	}
}

void ToUSD::ShowExchange()
{
	if (coin == 1) // If coin is 1, output value
	{
		cout << money << " " << this->afterchange << endl;
	}
	else // If a value other than 1, that is 0, is set, an input error appears.
	{
		cout << "Input Error" << endl;
	}
}

class ToJPY : public exchange // child class of the exchange function
{
private:
	double money;
	char* afterchange;
	int count = 0;
	int coin = 0;

public:
	ToJPY(double money, char* beforechange, char* to, char* afterchange);
	void ShowExchange();
};

ToJPY::ToJPY(double money, char* beforechange, char* to, char* afterchange) : exchange(money, beforechange, to, afterchange) // Constructor with arguments of inherited child class
{
	coin = 0;

	if (strcmp(beforechange, "USD") == 0) // Convert dollar to Korean money and Japanese yen
	{
		this->money = round(money * 1200 / 11);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "KRW") == 0) // Convert KRW to Japanese Yen
	{
		this->money = round(money / 11);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "CNY") == 0) // Converting the yuan into Korean moneyand converting it into Japanese yen
	{
		this->money = round(money * 170 / 11);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "EUR") == 0) // Convert euros to Korean moneyand Japanese yen
	{
		this->money = round(money * 1300 / 11);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "JPY") == 0) // Convert Japanese Yen to Japanese Yen
	{
		this->money = round(money);
		this->afterchange = afterchange;
		coin = 1;
	}
}

void ToJPY::ShowExchange() // Define ShowExchange () function of void type ToJPY class that outputs Japanese Yen
{
	if (coin == 1)
	{
		cout << money << " " << this->afterchange << endl;
	}
	else
	{
		cout << "Input Error" << endl;
	}
}

class ToKRW : public exchange // child class of the exchange function
{
private:
	double money;
	char* afterchange;
	int count = 0;
	int coin = 0;

public:
	ToKRW(double money, char* beforechange, char* to, char* afterchange);
	void ShowExchange();
};

ToKRW::ToKRW(double money, char* beforechange, char* to, char* afterchange) : exchange(money, beforechange, to, afterchange)
{
	coin = 0;

	if (strcmp(beforechange, "USD") == 0) // Convert dollar to won
	{
		this->money = round(money * 1200);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "JPY") == 0) // Convert yen to won
	{
		this->money = round(money * 11);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "CNY") == 0) // Convert yuan to won
	{
		this->money = round(money * 170);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "EUR") == 0) // Convert euro to won
	{
		this->money = round(money * 1300);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "KRW") == 0) // Keep the original picture as it is.
	{
		this->money = round(money);
		this->afterchange = afterchange;
		coin = 1;
	}
}

void ToKRW::ShowExchange() // Define ShowExchange() function of void type ToKRW class to output Korean Won
{
	if (coin == 1)
	{
		cout << money << " " << this->afterchange << endl;
	}
	else
	{
		cout << "Input Error" << endl;
	}
}

class ToEUR : public exchange // child class of the exchange function
{
private:
	double money;
	char* afterchange;
	int count = 0;
	int coin = 0;

public:
	ToEUR(double money, char* beforechange, char* to, char* afterchange);
	void ShowExchange();
};

ToEUR::ToEUR(double money, char* beforechange, char* to, char* afterchange) : exchange(money, beforechange, to, afterchange)
{
	coin = 0;

	if (strcmp(beforechange, "USD") == 0) // Convert dollar to wonand convert to euro
	{
		this->money = round(money * 1200 / 1300);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "JPY") == 0) // Convert yen to wonand convert to euro
	{
		this->money = round(money * 11 / 1300);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "CNY") == 0) // Convert yuan to wonand convert to euro
	{
		this->money = round(money * 170 / 1300);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "KRW") == 0) // Convert won to euro
	{
		this->money = round(money / 1300);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "EUR") == 0) // Substituting the euro for the euro
	{
		this->money = round(money);
		this->afterchange = afterchange;
		coin = 1;
	}
}

void ToEUR::ShowExchange() // Defining ShowExchange() function of void type ToEUR class that outputs Euro Euro
{
	if (coin == 1)
	{
		cout << money << " " << this->afterchange << endl;
	}
	else
	{
		cout << "Input Error" << endl;
	}
}

class ToCNY : public exchange // child class of the exchange function
{
private:
	double money;
	char* afterchange;
	int count = 0;
	int coin = 0;

public:
	ToCNY(double money, char* beforechange, char* to, char* afterchange);
	void ShowExchange();
};

ToCNY::ToCNY(double money, char* beforechange, char* to, char* afterchange) : exchange(money, beforechange, to, afterchange)
{
	coin = 0;

	if (strcmp(beforechange, "USD") == 0) // Convert dollar to wonand convert to yuan
	{
		this->money = round(money * 1200 / 170);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "JPY") == 0) // Convert yen to wonand then convert to yuan
	{
		this->money = round(money * 11 / 170);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "KRW") == 0) // Currency exchange
	{
		this->money = round(money / 170);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "EUR") == 0) // Convert euro to wonand convert to yuan
	{
		this->money = round(money * 1300 / 170);
		this->afterchange = afterchange;
		coin = 1;
	}

	if (strcmp(beforechange, "CNY") == 0) // Substitute the yuan as it is.
	{
		this->money = round(money);
		this->afterchange = afterchange;
		coin = 1;
	}
}

void ToCNY::ShowExchange() // Define ShowExchange() function of void type ToCNY class that outputs Chinese yuan
{
	if (coin == 1)
	{
		cout << money << " " << this->afterchange << endl;
	}
	else
	{
		cout << "Input Error" << endl;
	}
}

int main(void)
{
	double price = 0;
	char input_price[10] = "";
	char BeforeChange[10] = "";
	char To[10] = "";
	char AfterChange[10] = "";

	char JPY[5] = "JPY";
	char KRW[5] = "KRW";
	char CNY[5] = "CNY";
	char EUR[5] = "EUR";
	char USD[5] = "USD";

	char turn;
	int coin = 0;


	do {
		cout << "¡ÚCurrency Converter¡Ú" << endl;
		cout << "e.g. [Price] KRW to USD" << endl;
		cout << endl;

		coin = 0;

		cin >> input_price;

		for (int i = 0; input_price[i] != NULL; i++) // As an exception handling phrase, if the number part inputted is a prime number, it searches for characters except dotsand causes an Input Error..
		{
			if (input_price[i] < 48 || input_price[i] > 57)
			{
				if (input_price[i] != 46)
				{
					coin = 2;
				}
			}
		}

		if (coin == 0) // If you come through the previous conditional statement, the prime number is judged to be correct, and you use atof to substitute the price.
		{
			price = atof(input_price);
		}

		cin >> BeforeChange;
		cin >> To;

		if ((strcmp(To, "to") == 0) && coin == 0) // If not, it causes an input error.
		{
			coin = 3;
		}

		cin >> AfterChange;

		if (strcmp(AfterChange, "USD") == 0 && coin == 3) // convert to USD
		{
			ToUSD USD(price, BeforeChange, To, AfterChange);
			USD.ShowExchange();
			coin = 1;
		}

		if (strcmp(AfterChange, "JPY") == 0 && coin == 3) // convert to JPY
		{
			ToJPY JPY(price, BeforeChange, To, AfterChange);
			JPY.ShowExchange();
			coin = 1;
		}

		if (strcmp(AfterChange, "KRW") == 0 && coin == 3) // convert to KRW
		{
			ToKRW KRW(price, BeforeChange, To, AfterChange);
			KRW.ShowExchange();
			coin = 1;
		}

		if (strcmp(AfterChange, "EUR") == 0 && coin == 3) // convert to EUR
		{
			ToEUR EUR(price, BeforeChange, To, AfterChange);
			EUR.ShowExchange();
			coin = 1;
		}

		if (strcmp(AfterChange, "CNY") == 0 && coin == 3) // convert to CNY
		{
			ToCNY CNY(price, BeforeChange, To, AfterChange);
			CNY.ShowExchange();
			coin = 1;
		}

		if (coin == 0 || coin == 2 || coin == 3) // If the coin is 0, 2, 3, an input error appears.
		{
			cout << "Input Error" << endl;
			return -1;
		}

		cout << endl;
		cout << "Would you like to continue? (Y/N)" << endl; // Sentence to be re - entered
		cin >> turn;

		if (turn == 'y' || turn == 'Y') //If the turn is Y or y, the system("cls") is triggeredand the screen is reset again.
		{
			system("cls");
		}

		else if (turn == 'n' || turn == 'N') // If N or n, the program ends with Bye !.
		{
			cout << "Bye!" << endl;
		}

		else // If a character other than Y, y, N, n is found, the loop is repeated until it comes out.
		{
			while (1)
			{
				cout << endl;
				cout << "[Error] Plz Write Again" << endl;
				cout << "Would you like to continue ? (Y / N)" << endl;
				cin >> turn;

				if (turn == 'n' || turn == 'N')
				{
					break;
				}
				else if (turn == 'y' || turn == 'Y')
				{
					system("cls");
					break;
				}
			}
		}

	} while (turn == 'y' || turn == 'Y');

	return 0; // End to Program
}