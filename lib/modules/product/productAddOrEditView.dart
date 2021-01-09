import 'package:flutter/material.dart';
import 'package:testeSuflex/modules/product/tabsOnEditOrAddProductPage.dart';

class ProductAddOrEditView extends StatefulWidget {
  // HomePageView({Key key, this.title}) : super(key: key);

  @override
  _ProductAddOrEditViewState createState() => _ProductAddOrEditViewState();
}

class _ProductAddOrEditViewState extends State<ProductAddOrEditView>
    with SingleTickerProviderStateMixin {
  TabBarControllerWidget tabBarPages = TabBarControllerWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Produto'),
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
          // width: 190.0,
          //  height: 190.0,
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
      child: tabBarPages,
    );
  }

/*
  Widget headerOptionsProducts(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.30,
        //height: MediaQuery.of(context).size.height * 0.35,
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Informações do Produto',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                'Ingredientes',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                'Rendimento',
                style: TextStyle(color: Colors.red),
              ),
            ]),
            Divider()
          ],
        ));
  }

  Widget titleProduct(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.34,
        //height: MediaQuery.of(context).size.height * 0.35,
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        child: Text('Título'));
  }

  TextEditingController productTitleController = TextEditingController();
  Widget inputProductTitle(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.365,
      //height: MediaQuery.of(context).size.height * 0.35,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.02,
      child: TextFormField(
        controller: productTitleController,
        maxLength: 55,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
          labelText: 'Escreva o nome/título do produto',
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget titleCategory(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.44,
        //height: MediaQuery.of(context).size.height * 0.35,
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        child: Text('Categoria do Produto'));
  }

  Widget inputProductCategory(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.49,
      //height: MediaQuery.of(context).size.height * 0.35,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.02,
      child: TextFormField(
        controller: productTitleController,
        maxLength: 55,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          labelText: 'Escolha a categoria do produto',
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget titleProductDescription(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.585,
        //height: MediaQuery.of(context).size.height * 0.35,
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        child: Text('Descrição do Produto'));
  }

  Widget inputProductDescription(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.615,
      //height: MediaQuery.of(context).size.height * 0.35,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.02,
      child: TextFormField(
        controller: productTitleController,
        maxLength: 500,
        decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          labelText: 'Descrição mais detalhada do produto.',
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2.0,
            ),
          ),
        ),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: null,
      ),
    );
  }


  Widget tabBarPagesWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 250),
      child: tabBarPages,
    );
  }


  

  Widget storeDescription(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.36,
      height: MediaQuery.of(context).size.height * 0.35,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Padaria Amélia',
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 25,
            ),
          ),
          Text(
            'Rua Antônio de Godói, 88-Centro/SP',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget storeRatings(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.45,
      //height: MediaQuery.of(context).size.height * 0.35,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow[700],
            size: 30,
          ),
          Text(
            '5.0',
            style: TextStyle(
              color: Colors.yellow[600],
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '(63 avaliações)',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget addButton(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.52,
        //height: MediaQuery.of(context).size.height * 0.35,
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        child: TextButton.icon(
            label: Text('Woolha.com'),
            icon: Icon(Icons.web),
            onPressed: () {
              print('Pressed');
            }));
  }

  Widget titleListOfBreads(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.62,
      //height: MediaQuery.of(context).size.height * 0.35,
      left: MediaQuery.of(context).size.width * 0.03,
      right: MediaQuery.of(context).size.width * 0.03,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pães',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Ativar no cardápio',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  //fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
    */
}
