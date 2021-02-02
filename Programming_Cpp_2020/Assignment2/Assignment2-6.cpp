#include <iostream> // Input / output standard header file definition

using namespace std;

class ThreeSixNine // Define Class 369
{
public: // We declare void print369 in public.
	void print369(int number)
	{
		int number1 = 1; // Initialize to 1 because number starts at 1
		int simbol;
		while (number1 <= number) // Repeated loop if number1 is less than number
		{
			simbol = 1;
			if (number1 >= 100) // If number1 exceeds 100, divide it into 100 units, 10 units, and 1 unit
			{
				int hundred = number1 / 100;
				int ten = (number1 % 100) / 10;
				int one = (number1 % 100) % 10;
				if (hundred % 3 == 0) // Divide by 3 to print an exclamation mark if the rest is 0
				{
					cout << "!";
					simbol = 0;
				}
				if (ten % 3 == 0 && ten % 10 != 0)
				{
					cout << "!";
					simbol = 0;
				}
				if (one % 3 == 0 && one % 10 != 0)
				{
					cout << "!";
					simbol = 0;
				}
			}
			else if (number1 < 100 && number1 >= 10) // If it is between 10 and 99, divide it into 10 units and 1 unit
			{
				int ten = number1 / 10;
				int one = number1 % 10;
				if (ten % 3 == 0) // When divided by 3, if the rest is 0, an exclamation mark is printed.
				{
					cout << "!";
					simbol = 0;
				}
				if (one % 3 == 0 && one % 10 != 0)
				{
					cout << "!";
					simbol = 0;
				}
			}
			else if (number1 >= 1 && number1 < 10) // If 1 to 9, divide by 1 unit
			{
				int one = number1 % 10;
				if (one % 3 == 0)
				{
					cout << "!";
					simbol = 0;
				}
			}
			if (simbol == 1)
			{
				cout << number1; // If simbol is 1, only number1 is printed.
			}
			cout << "\t";
			number1++; // number1 is increased by one.
			if (number1 % 10 == 1) // Cut it into 10 units and make it into the next line for easy viewing.
			{
				cout << endl;
			}
		}
	}
};

int main(void) // define main function
{
	int num; // It receives the num from the user and uses it as an argument of the 369 game based on this.
	ThreeSixNine game; // define 369 game

	cout << "input your number" << endl;
	cin >> num;

	while (num > 300 || num < 1) // If it exceeds 300 or is less than 1, it is input again.
	{
		cout << "input your number Again" << endl;
		cin >> num;
	}

	game.print369(num);
	cout << endl;

	return 0; // End of program
}