#include <iostream>
#include <string>
#include <cstring>
#include <cctype>
#include <algorithm>

using namespace std;

class Node {
public:
    string lecture;
    string professor;
    int grade;
    int position;

    Node* next;
    Node* prev;

};

class Lecture_List {
private:
    Node* Head = NULL;
    Node* Tail = NULL;
    int Index;
public:
    Lecture_List();
    ~Lecture_List();

    void First_Insert(string lecture, string professor, int grade)
        // first input function
    {
        Node* newNode = new Node;
        // declaration with node variable
        newNode->lecture = lecture;
        newNode->professor = professor;
        newNode->grade = grade;
        newNode->position = 1;

        if (Head == NULL) // For the first input
        {
            Head = newNode;
            Tail = newNode;
            Tail->next = NULL;
            Head->prev = NULL;
        }
        else if (Head != NULL)
            // If not the first time
        {
            Node* temp = Head;
            
            while (temp != NULL)
            {
                if (temp->lecture.compare(lecture) == 0)
                {
                    cout << "Duplicate Lectures" << endl;
                    cout << "----------------------------------------------------" << endl;
                    return;
                }
                temp->position++;
                temp = temp->next;
            }
       
            Head->prev = newNode;
            newNode->next = Head;
            Head = newNode;
            newNode->prev = NULL;
        }
        Index++;
    }

    void Last_Insert(string lecture, string professor, int grade)
        // last input function
    {
        Node* newNode = new Node;
        newNode->lecture = lecture;
        newNode->professor = professor;
        newNode->grade = grade;
        newNode->position = Index + 1;

        if (Tail == NULL)
            //If tail is null in the last position
        {
            Head = newNode;
            Tail = newNode;
            Tail->next = NULL;
            Head->prev = NULL;
        }
        else
            //If tail is not null in the last position
        {
            Node* temp = Tail;
            Node* temp_head = Head;

            while (temp_head->next != NULL)
            {
                if (temp_head->lecture.compare(lecture) == 0)
                {
                    cout << "Duplicate Lectures" << endl;
                    cout << "----------------------------------------------------" << endl;
                    return;
                }
                temp_head = temp_head->next;
            }
            if (temp->lecture.compare(lecture) == 0)
            {
                cout << "Duplicate Lectures" << endl;
                cout << "----------------------------------------------------" << endl;
                return;
            }

            Tail->next = newNode;
            newNode->prev = Tail;
            Tail = newNode;
            newNode->next = NULL;
        }
        Index++;
    }

