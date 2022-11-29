
class BookModel{

final String name;
final String author;
final String publisher;
final String image;
final String ISBN;
final bool isFavorite;



  BookModel({
    required this.name,
    required this.author,
    required this.publisher,
    required this.ISBN,
    required this.image,
    required this.isFavorite,

  });

  static BookModel fromJson(Map<String, dynamic> json, String ISBN) => BookModel(
  name: json['name'] as String? ?? '',
  author: json['author'] as String? ?? '',
  publisher: json['publisher'] as String? ?? 'No Publisher',
  ISBN: json['ISBN'] as String? ?? '',
  image: json['image'] as String? ??
      'https://www.mswordcoverpages.com/wp-content/uploads/2018/10/Book-cover-page-2-CRC.png',
  isFavorite: json['isFavorite'] as bool? ?? false,
);
}