#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cstring>
#include <vector>

using namespace std;

class MenuNode
{
public:
    string menu;
    string price;

    MenuNode* nextNode;
};

class Menu
{
private:
    MenuNode* Head;

public:
    Menu();
    ~Menu();
};

Menu::Menu()
{

}

Menu::~Menu()
{

}

class CategoryNode
{

public:
    string category;

    CategoryNode* nextNode;
    MenuNode* MemberNode;
};

class Category
{
private:
    CategoryNode* Head;
public:
    Category();
    ~Category();


};

Category::Category()
{
}

Category::~Category()
{

}

class InputList
{
private:
    CategoryNode* Head = NULL;

public:
    void load()
    {
        ifstream LoadFile;
        LoadFile.open("input.txt");

        if (!LoadFile.is_open()) // if When it doesn't open
            return; // exit the function
        while (!LoadFile.eof())
        {
            int coin = 0;
            string str;
            string token;
            getline(LoadFile, str);
            stringstream ss(str);
            vector<string> vec(3, " ");

            CategoryNode* Cate_load;
            MenuNode* Menu_load;
            CategoryNode* NewNode = new CategoryNode;
            MenuNode* newNode = new MenuNode;

            int i = 0;
            while (ss >> token)
            {
                for (int j = i; j < vec.size(); j++) {
                    vec[j] = token;
                    break;
                }
                i++;
            }

            if (vec[2].compare(" ") == 0) { // Make sure it's empty
                cout << endl;
                cout << vec[1] << " " << "invalid input." << endl;
                continue;
            }

            while (vec[0] != "CATEGORY" || vec[1] != "MENU" || vec[2] != "PRICE") //Skip the top row
            {
                if (Head == NULL)
                {
                    Head = NewNode;
                    Head->MemberNode = newNode;

                    Head->category = vec[0];
                    Head->MemberNode->menu = vec[1];
                    Head->MemberNode->price = vec[2];

                    Head->nextNode = NULL;
                    Head->MemberNode->nextNode = NULL;

                    break;
                }

                Cate_load = Head;
                Menu_load = Head->MemberNode;

                while (Cate_load->nextNode != NULL)
                {
                    if (Menu_load->menu.compare(vec[1]) == 0)
                    {
                        coin = 1;
                    }
                    Menu_load = Menu_load->nextNode;
                    Cate_load = Cate_load->nextNode;
                    //Cate_load->MemberNode = Cate_load->MemberNode->nextNode;
                }

                if (Menu_load->menu.compare(vec[1]) == 0)
                {
                    coin = 1;
                }

                if (coin == 1)
                {
                    cout << endl;
                    cout << vec[1] << " already exists! " << endl;
                    break;
                }

                if (Cate_load->nextNode == NULL )
                {

                    Cate_load->nextNode = NewNode;
                    Cate_load = Cate_load->nextNode;

                    Menu_load->nextNode = newNode;
                    Menu_load = Menu_load->nextNode;

                    Cate_load->category = vec[0];

                    Menu_load->menu = vec[1];

                    Menu_load->price = vec[2];

                    Cate_load->nextNode = NULL;
                    Menu_load->nextNode = NULL;

                    break;
                }

            }
        }

        cout << endl;
        cout << "Load Success!" << endl << endl;
        return;
    }
    void print()
    {
        if (Head == NULL)
        {
            cout << endl;
            cout << "The data does not exist!" << endl << endl;
            return;
        }

        CategoryNode* Cate_print = Head;
        CategoryNode* Cate_print_next = Head->nextNode;
        MenuNode* Menu_print = Head->MemberNode;
        MenuNode* Menu_print_next;
        vector<string> vec(2, " ");

        while (Cate_print != NULL)
        {
            cout << "===========" << Cate_print->category << "===========" << endl;

            while (Menu_print != NULL)
            {
                cout << Menu_print->menu << endl;
                cout << Menu_print->price << endl;

                Menu_print = Menu_print->nextNode;
            }

            Cate_print = Cate_print->nextNode;
        }
        /* while (Cate_print != NULL)
         {
             Cate_print_next = Cate_print->nextNode;
             while (Cate_print_next != NULL)
             {
                 if (Cate_print->category == Cate_print_next->category)
                 {
                     cout << "===========" << Cate_print->category << "===========" << endl;
                     while (Menu_print != NULL)
                     {
                         cout << Menu_print->menu << endl << endl;
                         Menu_print = Menu_print->nextNode;
                     }
                     Cate_print_next = Cate_print_next->nextNode;
                 }
                 else
                 {
                     Cate_print_next = Cate_print_next->nextNode;
                 }
             }
             Cate_print = Cate_print->nextNode;
         }*/

    }
    void insert(string category, string menu, string price) // Function responsible for insert
    {
        int coin = 0;

        CategoryNode* NewNode = new CategoryNode;
        CategoryNode* insert_cate;

        MenuNode* newNode = new MenuNode;
        MenuNode* insert_menu;

        if (Head == NULL)
        {
            Head = NewNode;
            Head->MemberNode = newNode;

            Head->category = category;
            Head->MemberNode->menu = menu;
            Head->MemberNode->price = price;

            Head->nextNode = NULL;
            Head->MemberNode->nextNode = NULL;

            return;
        }

        insert_cate = Head;
        insert_menu = Head->MemberNode;

        while (insert_cate->nextNode != NULL)
        {
            if (insert_menu->menu.compare(menu) == 0)
            {
                coin = 1;
            }
            insert_cate = insert_cate->nextNode;
            insert_menu = insert_menu->nextNode;
        }

        if (insert_menu->menu.compare(menu) == 0)
        {
            coin = 1;
        }

        if (coin == 1)
        {
            cout << endl;
            cout << menu << " already exists! " << endl << endl;
            return;
        }

        if (insert_cate->nextNode == NULL)
        {
            insert_cate->nextNode = NewNode;
            insert_cate = insert_cate->nextNode;

            insert_menu->nextNode = newNode;
            insert_menu = insert_menu->nextNode;

            insert_cate->category = category;
            insert_menu->menu = menu;
            insert_menu->price = price;

            insert_cate->nextNode = NULL;
            insert_menu->nextNode = NULL;
        }

    }

