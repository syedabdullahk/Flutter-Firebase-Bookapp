import 'package:flutter/material.dart';

import '../Models/book_model.dart';
import '../Models/book_repository.dart';

class BookProvider with ChangeNotifier {
  List<BookModel> books = [];

  bool isFetching = false;

  late BookModel _currentBook;

  BookModel get currentBook => _currentBook;

  final BookModelsRepository _bookRepository = FirebaseBookModelsRepository();

  void fetchBooksList() async {
    isFetching = true;
    notifyListeners();
    books = await _bookRepository.fetchBookList();
    isFetching = false;
    notifyListeners();
  }

  void setFav(BookModel book) async {
    isFetching = true;
    notifyListeners();
    books = await _bookRepository.setFav(book);
    isFetching = false;
    notifyListeners();
  }

  void addBook(BookModel book) async {
    isFetching = true;
    notifyListeners();
    _bookRepository.addBookModel({
      'name': book.name,
      'author': book.author,
      'publisher': book.publisher,
      'ISBN': book.ISBN,
      'image': book.image,
      'isFavorite': book.isFavorite,
    });
    isFetching = false;
    notifyListeners();
  }
}
