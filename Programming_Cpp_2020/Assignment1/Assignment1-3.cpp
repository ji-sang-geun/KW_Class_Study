#include <iostream> // Input-Output Stream Header File Definition
#include <string> // string Header File Definition
#include <cmath> // cmath Header File Definition

using namespace std;

int main(void)
{
	int n; // The variable n is user input value
	string input; // String input is user input bitstream value 
	char bitstream[100] = ""; // Character array for expressing bitstream is initialize to blank
	char changearr[100] = ""; // Character array for changing the position of the bitstream is initialized with spaces
	unsigned int decimal; // The variable decimal is an	unsigned int varialbe for representing in decimal 

	cout << "Input N: ";
	cin >> n;
	cout << endl;

	while (n < 1) // When n is less than 1, exception is handled so that it is input again
	{
		cout << "[Error]Plz Write over than 0 Write Again" << endl;
		cout << "input N: ";
		cin >> n;
		cout << endl;
	}

	cout << "Input Bitstream: ";
	cin >> input;
	cout << endl;

	for (int j = 0; j < input.length(); j++)  // input.length is the length of the string entered in String
	{
		if (input[j] >= '0' && input[j] <= '1') // if input is 0 or 1, Assign the input input from the user to the array changearr
		{
			changearr[j] = input[j];
		}
		else // Exception processing to receive input again when "String input" is not 0 or 1
		{
			while (input[j] < '0' || input[j] > '1')
			{
				cout << "[Error]Plz Write 0 or 1 Write Again" << endl;
				cout << "Input Bitstream: ";
				cin >> input;
				cout << endl;
			}
			for (int j = 0; j < input.length(); j++)
			{
				changearr[j] = input[j];
			}
		}
	}

	for (int i = 0; i < n; i++)
	{
		decimal = 0; // Initialize to 0 to prevent the garbage value from appearing in decimal
		cout << i + 1 << ": ";

		for (int j = 0; j < strlen(changearr); j++) //strlen(changearr) is character array changearr's length of input string
		{
			bitstream[j] = changearr[strlen(changearr) - 1 - j]; // Reverse the order of bitstream's and changearr's arrays
		}

		for (int j = 0; j < strlen(bitstream); j++) // A sentence that changes 0 to 1 and 1 to 0
		{
			if (bitstream[j] == '0')
			{
				bitstream[j] = '1';
			}
			else if (bitstream[j] == '1')
			{
				bitstream[j] = '0';
			}
		}

		if ((i + 1) % 2 == 1) // Concatenate 1 to the odd round.
		{
			bitstream[strlen(bitstream)] = '1';
		}
		else if ((i + 1) % 2 == 0) // Concatenate 0 to the even round.
		{
			bitstream[strlen(bitstream)] = '0';
		}

		for (int j = 0; j < strlen(bitstream); j++) // Bitstream to decimal
		{
			changearr[j] = bitstream[j];
			if (j < 32) // The reason it is less than 32 is that if it exceeds 0 to 31, it becomes the overflow indicated in the condition.
			{
				decimal = (pow(2, j) * (bitstream[strlen(bitstream) - 1 - j] - 48) + decimal);
			}
		}

		cout << bitstream << endl << endl;
		cout << decimal << endl << endl;
	}

	return 0; // Normal program termination
}