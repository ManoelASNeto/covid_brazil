import 'package:covid_brazil/features/covid_data/presentation/bloc/covid_data_bloc.dart';
import 'package:covid_brazil/features/covid_data/presentation/pages/data_information_page.dart';
import 'package:covid_brazil/features/covid_data/presentation/pages/info_page.dart';
import 'package:covid_brazil/features/covid_data/presentation/widgets/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:covid_brazil/features/covid_data/presentation/bloc/covid_data_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados do CoronaVirus no Brasil',
            style: GoogleFonts.merriweatherSans(fontSize: 15)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const InfoPage()));
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.3,
              image: AssetImage(
                'images/covid1.jpeg',
              ),
              fit: BoxFit.cover),
        ),
        child: BlocBuilder<CovidDataBloc, CovidDataState>(
          builder: (context, state) => _body(state),
        ),
      ),
    );
  }

  Widget _body(CovidDataState state) {
    switch (state.status) {
      case CovidDataStatus.ready:
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: state.covidData?.length,
          itemBuilder: (BuildContext context, int position) {
            var covidInfo = state.covidData?[position];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                InkWellCustom(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DataInformationPage(
                          covidData: covidInfo,
                        ),
                      ),
                    );
                  },
                  title: covidInfo?.state,
                  image: _mapStateToUrl(covidInfo?.state ?? ''),
                ),
                const SizedBox(
                  height: 6,
                  width: 10,
                ),
              ],
            );
          },
        );

      case CovidDataStatus.error:
        return Center(
          child: Text(state.message ?? ''),
        );
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }

  String _mapStateToUrl(String state) {
    switch (state) {
      case 'São Paulo':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-sao-paulo.png';
      case 'Minas Gerais':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-minas-gerais.png';
      case 'Paraná':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-parana.png';
      case 'Rio Grande do Sul':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-rio-grande-do-sul.png';
      case 'Rio de Janeiro':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-rio-de-janeiro.png';
      case 'Bahia':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-bahia.png';
      case 'Santa Catarina':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-santa-catarina.png';
      case 'Ceará':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-ceara.png';
      case 'Goiás':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-goias.png';
      case 'Pernambuco':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-pernambuco.png';
      case 'Espírito Santo':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-espirito-santo.png';
      case 'Pará':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-pa.png';
      case 'Mato Grosso':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-mato-grosso.png';
      case 'Distrito Federal':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-distrito-federal.png';
      case 'Paraíba':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-paraiba.png';
      case 'Amazonas':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-amazonas.png';
      case 'Rio Grande do Norte':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-rio-grande-do-norte.png';
      case 'Mato Grosso do Sul':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-mato-grosso-do-sul.png';
      case 'Maranhão':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-do-maranhao.png';
      case 'Piauí':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-piaui.png';
      case 'Rondônia':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-rondonia.png';
      case 'Sergipe':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-sergipe.png';
      case 'Alagoas':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-alagoas.png';
      case 'Tocantins':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-tocantins.png';
      case 'Roraima':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-de-roraima.png';
      case 'Amapá':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-amapa.png';
      case 'Acre':
        return 'https://www.infoescola.com/wp-content/uploads/2021/02/bandeira-acre.png';

      default:
        return 'https://bandeira.net/wp-content/uploads/2018/08/bandeira-do-brasil-0.png';
    }
  }
}
