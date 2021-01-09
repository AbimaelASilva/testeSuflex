import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testeSuflex/modules/product/productAddOrEditView.dart';
import 'package:testeSuflex/modules/product/productModel.dart';
import 'package:testeSuflex/modules/product/productRepository.dart';

class HomePageView extends StatefulWidget {
  // HomePageView({Key key, this.title}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  ProductRepository productRepository = ProductRepository();
  // List<ProductModel> productLis;
  StreamController _streamController = StreamController<List<ProductModel>>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProducts();

    setState(() {
      const oneSecond = const Duration(seconds: 2);
      new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    });
  }

  Future loadProducts() async {
    // _streamController = StreamController<List<ProductModel>>();
    List<ProductModel> productLis = await productRepository.consultAllProduct();

    _streamController.add(productLis);
    print('MUUUUITO bem!');
    refreshHome();
  }

  Future<void> refreshHome() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          myAppBar(context),
          storeImage(context),
          storeDescription(context),
          storeRatings(context),
          addButton(context),
          titleListOfBreads(context),
          productsList(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToSubPage(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: myBottomNavigationBar(context),
    );
  }

  Widget myAppBar(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.0350,
      height: MediaQuery.of(context).size.height * 0.18,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.red,
        //height: MediaQuery.of(context).size.height * 3,
        //width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: null),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'FlexStore',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.mode_edit,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: null),
            ],
          ),
        ),
      ),
    );
  }

  Widget storeImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.15,
      height: MediaQuery.of(context).size.height * 0.18,
      left: MediaQuery.of(context).size.width * 0.35,
      right: MediaQuery.of(context).size.width * 0.35,
      child: Container(
          width: 190.0,
          height: 190.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      'https://www.hypeness.com.br/1/2017/07/CursoPao4.jpg')))),
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
      child: FloatingActionButton.extended(
        heroTag: "btn1",
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        icon: Icon(Icons.add),
        label: Text('Adicionar novo produto'),
        onPressed: () {
          navigateToSubPage(context);
        },
      ),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductAddOrEditView()));
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

  Widget productsList(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshHome,
      child: Positioned(
        height: MediaQuery.of(context).size.height * 0.25,
        top: MediaQuery.of(context).size.height * 0.67,
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03,
        //bottom: MediaQuery.of(context).size.height * 0.01,
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder<List<ProductModel>>(
                    stream: _streamController.stream,
                    builder: (context,
                        AsyncSnapshot<List<ProductModel>> snapshotProductList) {
                      if (snapshotProductList.hasError) {
                        return Center(
                          child: Text('Erro ao buscar os produtos!'),
                        );
                      }
                      if (!snapshotProductList.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<ProductModel> products = [];
                      products.clear();
                      products = snapshotProductList.data;
                      return ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: snapshotProductList.data.length != null
                              ? products.length
                              : 0,
                          itemBuilder: (context, int index) {
                            ProductModel product = products[index];

                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                deleteProduct(context, index, product);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(2.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0,
                                                          right: 8.0,
                                                          top: 4.0,
                                                          bottom: 4.0),
                                                  child: Text(
                                                    'Novo produto cadastrado!',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 6.0,
                                                ),
                                                child: Text(
                                                  '${product.title}',
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: Text(
                                                  '${product.description}',
                                                  style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 6.0,
                                                ),
                                                child: Text(
                                                  '${product.price}',
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Transform.scale(
                                                  scale: 1.5,
                                                  child: Switch(
                                                    value: isSwitched,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isSwitched = value;
                                                      });
                                                    },
                                                    activeTrackColor:
                                                        Colors.lightGreenAccent,
                                                    activeColor: Colors.orange,
                                                  ),
                                                ),
                                                Transform.scale(
                                                  scale: 1.5,
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.red,
                                                    //size: 30,
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }))
          ],
        ),
      ),
    );
  }

  deleteProduct(context, index, product) {
    
    productRepository
        .deleteProduct(ProductModel(id: product.id))
        .then((value) => {Scaffold.of(context).showSnackBar(mySnackBar())});
  }

  Widget mySnackBar() {
    return SnackBar(
      content: Text('Muito bem, o produto foi DELETADO com sucesso!'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          // código para desfazer a ação!
        },
      ),
    );
    // Encontra o Scaffold na árvore de widgets
    // e o usa para exibir o SnackBar!
  }

//controle do Switch
  bool isSwitched = true;

  Widget myBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Loja'),
        BottomNavigationBarItem(
            icon: Icon(Icons.description), label: 'Pedidos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: 'Receitas'),
      ],
    );
  }
}
