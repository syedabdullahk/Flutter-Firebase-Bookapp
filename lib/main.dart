import 'package:assgn04/Screens/add_books_screen.dart';
import 'package:assgn04/Screens/books_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


import 'Providers/books_provider.dart';


void main()  async{
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (_) => BookProvider(),
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BooksListScreen(),
      routes: {
        "/home": (_) => BooksListScreen(),
        "/addBook": (_) => AddBooksScreen(),
      },
    );
  }
}
