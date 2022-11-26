import 'dart:io';

class User {
  int age;
  String name;
  String role;
  User(this.name, this.age, this.role);

  bool viewResults(role) {
    return role == "teacher";
  }
}

class Student extends User {
  static const position = "student";
  int score;
  Student(name, age, this.score) : super(name, age, position);

  bool isPassed() {
    return score >= 70;
  }
}

class Teacher extends User {
  static const position = "teacher";
  Teacher(name, age) : super(name, age, position);
}

void main() {
  // Muellim ve telebelerin siyahisi;
  var studentList = [
    ["Ayshegul", 22, 97],
    ["Mesmexanim", 23, 69],
    ["Xanoglan", 20, 31],
    ["Elovset", 21, 88],
  ];
  var teacherList = [
    ["Sureyya", 52],
    ["Tarverdi", 75],
  ];

  //Siyahi esasinda klasslarin yaradilmasi
  var students = List<Student>.filled(studentList.length, Student("", 0, 0));

  for (int i = 0; i < studentList.length; i++) {
    students[i] = Student(
        studentList[i][0].toString(),
        int.parse(studentList[i][1].toString()),
        int.parse(studentList[i][2].toString()));
  }

  var teachers = List<Teacher>.filled(teacherList.length, Teacher("", 0));

  for (int i = 0; i < teacherList.length; i++) {
    teachers[i] = Teacher(
        teacherList[i][0].toString(), int.parse(teacherList[i][1].toString()));
  }

  //Sisteme girish (sade - ad ile)
  stdout.write("Sisteme daxil olun: ");
  var loggedUser = stdin.readLineSync().toString();

  //Login esasinda netice
  students.forEach((element) {
    if (element.name == loggedUser) {
      print(
          "Sisteme daxil oldu ${element.name}, ${element.age} yas, position ${element.role}");
      print(
          "Hormetli ${element.name}, siz imtahandan ${element.score} balla ${element.isPassed() ? "kechdiniz" : "kechmediniz"}");
    }
  });

  teachers.forEach((element) {
    if (element.name == loggedUser) {
      print(
          "Sisteme daxil oldu ${element.name}, ${element.age} yas, position ${element.role}");
      print("Imtahan neticeleri:");
      for (var stu in students) {
        print(
            "${stu.name} imtahandan ${stu.score} balla ${stu.isPassed() ? "kechib" : "kechmeyib"}");
      }
    }
  });
}