    void Cate_Search(string Category) // Function responsible for cate search
    {
        CategoryNode* Cate_Search = Head;
        MenuNode* Menu_Search = Head->MemberNode;
        int coin = 0;

        while (Cate_Search != NULL)
        {
            if (Cate_Search->category.compare(Category) == 0)
            {
                coin = 1;
            }
            Cate_Search = Cate_Search->nextNode;
            Menu_Search = Menu_Search->nextNode;
        }

        if (coin == 0)
        {
            cout << endl;
            cout << "No Found Category! " << endl << endl;
            return;
        }

        Cate_Search = Head;
        Menu_Search = Head->MemberNode;

        cout << Category << endl;
        while (Cate_Search != NULL)
        {
            if (Cate_Search->category.compare(Category) == 0)
            {
                cout << Menu_Search->menu << " " << Menu_Search->price << endl;
            }
            Cate_Search = Cate_Search->nextNode;
            Menu_Search = Menu_Search->nextNode;
        }
        cout << endl;
    }

    void Menu_Search(string Menu) //Function responsible for menusearch
    {
        MenuNode* Menu_Search = Head->MemberNode;
        int coin = 0;

        while (Menu_Search != NULL)
        {
            if (Menu_Search->menu.compare(Menu) == 0)
            {
                cout << Menu_Search->menu << " " << Menu_Search->price << endl;
                coin = 1;
            }
            Menu_Search = Menu_Search->nextNode;
        }

        if (coin == 0)
        {
            cout << endl;
            cout << "No Found Menu!" << endl;
        }
        cout << endl;
    }

    void Delete(string Menu) // Function responsible for delete
    {
        MenuNode* Menu_Delete = Head->MemberNode;
        MenuNode* temp = Menu_Delete;

        if (Menu_Delete == NULL)
        {
            cout << "No information to Delete" << endl;
            return;
        }

        while (Menu_Delete->menu.compare(Menu) != 0)
        {
            temp = Menu_Delete;
            Menu_Delete = Menu_Delete->nextNode;
            if (Menu_Delete == NULL)
            {
                cout << "No information to Delete" << endl;
                return;
            }
        }

        if (Menu_Delete->menu.compare(Menu) == 0)
        {
            //temp = Menu_Delete;
            if (Menu_Delete == Head->MemberNode)
            {
                cout << "Delete Success! " << endl;

                Head->MemberNode = Menu_Delete->nextNode;
                delete Menu_Delete;

                return;
            }
            else
            {
                if (Menu_Delete->nextNode == NULL)
                {
                    temp->nextNode = NULL;
                    delete Menu_Delete;

                    return;
                }
                else
                {
                    temp->nextNode = Menu_Delete->nextNode;
                    delete(Menu_Delete);
                    return;
                }
            }

            return;
        }
    }
};


int main(void)
{
    int number = 1;

    InputList List;

    while (number >= 1 && number <= 7)
    {
        string Category;
        string Menu;
        string price;

        cout << "1. LOAD" << endl;
        cout << "2. PRINT" << endl;
        cout << "3. INSERT" << endl;
        cout << "4. Category SEARCH" << endl;
        cout << "5. Menu SEARCH" << endl;
        cout << "6. DELETE" << endl;
        cout << "7. End of Program!" << endl;
        cout << "Select Number : ";
        cin >> number;

        while (number < 1 || number > 7)
        {
            system("cls");
            cout << "1. LOAD" << endl;
            cout << "2. PRINT" << endl;
            cout << "3. INSERT" << endl;
            cout << "4. Category SEARCH" << endl;
            cout << "5. Menu SEARCH" << endl;
            cout << "6. DELETE" << endl;
            cout << "7. End of Program!" << endl;
            cout << "Select Number : ";
            cin >> number;
        }

        if (number == 1)
        {
            List.load();
        }
        else if (number == 2)
        {
            List.print();
        }
        else if (number == 3)
        {
            cin >> Category;
            cin >> Menu;
            cin >> price;
            List.insert(Category, Menu, price);
        }
        else if (number == 4)
        {
            cout << "Enter Category which you want to find : ";
            cin >> Category;

            List.Cate_Search(Category);
        }
        else if (number == 5)
        {
            cout << "Enter Menu which you want to find : ";
            cin >> Menu;

            List.Menu_Search(Menu);
        }
        else if (number == 6)
        {
            cin >> Menu;

            List.Delete(Menu);
        }
        else if (number == 7)
        {
            cout << endl;
            cout << "End of Program!" << endl;
            return 0;
        }
    }


}
