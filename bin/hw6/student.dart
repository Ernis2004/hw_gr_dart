import 'person.dart';
import 'subjects.dart';

class Student extends Person {
  Map<Subject, double> marks;

  Student({
    required String fullName,
    required int age,
    required bool isMarried,
    required this.marks,
  }) : super(fullName: fullName, age: age, isMarried: isMarried);

  void showMarks() {
    print('Student: $fullName');
    for (var entry in marks.entries) {
      // .name позволяет вывести 'math' вместо 'Subject.math'
      print('${entry.key.name}: ${entry.value}');
    }
  }

  double calculateAverage() {
    if (marks.isEmpty) return 0.0;
    double sum = 0;
    for (var score in marks.values) {
      sum += score;
    }
    return sum / marks.length;
  }

  @override
  void introduce() {
    super.introduce();
    print('Average mark: ${calculateAverage().toStringAsFixed(1)}');
  }
}