    void Insert(int index, string lecture, string professor, int grade) // Function that inserts arguments at index
    {
        int change;
        Node* newNode = new Node;
        newNode->lecture = lecture;
        newNode->professor = professor;
        newNode->grade = grade;
        newNode->position = Index;

        if (Tail != NULL && Head != NULL)
        {
            Node* temp = Head;
            Node* temp_next = Head->next;

            if (index > Index)
            {
                cout << "Out of Number Index" << endl; // 
                cout << "----------------------------------------------------" << endl;
                do
                {
                    cout << "<insert lecture at position>" << endl;
                    cout << "Enter the position of lecture insert : ";
                    cin >> index;
                    cout << "Enter the lecture name : ";
                    cin.ignore();
                    getline(cin, lecture);
                    cout << "Enter the lecture professor : ";
                    getline(cin, professor);
                    cout << "Enter the lecture grade : ";
                    cin >> grade;

                    transform(lecture.begin(), lecture.end(), lecture.begin(), toupper);
                    transform(professor.begin(), professor.end(), professor.begin(), toupper);
                    Insert(index, lecture, professor, grade);

                } while (index > Index);

                return;
            }

            if (Head->lecture.compare(lecture) == 0)
            {
                cout << "Duplicate Lectures" << endl;
                cout << "----------------------------------------------------" << endl;
                return;
            }

            else if (Tail->lecture.compare(lecture) == 0)
            {
                {
                    cout << "Duplicate Lectures" << endl;
                    cout << "----------------------------------------------------" << endl;
                    return;
                }
            }

            for (int i = 1; i < index - 1; i++)
            {
 
                temp = temp->next;
                if (temp->lecture.compare(lecture) == 0)
                {
                    cout << "Duplicate Lectures" << endl;
                    cout << "----------------------------------------------------" << endl;
                    return;
                }
            }
            temp_next = temp->next;

            temp_next->prev = newNode;
            newNode->next = temp_next;
            temp->next = newNode;
            newNode->prev = temp;

            while (newNode->position > newNode->next->position)
            {
                change = newNode->position;
                newNode->position = newNode->next->position;
                newNode->next->position = change;
                newNode = newNode->next;
            }
            Tail->position = Index + 1;
        }
        else
        {
            cout << "Out of Number Index" << endl;
            cout << "----------------------------------------------------" << endl;
            do
            {
                cout << "<insert lecture at position>" << endl;
                cout << "Enter the position of lecture insert : ";
                cin >> index;
                cout << "Enter the lecture name : ";
                cin.ignore();
                getline(cin, lecture);
                cout << "Enter the lecture professor : ";
                //cin.ignore();
                getline(cin, professor);
                cout << "Enter the lecture grade : ";
                cin >> grade;

                transform(lecture.begin(), lecture.end(), lecture.begin(), toupper);
                transform(professor.begin(), professor.end(), professor.begin(), toupper);
                Insert(index, lecture, professor, grade);
            } while (index > Index);
            return;
        }
        Index++;
    }

    void Delete(string lecture)
        // Function responsible for deletion
    {
        Node* remove = Head;
        Node* temp;

        if (remove == NULL)
        {
            cout << "No information to Delete" << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }

        while (remove->lecture != lecture)
        {
            remove = remove->next;

            if (remove == NULL)
            {
                cout << "No information to Delete" << endl;
                cout << "----------------------------------------------------" << endl;
                return;
            }
        }

        if (remove == Head)
        {
            if (remove->next == NULL)
            {
                Head = remove->next;

                cout << "**" << remove->lecture << " has been delated from position" << remove->position << "**" << endl;
                cout << "----------------------------------------------------" << endl;
                Index--;
                delete remove;

                return;
            }

            remove->next->prev = NULL; // If the next to be removed has a non - NULL value
            Head = remove->next;

            temp = Head;
            while (temp != NULL)
            {
                temp->position--;
                temp = temp->next;
            }

            cout << "**" << remove->lecture << " has been delated from position" << remove->position << "**" << endl;
            cout << "----------------------------------------------------" << endl;
            Index--;

            delete remove;
            return;
        }
        else
        {

            if (remove->next == NULL)
            {
                remove->prev->next = NULL;
                Tail = remove->prev;
                //Tail->position--;

                cout << "**" << remove->lecture << " has been delated from position" << remove->position << "**" << endl;
                cout << "----------------------------------------------------" << endl;
                Index--;

                delete remove;
                return;
            }
            else
            {
                remove->prev->next = remove->next;
                remove->next->prev = remove->prev;

                temp = remove->prev->next;

                while (temp != NULL)
                {
                    temp->position--;
                    temp = temp->next;
                }

                cout << "**" << remove->lecture << " has been delated from position" << remove->position << "**" << endl;
                cout << "----------------------------------------------------" << endl;

                Index--;

                delete remove;
                return;
            }
        }
    }

    void Update(string lecture) //Function responsible for update
    {
        Node* update = Head;

        if (update == NULL)
        {
            cout << "No information to Update" << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }

        while (update->lecture != lecture)
        {
            update = update->next;

            if (update == NULL)
            {
                cout << "No information to Update" << endl;
                cout << "----------------------------------------------------" << endl;
                return;
            }
        }

        if (update->lecture == lecture)
        {
            cout << "->Enter the new lecture name : ";
            getline(cin, update->lecture);
            cout << "->Enter the new lecture professor : ";
            getline(cin, update->professor);
            cout << "->Enter the new lecture grade : ";
            cin >> update->grade;
        }
    }

