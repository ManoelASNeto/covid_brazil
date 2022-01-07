import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'images/info.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('App feito para estudos afins de conhecer as diversas, funções e metodos em Flutter')
        ],
      ),
    );
  }
}
