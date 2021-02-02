#include <iostream> // Input-Output Stream Header File Definition

using namespace std;

int main(void)
{
	char alphabet; // input user's phone name is A or B, C, D.
	int text, call; // input text and call value. 
	int result[3]; // Array result is user's result.
	int MonthFee[4] = { 10000,15000,20000,25000 }; // This array is  A,B,C,D' s month price.
	int FreeText[4] = { 100, 150,200,250 }; // This array is A,B,C,D' s FreeText.
	int FreeCall[4] = { 60,90,120,150 }; // This array is A,B,C,D' s FreeCall
	int ExtraText[4] = { 20,15,10,5 }; // Array Extratext means that if you exceed freetext, you have to pay per text
	int ExtraCall[4] = { 180,150,60,30 }; // Array Extracall means that if you exceed freecall, you have to pay per minute.

	cout << "Which type: ";
	cin >> alphabet;

	while (alphabet != 'A' && alphabet != 'B' && alphabet != 'C' && alphabet != 'D') // if alphabet is not A or B,C,D Again, enter the alphabet.
	{
		cout << "[Error] No User's phone Name" << endl;
		cout << "Which type: ";
		cin >> alphabet;
	}

	cout << endl << "Text: ";
	cin >> text;

	while (text < 0) // if text is under than 0, Enter the text again.
	{
		cout << "[Error] Text is under than 0" << endl;
		cout << "Text: ";
		cin >> text;
	}

	cout << endl << "CALL: ";
	cin >> call;

	while (call < 0) // if call is under than 0, Enter the call again.
	{
		cout << "[Error] Call is under than 0" << endl;
		cout << "CALL: ";
		cin >> call;
	}

	cout << endl;

	switch (alphabet)
	{
	case 'A': // user's phone name is A
	{
		if (text > FreeText[0]) // if freetext exceeded
		{
			result[0] = (text - FreeText[0]) * ExtraText[0];
		}
		else // if freetext not exceeded
		{
			result[0] = 0;
		}

		if (call > FreeCall[0]) // if freecall exceeded
		{
			result[1] = (call - FreeCall[0]) * ExtraCall[0];
		}
		else // if freecall not exceeded
		{
			result[1] = 0;
		}
		result[2] = result[1] + result[0] + MonthFee[0]; // and then monthly fee plus is result
		break; // escape the case
	}

	case 'B':
	{
		if (text > FreeText[1]) // if freetext exceeded
		{
			result[0] = (text - FreeText[1]) * ExtraText[1];
		}
		else
		{
			result[0] = 0;
		}

		if (call > FreeCall[1]) //if freecall exceeded
		{
			result[1] = (call - FreeCall[1]) * ExtraCall[1];
		}
		else
		{
			result[1] = 0;
		}
		result[2] = result[1] + result[0] + MonthFee[1]; // and then monthly fee plus is result
		break;
	}

	case 'C':
	{
		if (text > FreeText[2]) // if freetext exceeded
		{
			result[0] = (text - FreeText[2]) * ExtraText[2];
		}
		else
		{
			result[0] = 0;
		}

		if (call > FreeCall[2]) // if freecall exceeded
		{
			result[1] = (call - FreeCall[2]) * ExtraCall[2];
		}
		else
		{
			result[1] = 0;
		}
		result[2] = result[1] + result[0] + MonthFee[2]; // and then monthly fee plus is result
		break;
	}

	case 'D':
	{
		if (text > FreeText[3]) // if freetext exceeded
		{
			result[0] = (text - FreeText[3]) * ExtraText[3];
		}
		else
		{
			result[0] = 0;
		}

		if (call > FreeCall[3]) // if freecall exceeded
		{
			result[1] = (call - FreeCall[3]) * ExtraCall[3];
		}
		else
		{
			result[1] = 0;
		}
		result[2] = result[1] + result[0] + MonthFee[3]; // and then monthly fee plus is result
		break;
	}
	}

	cout << "=========" << endl;
	cout << "Result" << endl << endl;
	cout << "Extra text: " << result[0] << endl << endl;
	cout << "Extra call: " << result[1] << endl << endl;
	cout << "Total: " << result[2] << endl;

	return 0; // Normal program termination
}