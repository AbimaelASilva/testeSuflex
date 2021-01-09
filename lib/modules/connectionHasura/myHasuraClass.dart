import 'package:hasura_connect/hasura_connect.dart';

//classe usada para armazenar variáveis
class MyHasuraClass {
  // HasuraConnect connectToHasura;

  //Iniciar conexão com Hasura
  HasuraConnect initHasuraConnect() {
    HasuraConnect connectToHasura = HasuraConnect(
        'http://83.136.219.119:8080/v1/graphql',
        headers: {'x-hasura-admin-secret': 'hou_arz_main_se'});

    return connectToHasura;
  }
}
