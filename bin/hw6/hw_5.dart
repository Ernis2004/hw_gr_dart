import 'subjects.dart';
import 'student.dart';
import 'teacher.dart';

void main() {
  // 1. Создаем учителя
  print('--- Teacher Info ---');
  Teacher teacher = Teacher(
    fullName: 'John Brown',
    age: 40,
    isMarried: true,
    experience: 5,
  );
  teacher.introduce();

  print('\n--- Students Info ---');

  // 2. Создаем студентов
  Student student1 = Student(
    fullName: 'Adam White',
    age: 17,
    isMarried: false,
    marks: {
      Subject.math: 90,
      Subject.physics: 85,
      Subject.english: 92,
      Subject.history: 88,
    },
  );

  Student student2 = Student(
    fullName: 'Alice Johnson',
    age: 19,
    isMarried: false,
    marks: {
      Subject.math: 75,
      Subject.english: 95,
      Subject.history: 80,
    },
  );

  // Вывод данных студентов
  List<Student> students = [student1, student2];
  for (var student in students) {
    student.introduce();
    student.showMarks();
    print('--------------------');
  }
  print('--- End of the program ---');
}