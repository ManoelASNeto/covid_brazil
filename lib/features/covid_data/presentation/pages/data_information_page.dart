import 'package:covid_brazil/features/covid_data/domain/entities/covid_data_entity.dart';
import 'package:flutter/material.dart';

class DataInformationPage extends StatelessWidget {
  final CovidData? covidData;
  const DataInformationPage({Key? key, this.covidData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados ${covidData?.state}'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Stack(
            children: [
              Image.network(
                'https://www.unicef.org/brazil/sites/unicef.org.brazil/files/styles/crop_thumbnail/public/COVID19-Mask_1.png?itok=VRJNoJkM',
                fit: BoxFit.cover,
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 340,
                    ),
                    Text(
                      covidData?.state ?? 'Estado',
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Casos: ${covidData?.cases!}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Mortes: ${covidData?.deaths!}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Casos Suspeitos: ${covidData?.suspects!}',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.network(
                      _mapStateToUrl(
                        covidData?.state ?? '',
                      ),
                      height: 75,
                      width: 105,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
