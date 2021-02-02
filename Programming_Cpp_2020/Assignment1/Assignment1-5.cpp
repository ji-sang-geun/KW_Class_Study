#include <iostream> // Input-Output Stream Header File Definition
#include <cstdlib> // Define a header file that collects C standard utility functions 
#include <ctime> // Time related header file definition

using namespace std;

int main(void)
{
	int row, column; // Define row and column
	int gumsa;
	int number = 0; // The variable number refers to a variable that fills the array "size" from 0 to(row * column) - 1.
	int arr[101][101]; // Define 2 dimentional array "arr"

	srand((unsigned int)time(NULL));

	cout << "Enter the row: ";
	cin >> row;
	cout << "Enter the column: ";
	cin >> column;

	while (row < 1 || row > 100 || column < 1 || column > 100) // Exception processing when the range of the row is less than 1 or more than 100 or the range of the column is less than 1 or more than 100
	{
		if ((row < 1 || row > 100) && (column < 1 || column > 100)) // Both rows and columns are out of range
		{
			cout << "[Error]Plz Write row and column Again" << endl;
			cout << "Enter the row: ";
			cin >> row;
			cout << "Enter the column: ";
			cin >> column;
		}
		else if (row < 1 || row > 100) // The case that row is out of range
		{
			cout << "[Error]Plz Write row Again" << endl;
			cout << "Enter the row: ";
			cin >> row;
		}
		else if (column < 1 || column > 100) // The case that column is out of range
		{
			cout << "[Error]Plz Write column Again" << endl;
			cout << "Enter the column: ";
			cin >> column;
		}
	}

	int* size = new int[row * column]; // Define Dynamic Memory Allocation 2 dimentional array "size"

	for (int num = 0; num < (row * column); num++)
	{
		size[num] = number++; // Array "size" is 0 to (row * column)-1
	}

	int a = 0;
	int b = 0;

	while (a < column) // Randomly insert numbers from 0 to n - 1 into an array.
	{
		while (b < row)
		{
			gumsa = rand() % (row * column); // gumsa takes a random value. This is because gumsa will be compared to the value in the array "size" and put in the array "arr". 

			for (int num = 0; num < (row * column); num++)
			{
				if (gumsa == size[num])
				{
					arr[a][b] = size[num];
					size[num] = row * column;

					b++;
					break;
				}
			}
		}
		b = 0;
		a++;
	}

	cout << "Origin Matrix >>>" << endl; // Print Origin Matrix 

	for (int a = 0; a < column; a++)
	{
		for (int b = 0; b < row; b++)
		{
			cout << arr[a][b] << "\t";
		}
		cout << endl;
	}

	cout << endl;

	cout << "Transpose Matrix >>>" << endl; // Print Transpose Matrix and the Transpose matrix reverses the order of aand b because the matrix of origin is the same as that of each other.

	for (int a = 0; a < row; a++)
	{
		for (int b = 0; b < column; b++)
		{
			cout << arr[b][a] << "\t";
		}
		cout << endl;
	}

	delete[]size; // Define Dynamic Memory Deallocation 2 dimentional array "size"

	return 0; // Normal program termination
}