    void Search_lecture(string lecture) //Function responsible for search lecture
    {
        Node* search_lecture = Head;
        int coin = 0;

        while (search_lecture != NULL)
        {
            if (search_lecture->lecture != lecture)
            {
                search_lecture = search_lecture->next;
            }

            else if (search_lecture->lecture == lecture)
            {
                cout << "*At position" << search_lecture->position << "*" << endl;
                cout << "lecture name : ";
                cout << search_lecture->lecture << endl;
                cout << "lecture professor : ";
                cout << search_lecture->professor << endl;
                cout << "lecture grade : ";
                cout << search_lecture->grade << endl;

                search_lecture = search_lecture->next;
                coin++;
            }
        }
        if (search_lecture == NULL && coin == 0)
        {
            cout << "No information to Search" << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }
        return;
    }

    void Search_professor(string professor)// Function responsible for search professor
    {
        Node* search_professor = Head;
        int coin = 0;

        while (search_professor != NULL)
        {
            if (search_professor->professor != professor)
            {
                search_professor = search_professor->next;
            }

            else if (search_professor->professor == professor)
            {
                cout << "*At position" << search_professor->position << "*" << endl;
                cout << "lecture name : ";
                cout << search_professor->lecture << endl;
                cout << "lecture professor : ";
                cout << search_professor->professor << endl;
                cout << "lecture grade : ";
                cout << search_professor->grade << endl;

                search_professor = search_professor->next;
                coin++;
            }
        }
        if (search_professor == NULL && coin == 0)
        {
            cout << "No information to Search" << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }
        return;
    }

    void Search_grade(int grade) //Function responsible for search grade
    {
        Node* search_grade = Head;
        int coin = 0;

        while (search_grade != NULL)
        {
            if (search_grade->grade != grade)
            {
                search_grade = search_grade->next;
            }

            else if (search_grade->grade == grade)
            {
                cout << "*At position" << search_grade->position << "*" << endl;
                cout << "lecture name : ";
                cout << search_grade->lecture << endl;
                cout << "lecture professor : ";
                cout << search_grade->professor << endl;
                cout << "lecture grade : ";
                cout << search_grade->grade << endl;

                search_grade = search_grade->next;
                coin++;
            }
        }
        if (search_grade == NULL && coin == 0)
        {
            cout << "No information to Search" << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }
        return;
    }

    void Ascending() { //Function responsible for Asceding // reference : https://www.crocus.co.kr/342

        Node* ascending = Head;

        if (ascending == NULL)
        {
            cout << "No information to Ascending" << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }

        Node* ascending_next = Head->next;
        string lec_temp;
        string pro_temp;
        int grade_temp;

        cout << "<Sort by grade in ascending order>" << endl;
        while (ascending != NULL)
        {
            while (ascending_next != NULL)
            {
                if (ascending->grade > ascending_next->grade)
                {
                    grade_temp = ascending->grade;
                    ascending->grade = ascending_next->grade;
                    ascending_next->grade = grade_temp;

                    lec_temp = ascending->lecture;
                    ascending->lecture = ascending_next->lecture;
                    ascending_next->lecture = lec_temp;

                    pro_temp = ascending->professor;
                    ascending->professor = ascending_next->professor;
                    ascending_next->professor = pro_temp;
                }
                else if (ascending->grade == ascending_next->grade)
                {
                    if (ascending->lecture.compare(ascending_next->lecture) >= 0)
                    {
                        grade_temp = ascending->grade;
                        ascending->grade = ascending_next->grade;
                        ascending_next->grade = grade_temp;

                        lec_temp = ascending->lecture;
                        ascending->lecture = ascending_next->lecture;
                        ascending_next->lecture = lec_temp;

                        pro_temp = ascending->professor;
                        ascending->professor = ascending_next->professor;
                        ascending_next->professor = pro_temp;
                    }
                }
                ascending_next = ascending_next->next;
            }

            ascending = ascending->next;

            if (ascending != NULL)
            {
                ascending_next = ascending->next;
            }
        }
        cout << "----------------------------------------------------" << endl;
        return;
    }

