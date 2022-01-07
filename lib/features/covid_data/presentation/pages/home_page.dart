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
        title: Text('Dados do CoronaVirus no Brasil', style: GoogleFonts.merriweatherSans(fontSize: 15)),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const InfoPage()));
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_estado_de_S_Paulo.svg.png';
      case 'Minas Gerais':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743Bandeira_de_Minas_Gerais.svg.png';
      case 'Paraná':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiraparana.png';
      case 'Rio Grande do Sul':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirariograndedosul.png';
      case 'Rio de Janeiro':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeirariodejaneiro.png';
      case 'Bahia':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeirabahia.png';
      case 'Santa Catarina':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirasantacatarina.png';
      case 'Ceará':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiraceara.png';
      case 'Goiás':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiragoias.png';
      case 'Pernambuco':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741BandeiradePernambuco.png';
      case 'Espírito Santo':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiraespiritosanto.png';
      case 'Pará':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_Par.svg.png';
      case 'Mato Grosso':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiramatogrosso.png';
      case 'Distrito Federal':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiradistritofederal.png';
      case 'Paraíba':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeiraparaiba.png';
      case 'Amazonas':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_Amazonas.svg.png';
      case 'Rio Grande do Norte':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeirariograndedonorte.png';
      case 'Mato Grosso do Sul':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744bandeira_Mato_Grosso_Sul.png';
      case 'Maranhão':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852741bandeiradomaranhao.jpg';
      case 'Piauí':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852742bandeirapiaui.png';
      case 'Rondônia':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirarondonia.png';
      case 'Sergipe':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeirasergipe.png';
      case 'Alagoas':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743Bandeira_de_Alagoas.svg.png';
      case 'Tocantins':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeiratocantins.png';
      case 'Roraima':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852743bandeiraroraima.png';
      case 'Amapá':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852744Bandeira_do_Amap.svg.png';
      case 'Acre':
        return 'http://www.educadores.diaadia.pr.gov.br/modules/galeria/uploads/11/1409852740bandeiraacre.png';

      default:
        return 'https://bandeira.net/wp-content/uploads/2018/08/bandeira-do-brasil-0.png';
    }
  }
}
