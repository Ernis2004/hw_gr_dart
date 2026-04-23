import 'person.dart';

class Teacher extends Person {
  int experience;
  static const double _baseSalary = 50000;

  Teacher({
    required String fullName,
    required int age,
    required bool isMarried,
    required this.experience,
  }) : super(fullName: fullName, age: age, isMarried: isMarried);

  double calculateSalary() {
    double salary = _baseSalary;

    // Повышение на 5% за каждый год после 3 лет стажа
    if (experience > 3) {
      int extraYears = experience - 3;
      for (int i = 0; i < extraYears; i++) {
        salary += salary * 0.05;
      }
    }

    // Бонус за семейное положение
    if (isMarried) {
      salary += 5000;
    }

    return salary;
  }

  @override
  void introduce() {
    super.introduce();
    print('Experience: $experience years.');
    print('Salary: ${calculateSalary().toStringAsFixed(1)}');
  }
}