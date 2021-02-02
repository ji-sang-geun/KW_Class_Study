#include <iostream> // Input-Output Stream Header File Definition
#include <cstdlib> // Define a header file that collects C standard utility functions 
#include <ctime> // Time related header file definition
#include <string> // String Header File Definition

using namespace std;

int main(void)
{
	int RandNum[10] = { 0 }; // The int array ReadNum was created to store 0 to 9, and is initialized to 0 to prevent storage of garbage values ​​in the array.
	int Hit, Blow, gumsa;
	int turn = 0; // The variable turn represents the user's turn and is reset to 0 because it has to be repeated 10 times.
	int RandomNum[4]; // Array RandomNum is designed to store values ​​by comparing array RandNum and variable gumsa
	int YourNum[4] = { 0 }; // Array YourNum is receives 4 numbers entered by user

	int i = 0; // The variable i is initialized to 0. 
	string input; // User's input value 

	srand((unsigned int)time(NULL)); // A different seed value is generated each time.

	cout << "Random numbers" << endl;

	for (int k = 0; k < 10; k++) // Save RandNum from 0 to 9
	{
		RandNum[k] = k;
	}

	while (i < 4) //Expression that receives a random value from gumsa and compares it to RandNum and stores only the variable that fits in RandomNum
	{
		gumsa = rand() % 10;
		for (int j = 0; j < 10; j++)
		{
			if (gumsa == RandNum[j])
			{
				RandomNum[i] = RandNum[j];
				RandNum[j] = 10; // Once stored value is initialized to 10 to prevent the same as variable gumsa
				i++;
				break; // When it is done, it will escape the loop.
			}
		}
	}

	while (turn < 10) // Because it has to be input 10 times, it repeats 10 times
	{
		cout << "Your number: ";
		cin >> input;

		while (input.length() != 4) // The length of the user's input value may not be 4, so process it.
		{
			cout << "[Error] 자릿수 오류 !" << endl;
			cout << "Your number: ";
			cin >> input;
		}

		for (int j = 0; j < input.length(); j++) // Since it is a string type, the ASCII code of 0 is subtracted.
		{
			YourNum[j] = input[j] - 48;
		}

		Hit = 0; // Reset Hitand Blow values ​​to 0.
		Blow = 0;

		for (int i = 0; i < 4; i++) // If the values ​​of RandomNumand YourNum are the same as the number of digits, add Hit.If the value is the same, but the number of digits is wrong, add Blow.
		{
			for (int time = 0; time < 4; time++)
			{
				if (RandomNum[time] == YourNum[time])
				{
					Hit++;
				}
				else if (RandomNum[i] == YourNum[time])
				{
					Blow++;
				}
			}
		}

		Hit = Hit / 4; // Hit is assigned to Hit / 4 because the upper loop is repeated 4 more times.

		cout << ">> HIT: " << Hit << ", BLOW: " << Blow << endl;
		if (Hit == 4) // If the hit is 4, the conditional statement that the user wins
		{
			cout << "Win";
			break;
		}
		turn++; // Since one turn has passed, it adds 1 to the turn.
	}

	if (turn == 10) // If the turn is 10, the conditional statement that the user loses
	{
		cout << "Lose";
	}

	return 0; // Normal program termination
}