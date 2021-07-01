import mysql.connector
from prettytable import from_db_cursor

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="root",
    database="student_database"
)
mycursor = db.cursor()

def view_student():
    mycursor.execute("SELECT * from `student_info`")
    table = from_db_cursor(mycursor)
    print(table)
    input("Press enter to return to main menu...")

def add_student():
    print("Input student ID: ")
    while True:
        id = input()
        f = f"SELECT * FROM `student_info` WHERE `Student ID` = '{id}'"
        mycursor.execute(f)
        row = mycursor.fetchone()
        if row != None:
            print("Student ID already implemented!\n"
                  "Create another:")
        else:
            break
    print("Input name: ")
    name = input()
    print("Year level: ")
    year_level = input()
    print("Gender [M, F, LGBTQ]: ")
    gender = input().upper()
    print("Course: ")
    while True:
        course = input().upper()
        f = f"SELECT * FROM `Course` WHERE `Course Code` = '{course}'"
        mycursor.execute(f)
        row2 = mycursor.fetchone()
        if row2 != None:
            break
        else:
            print("Course Code not Found")
            print("Input Course: ")

    mycursor.execute("INSERT INTO `student_info` (`Student ID`, `Name`, `Year Level`, `Gender`, `Course`) "
                     "VALUES (%s,%s,%s,%s,%s)",
                     (id, name, year_level, gender,course))
    db.commit()
    print("Student added Successfully!")
    input("Press enter to return to main menu...")

def edit_student():
    print("Enter the student ID number to edit value: ")
    edit = input()

    query = f"SELECT * FROM `student_info` WHERE `Student ID` = '{edit}'"
    mycursor.execute(query)

    row = mycursor.fetchone()

    if row != None:
        print("What value will you change?\n"
              "1. Name\n"
              "2. Year Level\n"
              "3. Gender\n"
              "4. Course\n"
              "Note: To change Student ID, delete the ID number first and add a new one.")
        print("Input: ")
        choice = input()
        if choice == "1":
            print("Input Name: ")
            name = input()
            query2 = f"UPDATE `student_info` SET `Name` = '{name}' WHERE `Student ID` = '{edit}'"
            mycursor.execute(query2)
            db.commit()
        if choice == "2":
            print("Input Year Level: ")
            yr_level = input()
            query2 = f"UPDATE `student_info` SET `Year Level` = '{yr_level}' WHERE `Student ID` = '{edit}'"
            mycursor.execute(query2)
            db.commit()
        if choice == "3":
            print("Input Gender: ")
            gender = input()
            query3 = f"UPDATE `student_info` SET `Gender` = '{gender}' WHERE `Student ID` = '{edit}'"
            mycursor.execute(query3)
            db.commit()
        if choice == "4":
            print("Input Course (BSCA, BSIT, BSCS, BSIS): ")
            while True:
                course = input()
                f = f"SELECT * FROM `Course` WHERE `Course Code` = '{course}'"
                mycursor.execute(f)
                row2 = mycursor.fetchone()
                if row2 != None:
                    query4 = f"UPDATE `student_info` SET `Course` = '{course}' WHERE `Student ID` = '{edit}'"
                    mycursor.execute(query4)
                    db.commit()
                    break
                else:
                    print("Course Code not Found")
                    print("Input Course (BSCA, BSIT, BSCS, BSIS): ")

    else:
        print("Data Does Not Exist")
    input("Press enter to return to main menu...")

def delete_student():
    print("Enter the student ID number to delete: ")
    edit = input()

    query = f"SELECT * FROM `student_info` WHERE `Student ID` = '{edit}'"
    mycursor.execute(query)

    row = mycursor.fetchone()

    if row != None:
        query2 = f"DELETE FROM `student_info` WHERE `Student ID` = '{edit}'"
        mycursor.execute(query2)
        db.commit()
        print("Deleted Successfully")
        input("Press enter to return to main menu...")
    else:
        print("Student ID not Found")
        input("Press enter to return to main menu...")

def find_student():
    print("Enter the student ID number to delete: ")
    edit = input()

    query = f"SELECT * FROM `student_info` WHERE `Student ID` = '{edit}'"
    mycursor.execute(query)

    row = mycursor.fetchone()

    if row != None:
        print(row)
        input("Press enter to return to main menu...")
    else:
        print("Student ID not Found")
        input("Press enter to return to main menu...")

def courses():
    mycursor.execute("SELECT * from `course`")
    table = from_db_cursor(mycursor)
    print(table)
    input("Press enter to return to main menu...")

def add_courses():
    print("Course code: ")
    course = input().upper()
    print("Course name: ")
    course_name = input()

    mycursor.execute("INSERT INTO `course` (`Course Code`, `Course`) "
                     "VALUES (%s,%s)",
                     (course, course_name))
    db.commit()
    input("Press enter to return to main menu...")

def edit_courses():
    print("What course do you want to edit?: (Input Course Code)")
    edit = input()

    query = f"SELECT * FROM `course` WHERE `Course Code` = '{edit}'"
    mycursor.execute(query)

    row = mycursor.fetchone()

    if row != None:
        print("Input new Course Code: ")
        choice = input()
        print("Input new Course Name: ")
        name = input()

        query2 = f"UPDATE `course` SET `Course Code` = '{choice}', `Course` = '{name}' WHERE `Course Code` = '{edit}'"
        mycursor.execute(query2)
        db.commit()
    else:
        print("Course not Found")
        input("Press enter to return to main menu...")

def delete_courses():
    print("What course do you want to delete?: (Input Course Code)")
    edit = input()

    query = f"SELECT * FROM `course` WHERE `Course Code` = '{edit}'"
    mycursor.execute(query)

    row = mycursor.fetchone()

    if row != None:
        query2 = f"DELETE FROM `course` WHERE `Course Code` = '{edit}'"
        mycursor.execute(query2)
        db.commit()
        print("Deleted Successfully")
        input("Press enter to return to main menu...")
    else:
        print("Course not Found")
        input("Press enter to return to main menu...")

def show_students_course():
    print("Enter course code: ")
    course = input()

    query = f"SELECT * FROM `course` WHERE `Course Code` = '{course}'"
    mycursor.execute(query)

    row = mycursor.fetchone()

    if row != None:
        query = f"SELECT * FROM `student_info` WHERE `Course` = '{course}'"
        mycursor.execute(query)
        table = from_db_cursor(mycursor)
        print(table)
        input("Press enter to return to main menu...")
    else:
        print("Course not Found")
        input("Press enter to return to main menu...")


while True:
    print("----------------")
    print("Student Database V2\n")
    print("1. Student Information\n"
          "2. Courses")
    choice = input("Input: ")

    if choice == "1":
        print("Student Database V2\n")
        print("1. Student Table\n"
              "2. Add Student\n"
              "3. Edit Student\n"
              "4. Delete Student\n"
              "5. Find Student")
        selection = input("Input: ")
        if selection == "1":
            view_student()

        if selection == "2":
            add_student()

        if selection == "3":
            edit_student()

        if selection == "4":
            delete_student()

        if selection == "5":
            find_student()
        else:
            print("")

    if choice == "2":
        print("Student Database V2\n")
        print("1. Course List\n"
              "2. Add Course\n"
              "3. Edit Course\n"
              "4. Delete Course\n"
              "5. Students with similar Course")
        selection = input("Input: ")

        if selection == "1":
            courses()

        if selection == "2":
            add_courses()

        if selection == "3":
            edit_courses()

        if selection == "4":
            delete_courses()

        if selection == "5":
            show_students_course()

        else:
            print("")
    else:
        print("")