    void Display()
    {
        Node* display = Head;

        if (display == NULL)
        {
            cout << "No information to Display" << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }

        cout << "<Display lecture list>" << endl;

        while (display != NULL)
        {
            cout << "----------------------------------------------------" << endl;
            cout << "lecture name : " << display->lecture << endl;
            cout << "lecture professor : " << display->professor << endl;
            cout << "lecture grade : " << display->grade << endl;
            cout << "----------------------------------------------------" << endl;
            display = display->next;
        }
    }

    void Reverse() //Function responsible for reverse // reference :  https://codeforwin.org/2015/11/c-program-to-reverse-doubly-linked-list.html
    {
        int change = 0;
        Node* reverse_Head = Head;
        Node* reverse_temp;

        if (Head == NULL)
        {
            cout << "Not exists lecture, professor, grade ! " << endl;
            cout << "----------------------------------------------------" << endl;
            return;
        }

        cout << "<Reverse lecture list>" << endl;
        cout << "**The product list has been reversed**" << endl;

        reverse_temp = NULL;

        while (reverse_Head != NULL)
        {
            reverse_temp = reverse_Head->prev;
            reverse_Head->prev = reverse_Head->next;
            reverse_Head->next = reverse_temp;
            reverse_Head = reverse_Head->prev;

        }

        Node* reverse_position = Head;
        Node* reverse_position_prev = Head->prev;

      
        while (reverse_position_prev != NULL)
        {
            while (reverse_position->prev != NULL)
            {
                if (reverse_position->position < reverse_position->prev->position)
                {
                    change = reverse_position->position;
                    reverse_position->position = reverse_position->prev->position;
                    //cout << reverse_position_tail->position << endl;
                    reverse_position->prev->position = change;
                    //cout << reverse_position->position <<  endl;
                    //reverse_position_tail = reverse_position_tail->prev;
                }
                reverse_position = reverse_position->prev;
            }
            reverse_position = Head;
            reverse_position_prev = reverse_position_prev->prev;
        }

        if (reverse_temp != NULL)
        {
            Head = reverse_temp->prev;
        }

        cout << "----------------------------------------------------" << endl;
        return;
    }
};

Lecture_List::Lecture_List()
{
    Index = 0;

}

Lecture_List::~Lecture_List()
{
}

