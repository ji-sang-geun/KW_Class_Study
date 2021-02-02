#include <iostream> // Input / output standard header file definition

using namespace std;

int main(void) // Define Main function
{
	int two_d_array[2][3] = { {1, 2, 3}, {4, 5, 6} }; // It inserts a value into the arr arrayand initializes it.
	int* a, * b, * c, * d, * e, * f;// Declare pointers initialized in arrays such as 1,2,3
	int** h, ** i, ** j;

	a = &two_d_array[0][0]; // value of a
	b = &two_d_array[1][0]; // value of b
	c = &two_d_array[0][1]; // value of c
	d = &two_d_array[0][2]; // value of d

	e = two_d_array[0]; // e is the first line of arr
	f = two_d_array[1]; // f is the last line of arr(second)

	int(*g)[3] = two_d_array; // *g

	i = &a; // i means the address value of a
	h = &a; // h means the address value of a
	j = &c; // j means the address value of c

	cout << "First Condition" << endl; // First Condition print
	cout << "a: " << *a << endl;
	cout << "b: " << *b << endl;
	cout << "c: " << *c << endl;
	cout << "d: " << *d << endl;
	cout << "h: " << **h << endl;
	cout << "i: " << **i << endl;
	cout << "j: " << **j << endl;
	cout << endl;

	cout << "Second Condition" << endl; // Second condition pront 
	cout << "1-a: " << a << endl;
	cout << "1-h: " << *h << endl;
	cout << "1-i: " << *i << endl;
	cout << "2-c: " << c << endl;
	cout << "2-j: " << *j << endl;
	cout << "3-d: " << d << endl;
	cout << "4-b: " << b << endl;
	cout << "5-?: " << (b + 1) << endl; // Since b was replaced with arr[1][0], (b + 1) represents the address value of 5 in array[1][1] in pointer notation.
	cout << "6-?: " << (b + 2) << endl;
	cout << endl;

	cout << "Third Condition" << endl; // Third Condition print
	cout << "e: ";
	for (int i = 0; i < 3; i++)
	{
		cout << *(e + i) << " ";
	}
	cout << endl;

	cout << "f: ";
	for (int i = 0; i < 3; i++)
	{
		cout << *(f + i) << " ";
	}
	cout << endl;

	cout << "g: ";
	for (int i = 0; i < 2; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			cout << *(*(g + i) + j) << " ";
		}
	}
	cout << endl;

	return 0; // End of program
}
