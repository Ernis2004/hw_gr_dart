class Person {
  String fullName;
  int age;
  bool isMarried;

  Person({
    required this.fullName,
    required this.age,
    required this.isMarried,
  });

  void introduce() {
    String marriedStatus = isMarried ? 'Yes' : 'No';
    print('Hi! My name is $fullName. I am $age years old. Married: $marriedStatus.');
  }
}