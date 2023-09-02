import 'package:flutter/material.dart';

class TvShowsView extends StatelessWidget {

  const TvShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Proximamente...', style: TextStyle(fontSize: 40),),
          Text('Series de TV...', style: TextStyle(fontSize: 40),)
        ],
      ),
    );
  }
}