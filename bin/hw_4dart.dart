// Глобальная переменная
int totalCalls = 0;

// 1️⃣ greet()
void greet() {
  totalCalls++;
  print("Hello! Welcome to Dart programming!");
}

// 2️⃣ introduce(String name, int age)
void introduce(String name, int age) {
  totalCalls++;
  print("My name is $name and I am $age years old.");
}

// 3️⃣ addNumbers(int a, int b)
int addNumbers(int a, int b) {
  totalCalls++;
  return a + b;
}

// 4️⃣ calculateDiscount(...)
double calculateDiscount({
  required double price,
  double discount = 0,
  double tax = 0,
}) {
  totalCalls++;
  double finalPrice =
      price - (price * discount / 100) + (price * tax / 100);
  return finalPrice;
}

void main() {
  // 1️⃣ greet() вызываем 3 раза
  greet();
  greet();
  greet();

  print("");

  // 2️⃣ introduce()
  introduce("Alex", 25);
  introduce("John", 30);
  introduce("Emma", 22);

  print("");

  // 3️⃣ addNumbers()
  int sum1 = addNumbers(5, 8);
  print("Sum of 5 and 8 is $sum1.");

  int sum2 = addNumbers(10, 20);
  print("Sum of 10 and 20 is $sum2.");

  print("");

  // 4️⃣ calculateDiscount()
  double price1 = calculateDiscount(price: 100);
  print("Final price: $price1");

  double price2 = calculateDiscount(price: 100, discount: 10);
  print("Final price: $price2");

  double price3 =
      calculateDiscount(price: 100, discount: 10, tax: 5);
  print("Final price: $price3");

  print("");

  // 🔚 Итог
  print("Total function calls: $totalCalls");
}