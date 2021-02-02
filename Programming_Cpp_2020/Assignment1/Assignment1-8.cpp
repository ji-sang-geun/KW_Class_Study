#include <iostream> // Input-Output Stream Header File Definition
#include <fstream>  // Input file stream Header File Definition
#include <string> // String Header File Definition
#include <sstream> // Sstream Header File Definition

using namespace std;

int main(void)
{
	ifstream input("ciphertext.txt"); // Reading values ​​from file
	string str; // define string variable str 

	int decimal[10000]; // Define Array decimal
	int num = 0; // the variable num is initialize to 0. because this is to prevent garbage value.
	int value = 0; // the variable value is initialize to 0. because this is to prevent garbage value.

	if (input.is_open() == 1) // ifstream input.is_open is 1. that means input file is open. if) ifstream input.is_open is 0. that means input file is close
	{
		while (getline(input, str)) // Print (str = cipertext.txt's contents). 
		{
			cout << "ciphertext: " << str;
			cout << endl;
		}
	}

	string strtoten; // Define string strtolen. Its role is to store the str in the string strtolen to decipher the hexadecimal number into a decimal number.
	stringstream ss(str); // Save str in stringstream ss

	while (ss >> strtoten) // There is no blank space because it is output as one string ex)1D,6B
	{
		decimal[num] = stoi(strtoten, 0, 16); // Hexadecimal is converted to decimal by using stoi function for Array decimal.
		num++;
	}

	for (int time = 0; time < 128; time++) // time means to find decryption value 
	{
		cout << "key(" << time << "): ";
		for (int i = 0; i < num; i++)
		{
			value = decimal[i] + time; // value is decimal + time;
			if (value > 128) // if) value is over than 128
			{
				value = value - 128; // ASCII code isn't over than 128. If it exceeds 128, subtract 128 from the value.
			}
			cout << (char)value << " ";
		}
		cout << endl;
	}

	input.close(); // File close

	return 0; // Normal program termination
}