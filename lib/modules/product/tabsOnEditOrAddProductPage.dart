import 'package:flutter/material.dart';
import 'package:testeSuflex/modules/product/productModel.dart';
import 'package:testeSuflex/modules/product/productRepository.dart';

class TabBarControllerWidget extends StatefulWidget {
  const TabBarControllerWidget({Key key}) : super(key: key);
  @override
  _TabBarControllerWidgetState createState() => _TabBarControllerWidgetState();
}

class _TabBarControllerWidgetState extends State<TabBarControllerWidget>
    with SingleTickerProviderStateMixin {
  // Listas das Tabs
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Informações do Produto',
    ),
    Tab(
      text: 'Ingredientes',
    ),
    Tab(text: 'Rendimento'),
  ];
// controller object
  TabController _tabController;

  //Controllers TextInpus
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productPriceController =
      TextEditingController(text: '0.0');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool myResizeToAvoidBottomInset = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Scaffold(
          resizeToAvoidBottomInset: myResizeToAvoidBottomInset,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              // backgroundColor: Colors.grey[100],
              bottom: TabBar(
                controller: _tabController,
                tabs: myTabs,
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: myTabs.map((Tab tab) {
              final String label = tab.text.toLowerCase();
              return Container(
                  //color: Colors.green,
                  child: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleProduct(context),
                    inputProductTitle(context),
                    titleCategory(context),
                    inputProductCategory(context),
                    titleProductDescription(context),
                    inputProductDescription(context),
                    priceTitle(context),
                    priceAndDiscountRow(context),
                    updateInformationsButton(context),
                  ],
                ),
              ));
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget titleProduct(BuildContext context) {
    return Text('Título');
  }

  Widget inputProductTitle(BuildContext context) {
    return modelInputInformations(context, 'title', productTitleController);
  }

  Widget titleCategory(BuildContext context) {
    return Text('Categoria do Produto');
  }

  Widget inputProductCategory(BuildContext context) {
    return modelInputInformations(
        context, 'category', productCategoryController);
  }

  Widget titleProductDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text('Descrição do Produto'),
    );
  }

  Widget inputProductDescription(BuildContext context) {
    return modelInputInformations(
        context, 'description', productDescriptionController);
  }

  Widget priceTitle(BuildContext context) {
    return Text('Preço');
  }

  Widget priceAndDiscountRow(BuildContext context) {
    return Row(
      children: [
        inputProductPrice(context),
        SizedBox(
          width: 5,
        ),
        discountButtonOnProduct(context),
      ],
    );
  }

  Widget inputProductPrice(BuildContext context) {
    return modelInputInformations(context, 'price', productPriceController);
  }

  Widget discountButtonOnProduct(BuildContext context) {
    return Expanded(
        child: OutlinedButton(
      onPressed: () {
        // Respond to button press
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.085,
          child: Center(child: Text('Aplicar Desconto'))),
    ));
  }

  Widget updateInformationsButton(BuildContext context) {
    ProductRepository productRepository = ProductRepository();

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            heroTag: "btn2",
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            label: Container(
                width: MediaQuery.of(context).size.width * 0.84,
                child: Center(child: Text('Atualizar Informações'))),
            onPressed: () async {
              productRepository
                  .saveNewProduct(ProductModel(
                    title: productTitleController.text,
                    category: productCategoryController.text,
                    description: productDescriptionController.text,
                    price: double.parse(productPriceController.text),
                    discount: 9,
                    imagePath: '',
                    creationDate: '',
                    dateLastChange: '',
                    isANewProduct: true,
                  ))
                  .then((value) => {
                        Scaffold.of(context).showSnackBar(mySnackBar()),
                        productTitleController.text = '',
                        productCategoryController.text = '',
                        productDescriptionController.text = '',
                        productPriceController.text = '',
                      });
            },
          ),
        ],
      ),
    );
  }

  Widget mySnackBar() {
    return SnackBar(
      content: Text('Muito bem, o produto foi salvo com sucesso!'),
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

  Widget modelInputInformations(
    BuildContext context,
    String comingFrom,
    TextEditingController thisController,
  ) {
    return Expanded(
      child: TextFormField(
        controller: thisController,
        maxLength: comingFrom == 'price'
            ? null
            : comingFrom == 'description'
                ? 500
                : 55,
        // maxLines: comingFrom == 'description' ? 3 : 1,
        keyboardType:
            comingFrom == 'price' ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          prefix: comingFrom == 'price'
              ? Text(
                  'R\$',
                  style: TextStyle(color: Colors.grey[500]),
                )
              : null,
          prefixIcon: comingFrom == 'price'
              ? Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                )
              : null,
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
}
