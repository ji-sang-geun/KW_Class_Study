#include <iostream> // Input / output standard header file definition

using namespace std;

char* my_strstr(char* str, char* strSearch, char* strChange) // Define the function my_strstr.
{
	int turn = 0;
	int count = 0;
	int num = 0;
	int b, c;

	char result[100] = ""; // Array for outputting results

	for (b = 0; strSearch[b] != NULL; b++) // Check the length of strSearchand assign it to b
	{
		b = b;
	}
	b = b - 1;

	for (c = 0; strChange[c] != NULL; c++) // Check the length of strChange and assign it to c
	{
		c = c;
	}
	c = c - 1;

	for (int i = 0; str[i] != NULL; i++) // Statement repeated until str [i] becomes NULL
	{
		count = 0;

		if (str[i + 1] == NULL || (str[i + b] == strSearch[b] && str[i] == strSearch[0])) // A conditional statement created to break the case where str[i + 1] is NULL or strSearch[b] appears in str[i + b] and strSearch[0] appears in str[i].
		{
			for (int j = turn; j < i; j++)
			{
				if (strSearch[j - turn] == NULL) //If strSearch[j - turn] is null, the loop is stopped.
				{
					break;
				}
				if (str[j] != strSearch[j - turn]) // Compare str[j] and strSearch[j - turn], and if they are not equal, substitute count as 1 to prevent copying.
				{
					count = 1;
				}
			}

			if (count == 0) // If count is 0, the first str is substituted into the result, then strChange[j - turn] is substituted, and then the last remaining str part is substituted to complete the sentence.
			{
				for (int a = 0; a < turn; a++)
				{
					result[a] = str[a];
				}

				for (int j = turn; strChange[j - turn] != NULL; j++)
				{
					result[j] = strChange[j - turn];
					num = j + 1;
				}


				for (int k = num; str[k - (c - b)] != NULL; k++)
				{
					result[num] = str[k - (c - b)];
					num++;
				}
				break;
			}
			turn = i;
		}
	}

	for (int k = 0; result[k] != NULL; k++) // This is a loop to copyand send the result to str.
	{
		str[k] = result[k];
		num = k;
	}
	if (num != 0) // If num is 0, str is added to numand str[1] eventually has a NULL value.
	{
		num = num + 1;
	}
	str[num] = NULL;

	return str; // returns str
}

int main(void)
{
	char str[100];
	char strSearch[100];
	char strChange[100];
	char* solution; // Char pointer to copy the returned str

	cout << "원본 문자열을 입력하세요." << endl;
	gets_s(str); // input str 
	cout << endl;

	cout << "변경 전 문자열을 입력하세요." << endl;
	gets_s(strSearch); // input strSearch
	cout << endl;

	cout << "변경 후 문자열을 입력하세요." << endl;
	gets_s(strChange); // input strChange
	cout << endl;

	cout << "변경 된 결과는 다음과 같습니다." << endl;
	cout << endl;

	solution = my_strstr(str, strSearch, strChange); // Execute the defined function my_strstr.

	if (solution[0] == NULL) // If solution[0], that is, the first argument of solution is NULL, an error message is displayed.
	{
		cout << "일치하는 문자열이 없습니다.";
	}
	else
	{
		cout << "변경된 문자열:" << endl;
		cout << solution; // Print the changed string.
	}

	return 0; // End of Program
}