#include <iostream> // Input-Output Stream Header File Definition

using namespace std;

int main(void)
{
	char arr[3][3] = { "" };// Define a character type 3by3 2 dimentional array and initialize it with a blank.
	int	location[2]; // Array location means player's input location.
	int turn = 1; // The variable turn is initialize to 1. because When turn is not 1, cause another execution expression to be executed. 
	int count = 0; // The variable count is initialize to 0. because It indicates the player's turn.

	while (1)
	{
		if (turn == 1) // turn檜 1檜賊 Infinite loop
		{
			turn++; // If turn is 1, then player 1's turn. and If turn is 2, then player 2's turn 

			cout << " X  0  1  2" << endl; // Print Array table 
			cout << "Y" << " 式式式式式式式式式" << endl;
			for (int column = 0; column < 3; column++)
			{
				cout << column << " 弛";
				for (int row = 0; row < 3; row++)
				{
					cout << " " << arr[column][row] << "弛";
				}
				cout << endl << " " << " 式式式式式式式式式" << endl;;
			}

			cout << "[Play 1] Enter your location [x y]: ";
			cin >> location[0] >> location[1];
			cout << endl;

			while (1)
			{
				if ((location[0] > 2 || location[0] < 0) && (location[1] > 2 || location[1] < 0)) // location[1], location[0] values are both over than 2 or under than 0
				{
					cout << "[Error] Out of Range" << endl;
					cout << "[Play 1] Enter your location [x y]: ";
					cin >> location[0] >> location[1];
					cout << endl;
				}
				else if (location[0] > 2 || location[0] < 0) // location[0] values are over than 2 or under than 0
				{
					cout << "[Error] Out of Range" << endl;
					cout << "[Play 1] Enter your location [x y]: ";
					cin >> location[0] >> location[1];
					cout << endl;
				}
				else if (location[1] > 2 || location[1] < 0) // location[1] values are over than 2 or under than 0
				{
					cout << "[Error] Out of Range" << endl;
					cout << "[Play 1] Enter your location [x y]: ";
					cin >> location[0] >> location[1];
					cout << endl;
				}
				else // escape the infinite loop
				{
					break;
				}
			}

			cout << endl;

			if (arr[location[1]][location[0]] == '\0') // If arr[location[1]][location[0]] is blank  
			{
				count++;
				arr[location[1]][location[0]] = 'O'; // Assigns x to arr[location[1]][location[0]] 
			}
			else if ((arr[location[1]][location[0]] == 'O') || arr[location[1]][location[0]] == 'X') // If arr[location[1]][location[0]] is not blank  
			{
				cout << endl;
				cout << "[Error] Since it is duplicated, please input it again." << endl; // Print Error message and Write again.
				cout << endl;
				turn = 1;
			}

			if (count == 9) // if count is 9 then, turn is 3
			{
				turn = 3;
			}
			for (int line = 0; line < 3; line++) // player 1 is win when x is either diagonal or straight
			{
				if ((arr[0][line] == 'O') && (arr[1][line] == 'O') && (arr[2][line] == 'O'))
				{
					turn = 0;
					break;
				}
				else if ((arr[line][0] == 'O') && (arr[line][1] == 'O') && (arr[line][2] == 'O'))
				{
					turn = 0;
					break;
				}
				else if ((arr[0][0] == 'O') && (arr[1][1] == 'O') && (arr[2][2] == 'O'))
				{
					turn = 0;
					break;
				}
				else if ((arr[2][0] == 'O') && (arr[1][1] == 'O') && (arr[0][2] == 'O'))
				{
					turn = 0;
					break;
				}
			}

			if (turn == 0) // If turn is 0, print "winner is [player 1]" and "arr".
			{
				cout << " X  0  1  2" << endl;
				cout << "Y" << " 式式式式式式式式式" << endl;
				for (int column = 0; column < 3; column++)
				{
					cout << column << " 弛";
					for (int row = 0; row < 3; row++)
					{
						cout << " " << arr[column][row] << "弛";
					}
					cout << endl << " " << " 式式式式式式式式式" << endl;;
				}
				cout << "Winner is [Player 1]" << endl;
				break;
			}

			else if (turn == 3) // If turn is 3, print "arr" and "Draw".
			{
				cout << " X  0  1  2" << endl;
				cout << "Y" << " 式式式式式式式式式" << endl;
				for (int column = 0; column < 3; column++)
				{
					cout << column << " 弛";
					for (int row = 0; row < 3; row++)
					{
						cout << " " << arr[column][row] << "弛";
					}
					cout << endl << " " << " 式式式式式式式式式" << endl;;
				}
				cout << "Draw" << endl;
				break;
			}
		}

		else
		{
			turn--; // If turn is 1, then player 1's turn. and If turn is 2, then player 2's turn 

			cout << " X  0  1  2" << endl; // Print Array table 
			cout << "Y" << " 式式式式式式式式式" << endl;
			for (int column = 0; column < 3; column++)
			{
				cout << column << " 弛";
				for (int row = 0; row < 3; row++)
				{
					cout << " " << arr[column][row] << "弛";
				}
				cout << endl << " " << " 式式式式式式式式式" << endl;;
			}

			cout << "[Play 2] Enter your location [x y]: ";
			cin >> location[0] >> location[1];
			cout << endl;

			while (1)
			{
				if ((location[0] > 2 || location[0] < 0) && (location[1] > 2 || location[1] < 0)) // location[1], location[0] values are both over than 2 or under than 0
				{
					cout << "[Error] Out of Range" << endl;
					cout << "[Play 2] Enter your location [x y]: ";
					cin >> location[0] >> location[1];
					cout << endl;
				}
				else if (location[0] > 2 || location[0] < 0) // location[0] values are over than 2 or under than 0
				{
					cout << "[Error] Out of Range" << endl;
					cout << "[Play 2] Enter your location [x y]: ";
					cin >> location[0] >> location[1];
					cout << endl;
				}
				else if (location[1] > 2 || location[1] < 0) // location[1] values are over than 2 or under than 0
				{
					cout << "[Error] Out of Range" << endl;
					cout << "[Play 2] Enter your location [x y]: ";
					cin >> location[0] >> location[1];
					cout << endl;
				}
				else // escape the infinite loop
				{
					break;
				}
			}

			cout << endl;

			if (arr[location[1]][location[0]] == '\0') // If arr[location[1]][location[0]] is blank  
			{
				count++;
				arr[location[1]][location[0]] = 'X'; // Assigns x to arr[location[1]][location[0]] 
			}
			else if ((arr[location[1]][location[0]] == 'O') || arr[location[1]][location[0]] == 'X') // If arr[location[1]][location[0]] is not blank
			{
				cout << endl;
				cout << "[ERROR] Since it is duplicated, please input it again." << endl; // Print Error message and Write again
				cout << endl;
				turn = 2;
			}

			if (count == 9) // if count is 9 then, turn is 3
			{
				turn = 3;
			}

			for (int line = 0; line < 3; line++) // player 2 is win when x is either diagonal or straight
			{
				if ((arr[0][line] == 'X') && (arr[1][line] == 'X') && (arr[2][line] == 'X'))
				{
					turn = 0;
					break;
				}
				else if ((arr[line][0] == 'X') && (arr[line][1] == 'X') && (arr[line][2] == 'X'))
				{
					turn = 0;
					break;
				}
				else if ((arr[0][0] == 'X') && (arr[1][1] == 'X') && (arr[2][2] == 'X'))
				{
					turn = 0;
					break;
				}
				else if ((arr[2][0] == 'X') && (arr[1][1] == 'X') && (arr[0][2] == 'X'))
				{
					turn = 0;
					break;
				}
			}

			if (turn == 0) // If turn is 0, print "winner is [player 2]" and "arr".
			{
				cout << " X  0  1  2" << endl;
				cout << "Y" << " 式式式式式式式式式" << endl;
				for (int column = 0; column < 3; column++)
				{
					cout << column << " 弛";
					for (int row = 0; row < 3; row++)
					{
						cout << " " << arr[column][row] << "弛";
					}
					cout << endl << " " << " 式式式式式式式式式" << endl;;
				}
				cout << "Winner is [Player 2]" << endl;
				break;
			}

			else if (turn == 3) // If turn is 3, print "draw" and "arr".
			{
				cout << " X  0  1  2" << endl;
				cout << "Y" << " 式式式式式式式式式" << endl;
				for (int column = 0; column < 3; column++)
				{
					cout << column << " 弛";
					for (int row = 0; row < 3; row++)
					{
						cout << " " << arr[column][row] << "弛";
					}
					cout << endl << " " << " 式式式式式式式式式" << endl;;
				}
				cout << "Draw" << endl;
				break;
			}
		}
	}
	return 0; // Normal program termination
}
