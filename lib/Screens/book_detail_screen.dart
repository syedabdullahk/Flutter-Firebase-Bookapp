import 'package:assgn04/Models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  final BookModel book;

  const BookDetailScreen({required this.book, super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetailScreen> {
  //bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Card(

        child: ListTile(

          tileColor: Colors.white,
          title:Text(
            widget.book.name,
            style: const TextStyle(fontWeight: FontWeight.w700,fontSize:20 ),
          ),
          subtitle: Details(),
          leading: CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(
              widget.book.image,
            ),
          ),
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
            Text("ISBN: ${widget.book.ISBN}"),
            Text("Published By: ${widget.book.publisher}"),
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
