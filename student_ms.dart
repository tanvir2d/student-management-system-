import 'dart:io';

void main() {
  // We are using a list to hold student records in memory
  List students = [];

  while (true) {
    print("\n--- Student Management System ---");
    print("1. Create Student");
    print("2. Edit Student");
    print("3. Delete Student");
    print("4. List All Students");
    print("5. Exit");

    stdout.write("Enter choice: ");
    String? choice = stdin.readLineSync();

    // 1. CREATE: Adding a new student with ID, Name, and GPA
    if (choice == '1') {
      stdout.write("Enter Student ID: ");
      String id = stdin.readLineSync()!;

      stdout.write("Enter Student Name: ");
      String name = stdin.readLineSync()!;

      stdout.write("Enter GPA: ");
      String gpa = stdin.readLineSync()!;

      // Storing as a small list inside the main students list
      students.add([id, name, gpa]);

      print("Student added successfully!");
    }

    // 2. EDIT: Search by ID and update Name and GPA
    else if (choice == '2') {
      stdout.write("Enter Student ID to edit: ");
      String id = stdin.readLineSync()!;
      bool found = false;

      for (int i = 0; i < students.length; i++) {
        if (students[i][0] == id) {
          found = true;
          stdout.write("Enter New Name: ");
          students[i][1] = stdin.readLineSync()!;

          stdout.write("Enter New GPA: ");
          students[i][2] = stdin.readLineSync()!;

          print("Student information updated!");
          break; 
        }
      }
      
      if (!found) {
        print("Error: Student ID not found!");
      }
    }

    // 3. DELETE: Remove a student from the list using ID
    else if (choice == '3') {
      stdout.write("Enter ID to delete: ");
      String id = stdin.readLineSync()!;

      int initialSize = students.length;
      students.removeWhere((s) => s[0] == id);

      if (students.length < initialSize) {
        print("Student record deleted!");
      } else {
        print("Error: ID not found!");
      }
    }

    // 4. LIST: Show all students stored in the list
    else if (choice == '4') {
      if (students.isEmpty) {
        print("The list is empty!");
      } else {
        print("\n--- Current Student List ---");
        for (var s in students) {
          print("ID: ${s[0]} | Name: ${s[1]} | GPA: ${s[2]}");
        }
      }
    }

    // 5. EXIT: Close the loop and program
    else if (choice == '5') {
      print("Exiting program... Goodbye!");
      break;
    }

    // Handling wrong inputs
    else {
      print("Invalid choice! Please try again with 1-5.");
    }
  }
}