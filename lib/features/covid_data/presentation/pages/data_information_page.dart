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
