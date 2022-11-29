import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/book_model.dart';
import '../Providers/books_provider.dart';


class AddBooksWidget extends StatelessWidget {
  AddBooksWidget({Key? key}) : super(key: key);
  CollectionReference books = FirebaseFirestore.instance.collection("Books");

  TextEditingController name = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController publisher = TextEditingController();
  TextEditingController image = TextEditingController();

  TextEditingController isbn = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'Insert Book Details',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Name',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),

          ),
          controller: name,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Author',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: author,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Publisher',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: publisher,
        ),
        const SizedBox(
          height: 20,
        ),

        TextFormField(
          decoration: InputDecoration(
            labelText: 'Image URL',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: image,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'ISBN',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: isbn,
        ),

       
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async{BookModel book = BookModel(
            name: name.text,
            author: author.text,
            publisher: publisher.text,
            image: image.text,
            ISBN: isbn.text,
            isFavorite: false,
          );

          context.read<BookProvider>().addBook(book);
          Navigator.pushReplacementNamed(context, "/home");
          },
          child: const Text('Add Book',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
              backgroundColor: MaterialStateProperty.all(Colors.red[400])),
        )
      ]),
    );
  }
}
