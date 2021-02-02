#include <iostream> // Input-Output Stream Header File Definition

using namespace std;

int CalculateLength(const char* str) // Function to get the length of a string
{
	int length;
	for (length = 0; str[length] != '\0'; length++); // Length is increased until the condition is satisfied.

	return length; // length is returned.
}

int main(void)
{
	char str[128]; // Declare a character array str of size 128
	int left = 0; // The variable left is initialized to 0 because it will take on the first part of the sequence of characters.
	int right; // Declare variable right.
	int change; // Add variable change used when changing variables.

	cout << "Enter the string : ";
	cin.getline(str, 128); // Enter str.

	for (int i = 0; i < CalculateLength(str); i++)
	{
		if (str[i] <= 'Z' && str[i] >= 'A') // If str [i] is an uppercase letter, convert it to lowercase.
		{
			str[i] = str[i] + 32;
		}
		else if (str[i] <= 'z' && str[i] >= 'a') // If str[i] is lowercase, convert it to uppercase.
		{
			str[i] = str[i] - 32;
		}
	}

	right = CalculateLength(str) - 1; // Reset the position of the space before '\ 0' to right.
	for (int i = 0; i < CalculateLength(str) / 2; i++) // The reason for dividing CalculateLength in half is to change the order from the characters at each end.
	{
		change = str[left];
		str[left] = str[right];
		str[right] = change;

		left++;
		right--;
	}

	cout << "Result: " << str << endl;

	return 0; // Normal program termination
}