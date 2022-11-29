import 'package:assgn04/Providers/books_provider.dart';
import 'package:assgn04/Screens/add_books_screen.dart';
import 'package:assgn04/Widgets/books_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksListScreen extends StatefulWidget {
  const BooksListScreen({super.key});



  @override
  State<BooksListScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksListScreen> {

  @override
  void initState() {
    super.initState();
    context.read<BookProvider>().fetchBooksList();
  }
  @override
  Widget build(BuildContext context) {
    final books = context.watch<BookProvider>().books;


    return Scaffold(
      appBar: AppBar(title: Text("Home")),
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ListView(

            children: books
                .map((b) => BooksWidget(
              book: b,
            ))
                .toList(),
          ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => AddBooksScreen()),
      );},
      child: Icon(Icons.add)),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}