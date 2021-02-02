#include <iostream> // Input / output standard header file definition

using namespace std;

class PatientInfo // Define class PatientInfo.
{
private: // Put name, address, unique number, and cell phone number in private members
	char* name;
	char* address;
	int registration_number;
	int phone_number;

public:
	PatientInfo(char* name, char* address, int registration_number, int phone_number); // Constructor with arguments
	~PatientInfo();

	char* getName();
	char* getAddress();
	int get_R_Number();
	int get_P_Number();
};

PatientInfo::PatientInfo(char* name, char* address, int registration_number, int phone_number) // Constructor with arguments
{
	// Use this function to access private members
	this->name = name;
	this->address = address;
	this->registration_number = registration_number;
	this->phone_number = phone_number;
}

PatientInfo::~PatientInfo()
{

}

char* PatientInfo::getName() // Member function of patientinfo class with return type char* getName()
{
	return name;
}
char* PatientInfo::getAddress() // Member function of patientinfo class with return type char* getAddress()
{
	return address;
}
int PatientInfo::get_R_Number() // Member function of patientinfo class with return type int get_R_Number()
{
	return registration_number;
}
int PatientInfo::get_P_Number() // Member function of patientinfo class with return type int get_P_Number()
{
	return phone_number;
}

int main(void)
{
	char name[2][30];
	char address[2][50];
	int registration_number[2];
	int phone_number[2];

	char gumsa[2][50]; // The gumsa array is used to prevent the registration_number or phone_number from entering characters other than numbers.

	for (int i = 0; i < 2; i++) //testcase = 2
	{
		cout << "Name: ";
		cin >> name[i]; //input name
		cout << "Address: ";
		cin >> address[i]; // input address
		cout << "Resgistration Number: ";
		cin >> gumsa[i]; // Prepare to receive input again in case-appears
		for (int j = 0; gumsa[i][j] != NULL; j++)
		{
			while (gumsa[i][j] < 48 || gumsa[i][j] > 57) // If a non - numeric value appears, the value is entered again
			{
				cout << "Resgistration Number Again: ";
				cin >> gumsa[i];
				j = 0;
			}
		}
		registration_number[i] = atoi(gumsa[i]); // If passed, convert to integer

		cout << "Phone Number: ";
		cin >> gumsa[i];

		for (int j = 0; gumsa[i][j] != NULL; j++)
		{
			while (gumsa[i][j] < 48 || gumsa[i][j] > 57) // If a non - numeric value appears, the value is entered again
			{
				cout << "Phone Number Again: ";
				cin >> gumsa[i];
				j = 0;
			}
		}
		phone_number[i] = atoi(gumsa[i]); // If passed, convert to integer

		cout << endl;
	}

	for (int i = 0; i < 2; i++)
	{
		PatientInfo Info(name[i], address[i], registration_number[i], phone_number[i]);
		cout << Info.getName() << endl; // name[i] is returned as getname()
		cout << Info.getAddress() << endl; // adress [i] returns as getaddress()
		cout << Info.get_R_Number() << endl; // registration_number[i] is returned by get_R_Number()
		cout << Info.get_P_Number() << endl; // phone_number[i] returns with get_P_Number()
		cout << endl;
	}

	return 0; // End of program
}