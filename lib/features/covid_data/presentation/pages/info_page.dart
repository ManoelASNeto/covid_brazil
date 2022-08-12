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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                  'https://cdn.pixabay.com/photo/2013/07/13/13/21/information-160885_1280.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Aplicativo desenvolvido no framework Flutter, com clean architecture.',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Link utilzado para busca dos dados: https://covid19-brazil-api.now.sh/api/report/v1',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Projeto de aplicativo realizado para fim de estudo e conhecimento do framework e arquitetura.',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
