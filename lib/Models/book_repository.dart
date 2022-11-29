import 'package:cloud_firestore/cloud_firestore.dart';
import 'book_model.dart';

abstract class BookModelsRepository {
  Future<List<BookModel>> fetchBookList();

  void addBookModel(Map<String, dynamic> data);

  Future<List<BookModel>> setFav(BookModel book);
}

class FirebaseBookModelsRepository implements BookModelsRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<BookModel>> fetchBookList() async {
    List<BookModel> books = [];

    await db.collection('books').get().then((event) {
      books = event.docs
          .map(
            (book) => BookModel.fromJson(book.data(), book.id),
          )
          .toList();
    });
    return books;
  }

  @override
  void addBookModel(Map<String, dynamic> data) async {
    await db.collection('books').add(data);
  }

  @override
  Future<List<BookModel>> setFav(BookModel book) async {
    await db.collection('books').doc(book.ISBN.toString()).update({
      'name': book.name,
      'author': book.author,
      'publisher': book.publisher,
      'ISBN': book.ISBN,
      'image': book.image,
      'isFavorite': !book.isFavorite,
    });
    return fetchBookList();
  }
}

class MockBookModelRepository implements BookModelsRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<BookModel>> fetchBookModelsList() async {
    List<BookModel> books = [
      BookModel(
        name: "A Brief History of Time",
        author: "Stephen Hawking",
        publisher: "Oxford University",
        image:
            "https://www.bookganga.com/eBookModels/Content/images/books/42902be8b6a24ea38714733b36417fe5.jpg",
        ISBN: "055305340",
        isFavorite: true,
      ),
      BookModel(
        name: "Theory of Everything",
        author: "Stephen Hawking",
        publisher: "Oxford University",
        image:
            "https://whiteincorporation.com/wp-content/uploads/2022/01/The-Theory-of-Everything_BookModelcover.png",
        ISBN: "1893224546",
        isFavorite: false,
      ),
      BookModel(
        name: "The God Equation",
        author: "Dr. Michio Kaku",
        publisher: "UC Berkeley",
        image:
            "https://1.bp.blogspot.com/-r6mLY2i78AI/YG1340Yg2LI/AAAAAAAAbJ4/I_1S9ig9ztgAWYkEAYzjSmxc0_0WwANgACLcBGAsYHQ/s2048/71maf8LOL-L.jpg",
        ISBN: "0385542747",
        isFavorite: true,
      ),
      BookModel(
        name: "The Emperor's New Mind",
        author: "Roger Penrose",
        publisher: "Cambridge University",
        image: "https://m.media-amazon.com/images/I/51A40vD+H-L.jpg",
        ISBN: "0198519737",
        isFavorite: true,
      )
    ];
    return books;
  }

  @override
  void addBookModel(Map<String, dynamic> data) {
    db.collection('books').add(data);
  }

  @override
  Future<List<BookModel>> setFav(BookModel book) async {
    await db.collection('books').doc(book.toString()).update({
      'name': book.name,
      'author': book.author,
      'publisher': book.publisher,
      'ISBN': book.ISBN,
      'image': book.image,
      'isFavorite': !book.isFavorite,
    });

    return fetchBookList();
  }

  @override
  Future<List<BookModel>> fetchBookList() async {
    List<BookModel> books = [];

    await db.collection('books').get().then((event) {
      books = event.docs
          .map(
            (book) => BookModel.fromJson(book.data(), book.id),
      )
          .toList();
    });
    return books;
  }
}
