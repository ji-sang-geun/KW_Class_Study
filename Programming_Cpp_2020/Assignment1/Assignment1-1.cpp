#include <iostream> // Input-Output Stream Header File Definition

using namespace std;

int main(void) // Main Function
{
	int num, k, save; // The variable num is input value, k is squared value, save is define to make a squared, gumsa is a variable to check.
	int gumsa = 1; // The gumsa is a variable to check, and initialize to 1

	cout << "Enter the power of 3: ";
	cin >> num;

	save = num;

	for (k = 0; save > 1; k++) // To make (k)square
	{
		save = save / 3;
	}
	for (int i = 0; i < k; i++)
	{
		gumsa = gumsa * 3; // To make (k)th to the power
	}

	while (1) // When token is 0
	{
		if (num < 3 || num >2187) // 2187 means 3 to the 7th power, Exception handling when n is less than 3 or greater than 2187
		{
			gumsa = 1;
			cout << "[Error] Out of Range. Write Again" << endl; // Print Error message and then Write again
			cout << "Enter the power of  3: ";
			cin >> num;

			save = num;
			for (k = 0; save > 1; k++)
			{
				save = save / 3;
			}
			for (int i = 0; i < k; i++)
			{
				gumsa = gumsa * 3;
			}
		}

		else if (gumsa != num) // gumsa means (k)th power of 3. This is a conditional statement for exception handling because gumsa may not be the same as num.
		{
			gumsa = 1;
			cout << "[Error] Not power of 3. Write Again" << endl; // Print Error message and then Write again
			cout << "Enter the power of  3: ";
			cin >> num;
			save = num;
			for (k = 0; save > 1; k++)
			{
				save = save / 3;
			}
			for (int i = 0; i < k; i++)
			{
				gumsa = gumsa * 3;
			}
			if (gumsa == num)
			{
				break;  // To escape the loop
			}
		}

		else
		{
			break; // To escape the loop
		}
	}

	char** arr = new char* [num]; // Define Dynamic Memory Allocation 2 dimentional array arr 
	for (int i = 0; i < num; i++)
	{
		arr[i] = new char[num];
	}

	for (int i = 0; i < num; i++) // loop responsible for column
	{
		for (int j = 0; j < num; j++) // loop responsible for row
		{
			if (((i % 3 == 1) && (j % 3 == 1)) || (((i / 3) % 3 == 1) && ((j / 3) % 3 == 1)) || (((i / 9) % 3 == 1) && ((j / 9) % 3 == 1)) || (((i / 27) % 3 == 1) && ((j / 27) % 3 == 1)) || (((i / 81) % 3 == 1) && ((j / 81) % 3 == 1)) || (((i / 243) % 3 == 1) && ((j / 243) % 3 == 1)) || (((i / 729) % 3 == 1) && ((j / 729) % 3 == 1)))
				// Condition statement that handles the conditions that match the output statement
			{
				arr[i][j] = ' ';
				cout << arr[i][j]; // Print blank
			}
			else
			{
				arr[i][j] = '$';
				cout << arr[i][j]; // Print $
			}
		}
		cout << endl; // Move to the next line 
	}

	for (int i = 0; i < num; i++) // Define Dynamic Memory Deallocation 2 dimentional array arr
	{
		delete[]arr[i];
	}
	delete[]arr;

	return 0; // Normal program termination
}