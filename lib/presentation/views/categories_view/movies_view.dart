import 'package:flutter/material.dart';

class MoviesView extends StatelessWidget {
  final String category;
  const MoviesView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Desplegando la vista de $category...')
        ],
    );
  }
}