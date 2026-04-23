import 'book.dart';
import 'library.dart';

void main() {
  Book book1 = Book('Harry Potter', 'J.K. Rowling');

  Book book2 = Book.withRating(
    'Sherlock Holmes',
    'Arthur Conan Doyle',
    9.0,
  );

  Book book3 = Book('The Hobbit', 'J.R.R. Tolkien');
  book3.rating = 8.5;

  Library cityLib = Library('City Library');

  cityLib.addBook(book1);
  cityLib.addBook(book2);
  cityLib.addBook(book3);

  cityLib.showBooks();

  print('Total books in library: ${cityLib.totalBooks}');
}