#include <iostream> // Input-Output Stream Header File Definition
#include <cmath> // cmath Header File Definition

using namespace std;

int main(void)
{
	int n; // The variable n means user input value
	int p = 2; // The variable p is initialize to 2 and It means integer 2 through n
	int c; // The variable c means multiple 
	int total = 0; // The variable total is initalize to 0. because to prevent garbage value from entering

	cout << "Enter the n: ";
	cin >> n;

	while (n < 0) // If n is less than 0, exception handling
	{
		cout << "[Error] Out of Range. Write Again" << endl;
		cout << "Enter the n: ";
		cin >> n;
	}

	int* arr = new int[n]; // Define Dynamic Memory Allocation 1 dimentional array arr 

	for (int i = 0; i < n; i++)
	{
		arr[i] = i + 1; // Takes values ​​from 1 to n
	}

	for (int p = 2; pow(p, 2) < n; p++) // The condition was created because the lattice of eratosthenes is established only when the square of p is less than n
	{
		for (int c = 2; p * c <= n; c++) // find the variable p's multiple but not over than n  
		{
			for (int i = 0; i < n; i++)
			{
				if (arr[i] == p * c)
				{
					arr[i] = 0; // Delete the value of array arr[i]
				}
			}
		}
	}

	cout << endl; // Move to the next line 

	for (int i = 0; i < n; i++) // A sentence listing prime numbers.
	{
		if (arr[i] > 1)
		{
			cout << arr[i] << " ";
		}
	}

	cout << endl << endl;

	cout << "The number of Prime numbers: ";
	for (int i = 0; i < n; i++) // A sentence counting prime numbers 
	{
		if (arr[i] > 1)
		{
			total++;
		}
	}
	cout << total;

	cout << endl;

	delete[] arr; // Define Dynamic Memory Deallocation 1 dimentional array arr

	return 0; // Normal program termination
}