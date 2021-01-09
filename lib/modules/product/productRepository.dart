import 'package:hasura_connect/hasura_connect.dart';
import 'package:testeSuflex/modules/connectionHasura/myHasuraClass.dart';
import 'package:testeSuflex/modules/product/productModel.dart';

class ProductRepository {
  //Conexão e instância do Hasura Connect
  HasuraConnect myHasuraConnect;
  ProductRepository() {
    myHasuraConnect = MyHasuraClass().initHasuraConnect();
  }

  Snapshot returnProducts;

//Consultar ----------------------------------------------------------------------
  consultAllProduct() async {
    //Preparando query de envio para Hasura
    var query = """
 subscription MySubscription {
  suflex_test_products {
    category
    creationDate
    dateLastChange
    description
    discount
    id
    imagePath
    isANewProduct
    price
    title
  }
}
    """;
    var returnOfHasura = await myHasuraConnect.subscription(query);

    List<ProductModel> productsList = [];
    returnOfHasura.listen((returnList) {
      productsList.clear();
      returnList['data']['suflex_test_products'].forEach((produto) {
        productsList.add(ProductModel.fromJson(produto));
      });
    }).onError((err) {
      print(err);
    });
    return productsList;
  }

  //Salvar ----------------------------------------------------------------------
  Future<bool> saveNewProduct(ProductModel product) async {
    var query = """
 mutation MyMutation {
  insert_suflex_test_products(objects: 
  {
    category: "${product.category}", 
    creationDate: "", 
    dateLastChange: "", 
    description: "${product.description}", 
    discount: ${product.discount}, 
    imagePath: "caminho teste2", 
    price: ${product.price}, 
    title: "${product.title}" ,
    isANewProduct : ${product.isANewProduct} 
    }
    ) {
    returning {
      id
      title
    }
  }
}
    """;

    //Envio da query para Hasura
    var returnOfHasura = await myHasuraConnect.mutation(query);
    if (returnOfHasura['data']['insert_suflex_test_products']['returning'] !=
        null) {}
    return true;
  }

  //Delete ----------------------------------------------------------------------
  Future<bool> deleteProduct(ProductModel product) async {
    print('ID DO PRODUTO A SER DELETADO: ${product.id}');
    var query = """
 mutation MyMutation {
  delete_suflex_test_products(
where: {
id: {_eq: ${product.id}}}) {
    returning {
      id
      title
    }
  }
}
    """;

    //Envio da query para Hasura
    var returnOfHasura = await myHasuraConnect.mutation(query);
    print('RETORNO returnOfHasura: $returnOfHasura');
    if (returnOfHasura['data']['delete_suflex_test_products']['returning'] !=
        null) {
      return false;
    } else {
      return true;
    }
  }
}
