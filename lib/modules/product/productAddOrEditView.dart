import 'package:flutter/material.dart';
import 'package:testeSuflex/modules/product/productModel.dart';
import 'package:testeSuflex/modules/product/tabsOnEditOrAddProductPage.dart';

class ProductAddOrEditView extends StatefulWidget {
  final String comingFrom;
  final ProductModel product;

  ProductAddOrEditView(
    this.comingFrom,
    this.product,
  );

  @override
  _ProductAddOrEditViewState createState() =>
      _ProductAddOrEditViewState(comingFrom, product);
}

class _ProductAddOrEditViewState extends State<ProductAddOrEditView>
    with SingleTickerProviderStateMixin {
  String comingFrom;
  ProductModel product;

  _ProductAddOrEditViewState(
    this.comingFrom,
    this.product,
  );

  //TabBarControllerWidget tabBarPages = TabBarControllerWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(comingFrom == 'add' ? 'Cadastrar Produto' : 'Editar Produto'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Stack(
          children: <Widget>[
            headerProductImage(context),
            productImage(context),
            changeStorePhoto(context),
            tabBarPagesWidget(context),
          ],
        ),
      ),
    );
  }

  Widget headerProductImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.011,
      height: MediaQuery.of(context).size.height * 0.18,
      left: MediaQuery.of(context).size.width * 0,
      right: MediaQuery.of(context).size.width * 0,
      child: Text(
        'Imagem da capa',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget productImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.035,
      height: MediaQuery.of(context).size.height * 0.20,
      left: 0,
      right: 0,
      child: Container(
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      'https://www.hypeness.com.br/1/2017/07/CursoPao4.jpg')))),
    );
  }

  Widget changeStorePhoto(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.17,
      //height: MediaQuery.of(context).size.height * 0.35,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.02,
      child: TextButton.icon(
          label: Text(
            'Alterar foto',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.photo_camera_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            print('Pressed');
          }),
    );
  }

  Widget tabBarPagesWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.232),
      child: TabBarControllerWidget(comingFrom, product),
    );
  }
}
