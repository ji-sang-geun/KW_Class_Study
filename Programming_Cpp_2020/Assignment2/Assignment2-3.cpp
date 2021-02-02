#include <iostream> // Input / output standard header file definition

using namespace std;

int main(void) // define main function
{
	int x, y; // x, y means input x, y.
	int count = 1; // Initialize count to 1 to prevent trash values ​​being assigned.(And, because the input value is from 1 to x * y.)
	int startx, starty; // Since we decided that it should be made like a rectangle, we define the coordinates of the vertices.
	int endx, endy;

	cout << "Please input 2D array size: "; // Enter the input value
	cin >> y;
	cin >> x;

	while (x > 10 || y > 10 || x < 1 || y < 1) // If x or y is greater than 10 or less than 1, it is re - entered.
	{
		system("cls");
		cout << "Please input 2D array size: ";
		cin >> y;
		cin >> x;
	}

	int** arr = new int* [y]; // Dynamic allocation is performed with the input xand y values.
	for (int i = 0; i < y; i++)
	{
		arr[i] = new int[x];
	}

	startx = 0;// Preliminary work to create a rectangular border
	starty = 1;

	endx = x - 1;
	endy = y - 1;

	while (1) // This is a process of making a rectangle, so that it ends when the value of count becomes x * y.
	{
		for (int a = startx; a < endx + 1; a++)// work to make one side of the rectangle
		{
			arr[starty - 1][a] = count;
			count++;
		}
		if (count > x * y)
		{
			break;
		}

		for (int b = starty; b < endy; b++) // work to make one side of the rectangle
		{
			arr[b][endx] = count;
			count++;
		}
		if (count > x * y)
		{
			break;
		}

		for (int a = endx; a >= startx; a--) // work to make one side of the rectangle
		{
			arr[endy][a] = count;
			count++;
		}
		if (count > x * y)
		{
			break;
		}

		for (int b = endy - 1; b >= starty; b--) // work to make one side of the rectangle
		{
			arr[b][startx] = count;
			count++;
		}
		if (count > x * y)
		{
			break;
		}

		startx++;
		starty++;
		endx--;
		endy--;
	}

	for (int b = 0; b < y; b++)// Loop to print the saved value
	{
		for (int a = 0; a < x; a++)
		{
			if (arr[b][a] > 0 && arr[b][a] < 10)
			{
				cout << "  " << arr[b][a] << " ";
			}
			else if (arr[b][a] >= 10)
			{
				cout << " " << arr[b][a] << " ";
			}
		}
		cout << endl;
	}

	for (int i = 0; i < y; i++) // Free the dynamically allocated array arr.
	{
		delete[] arr[i];
	}
	delete[] arr;

	return 0; // End of program
}