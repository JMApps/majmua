import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/books/books_shelf.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Библиотека'),
        backgroundColor: Colors.teal,
        shape: MainAppStyle.appBarShape,
      ),
      body: const BooksShelf(),
    );
  }
}
