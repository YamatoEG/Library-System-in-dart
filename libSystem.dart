void main() {
  //creating instance of book class
  Book b1 = new Book(1, "Dantes Inferno", false);
  Book b2 = new Book(2, "1Q84", true);

  b1.printInfo();
  b2.printInfo();
  //creating instance of userd class
  Userd user1 = new Userd(101, "Yamato");
  Userd user2 = new Userd(102, "Ahmad");
  user1.displayInfo();
  user2.displayInfo();
  //creating instancee of library class and doing some operations
  Library library = Library();
  library.addBook(b1);
  library.addBook(b2);
  library.addUser(user1);
  library.addUser(user2);
  library.returnBook(b2);
  library.displayInfo();
}

class Book {
  int id;
  String title;
  bool borrow = false;
  Book(this.id, this.title, this.borrow);
  printInfo() {
    print("{Bookid}:${id}\t{Book title}:${title}\t{borrowed statue}:${borrow}");
  }
}

class Userd {
  int id;
  String name;
  Userd(this.id, this.name);
  displayInfo() {
    print("{Userid}: ${this.id}\t {username}:${this.name}");
  }
}

class Library {
  List<Book> books = [];
  List<Userd> users = [];

  //method to add book to library books list with instance of book
  addBook(Book book) {
    books.add(book);
    print("${book.title} added to Library Successfully");
  }

  //method to add user to library users list with instance of userd
  addUser(Userd user) {
    users.add(user);
    print("User: ${user.name}, joined the library");
  }

  returnBook(Book book) {
    //check if the book already exist in library
    if (books.contains(book) && !book.borrow) {
      print("the book is already returned");
    } else {
      this.books.add(book);
      print("Book: ${book.title} returned");
      book.borrow = false;
    }
  }

  borr8owBook(Book book) {
    //check if the book not borrowed
    if (book.borrow) {
      print("book already borrowed, check later");
    } else {
      this.books.remove(book);
      print("Book: ${book.title}, has been borrowed");
      book.borrow = true;
    }
  }

  displayInfo() {
    print("Library available Books :");
    for (var book in books) {
      book.printInfo();
    }
    print("the users of library: ");
    for (var user in users) {
      user.displayInfo();
    }
  }
}