int main(void)
{
    Lecture_List List;
    string lecture_name;
    string lecture_professor;
    int lecture_grade;
    int lecture_index;

    int number = 1;

    while (number <= 12 || number >= 1)
    {
        //system("cls");
        cout << "*************************************" << endl;
        cout << "S T A R T" << endl;
        cout << "*************************************" << endl;
        cout << "1. Insert lecture at beginning" << endl;
        cout << "2. Insert lecture at last" << endl;
        cout << "3. Insert lecture at position" << endl;
        cout << "4. Delete lecture" << endl;
        cout << "5. Update lecture" << endl;
        cout << "6. Search lecture" << endl;
        cout << "7. Search professor" << endl;
        cout << "8. Search grade" << endl;
        cout << "9. Sort by grade in ascennding order" << endl;
        cout << "10. Display lecture list" << endl;
        cout << "11. Reverse lecture list" << endl;
        cout << "12. Exit" << endl;
        cout << "Input Number : ";
        cin >> number;

        if (number == 1)
        {
            cout << "<insert lecture at beginning>" << endl;
            cout << "Enter the lecture name : ";
            cin.ignore();
            getline(cin, lecture_name);
            cout << "Enter the lecture professor : ";
            //cin.ignore();
            getline(cin, lecture_professor);
            cout << "Enter the lecture grade : ";
            cin >> lecture_grade;

            transform(lecture_name.begin(), lecture_name.end(), lecture_name.begin(), toupper);
            transform(lecture_professor.begin(), lecture_professor.end(), lecture_professor.begin(), toupper);
            List.First_Insert(lecture_name, lecture_professor, lecture_grade);
        }

        else if (number == 2)
        {
            cout << "<insert lecture at last>" << endl;
            cout << "Enter the lecture name : ";
            cin.ignore();
            getline(cin, lecture_name);
            cout << "Enter the lecture professor : ";
            //cin.ignore();
            getline(cin, lecture_professor);
            cout << "Enter the lecture grade : ";
            cin >> lecture_grade;

            transform(lecture_name.begin(), lecture_name.end(), lecture_name.begin(), toupper);
            transform(lecture_professor.begin(), lecture_professor.end(), lecture_professor.begin(), toupper);
            List.Last_Insert(lecture_name, lecture_professor, lecture_grade);
        }

        else if (number == 3)
        {
            cout << "<insert lecture at position>" << endl;
            cout << "Enter the position of lecture insert : ";
            cin >> lecture_index;
            cout << "Enter the lecture name : ";
            cin.ignore();
            getline(cin, lecture_name);
            cout << "Enter the lecture professor : ";
            //cin.ignore();
            getline(cin, lecture_professor);
            cout << "Enter the lecture grade : ";
            cin >> lecture_grade;

            while (lecture_index <= 0)
            {
                cout << "Out of Number Index" << endl;
                cout << "Enter the position of lecture insert over the 0 : ";
                cin >> lecture_index;
            }

            transform(lecture_name.begin(), lecture_name.end(), lecture_name.begin(), toupper);
            transform(lecture_professor.begin(), lecture_professor.end(), lecture_professor.begin(), toupper);
            List.Insert(lecture_index, lecture_name, lecture_professor, lecture_grade);
        }

        else if (number == 4)
        {
            cout << "<Delete lecture>" << endl;
            cout << "->Enter the lecture of lecture Delete : ";
            cin.ignore();
            getline(cin, lecture_name);

            transform(lecture_name.begin(), lecture_name.end(), lecture_name.begin(), toupper);
            List.Delete(lecture_name);
        }

        else if (number == 5)
        {
            cout << "<Update lecture>" << endl;
            cout << "->Enter the lecture name : ";
            cin.ignore();
            getline(cin, lecture_name);

            transform(lecture_name.begin(), lecture_name.end(), lecture_name.begin(), toupper);
            List.Update(lecture_name);
        }

        else if (number == 6)
        {
            cout << "<Search lecture>" << endl;
            cout << "->Enter the lecture name you want to search : ";
            cin.ignore();
            getline(cin, lecture_name);

            transform(lecture_name.begin(), lecture_name.end(), lecture_name.begin(), toupper);
            List.Search_lecture(lecture_name);
        }

        else if (number == 7)
        {
            cout << "<Search professor>" << endl;
            cout << "->Enter the professor name you want to search : ";
            cin.ignore();
            getline(cin, lecture_professor);

            transform(lecture_professor.begin(), lecture_professor.end(), lecture_professor.begin(), toupper);
            List.Search_professor(lecture_professor);
        }

        else if (number == 8)
        {
            cout << "<Search grade>" << endl;
            cout << "->Enter the grade you want to search : ";
            cin >> lecture_grade;

            List.Search_grade(lecture_grade);
        }

        else if (number == 9)
        {
            List.Ascending();
        }

        else if (number == 10)
        {
            List.Display();
        }

        else if (number == 11)
        {
            List.Reverse();
        }

        else if (number == 12)
        {
            cout << "Exit the Program." << endl;
            return 0;
        }
    }
}