#include <iostream> // Input / output standard header file definition
#include <fstream> // Header file responsible for file input / output
#include <string> // Header file in charge of string
#include <ctime> // Header file in charge of time

using namespace std;

int main(void)
{
	ifstream LoadFile; // Received File information is defined as LoadFile
	ofstream WriteFile; // Transferring information to File is defined as WriteFile
	LoadFile.open("source.txt"); // Open the source.txt file
	WriteFile.open("result.txt"); // Open the result.txt file

	string str; // String type str Definition str is used to load from the source.txt file.
	string input; // input is the input value that I inputand is used to compare str.

	//Reset to zero as it may contain garbage
	double percent = 0;
	double speed = 0;

	int count = 0;

	WriteFile << "KW Typing Verification Program" << endl; // Input in result.txt file

	if (LoadFile.is_open()) // Based on when Load.source.txt file is open.
	{
		while (!LoadFile.eof())
		{
			cout << "KW Typing Verification Program" << endl;
			cout << "정확도 : " << percent << "\t"; // 	Accuracy output
			cout << "속도(타자/s) : " << speed << "\t"; // Speed ​​output
			cout << endl << endl;

			WriteFile << "정확도 : " << percent << "\t"; // Accuracy input to result file
			WriteFile << "속도(타자/s) : " << speed << "\t"; // Enter speed result file
			WriteFile << endl << endl;

			getline(LoadFile, str); // LoadFile history assignment to str
			cout << "문장 : " << str << endl;
			cout << "입력 : ";
			clock_t start = clock(); // time start
			getline(cin, input); // Assign cin value to input
			clock_t end = clock(); // time end

			count = 0;

			if (input.length() <= str.length()) // If input.length() is less than or equal to str.length()
			{
				if (str == input) // If strand input are the same, accuracy is 100, so you only need to output speed.
				{
					percent = ((double)input.length() / input.length()) * 100;
					speed = (double)input.length() / ((end - start) / CLOCKS_PER_SEC);
				}

				else // If they are not the same, find only the same part to find the accuracy.
				{
					for (int i = 0; i < input.length(); i++)
					{
						if (str[i] == input[i])
						{
							count++;
						}
					}
					percent = ((double)count / input.length()) * 100;
					speed = (double)input.length() / ((end - start) / CLOCKS_PER_SEC);
				}
			}

			else // If input.length() is greater than str.length()
			{
				for (int i = 0; i < input.length(); i++)
				{
					if (str[i] == input[i]) // Find the same str valueand input valueand divide it with input.length().
					{
						count++;
					}
					else
					{
						break;
					}
				}
				percent = ((double)count / input.length()) * 100;
				speed = (double)input.length() / ((end - start) / CLOCKS_PER_SEC);
			}

			speed = round(speed * 10) / 10; // Since it is said to print to the first decimal place, it is rounded up from the second using the round function.
			WriteFile << input << endl;

			cout << system("cls"); // Screen initialization via system ("cls")
		}
	}
	LoadFile.close(); // Close LoadFile

	cout << "KW Typing Verification Program" << endl;
	cout << "정확도 : " << percent << "\t"; // Print out accuracy and speed.
	cout << "속도(타자/s) : " << speed << "\t";
	cout << endl;

	WriteFile << "정확도 : " << percent << "\t"; // Put accuracyand speed into a file.
	WriteFile << "속도(타자/s) : " << speed << "\t";
	WriteFile << endl << endl;
	WriteFile.close(); // Close WriteFile.

	return 0; // End of Program
}