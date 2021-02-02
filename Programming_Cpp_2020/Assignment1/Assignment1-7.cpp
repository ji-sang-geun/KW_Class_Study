#include <iostream> // Input-Output Stream Header File Definition
#include <cmath> // cmath Header File Definition

using namespace std;

int main(void)
{
	int p[3][2]; // 2D Array p is An array that receives the coordinates of p1, p2, and p3.
	int sign = 0; // sign is initialized to 0.

	for (int i = 0; i < 3; i++) //write p(1,2,3)'s location
	{
		cout << "P" << i + 1 << ": ";
		for (int j = 0; j < 2; j++)
		{
			cin >> p[i][j];
		}
	}

	if (((p[1][0] - p[0][0]) * (p[2][1] - p[0][1])) - ((p[1][1] - p[0][1]) * (p[2][0] - p[0][0])) < 0) // u1*v2 - u2*v1 is under than 0. that is clockwise. (z is same location)
	{
		sign = 2;
	}
	else if (((p[1][0] - p[0][0]) * (p[2][1] - p[0][1])) - ((p[1][1] - p[0][1]) * (p[2][0] - p[0][0])) > 0) // u1*v2 - u2*v1 is over than 0. that is counter - clockwise. (z is same location)
	{
		sign = 3;
	}
	else if (((p[1][0] - p[0][0]) * (p[2][1] - p[0][1])) - ((p[1][1] - p[0][1]) * (p[2][0] - p[0][0])) == 0) // u1*v2 - u2*v1 is equal to 0. that is straight. (z is same location)
	{
		sign = 1;
	}

	if (sign == 1)
	{
		cout << "Straight" << endl;
	}
	else if (sign == 2)
	{
		cout << "Clockwise" << endl;
	}
	else if (sign == 3)
	{
		cout << "Counter-Clockwise" << endl;
	}

	return 0; // Normal program termination
}