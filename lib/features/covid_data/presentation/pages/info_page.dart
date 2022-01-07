import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.network(
                'https://image.flaticon.com/icons/png/512/63/63830.png',
                width: 150,
                height: 150,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('App feito para estudos afins de conhecer as diversas, funções e metodos em Flutter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
