import 'package:assgn04/Models/book_model.dart';
import 'package:assgn04/Providers/books_provider.dart';
import 'package:assgn04/Screens/book_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksWidget extends StatefulWidget {
  final BookModel book;

  const BooksWidget({required this.book, super.key});

  @override
  State<BooksWidget> createState() => _BooksWidgetState();
}

class _BooksWidgetState extends State<BooksWidget> {

  @override
  void initState() {
    super.initState();
    context.read<BookProvider>().fetchBooksList();
  }
  //bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => BookDetailScreen(book: widget.book,)),
        );
      },
      tileColor: Colors.white,
      title:Text(
        widget.book.name,
        style: const TextStyle(fontWeight: FontWeight.w700,fontSize:20 ),
      ),
      subtitle: Text("By: ${widget.book.author}"),
      leading: CircleAvatar(
        maxRadius: 25,
        backgroundImage: NetworkImage(
          widget.book.image,
        ),
      ),
    );

  }

  Widget Avatar() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundImage: AssetImage(
          widget.book.image,
        ),
      ),
    );
  }

  Widget Details() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name(),
            //Text(widget.book.ISBN.toString()),
            Text("By: ${widget.book.author}"),
           // Text(widget.book.publisher_name),
          ],
        ),
      ),
    );
  }

  Widget Name() {
    return Text(
      widget.book.name,
      style: const TextStyle(fontWeight: FontWeight.w700,fontSize:20 ),
    );
  }

}
