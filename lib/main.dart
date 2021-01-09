import 'package:flutter/material.dart';
import 'package:testeSuflex/modules/homePage/homePageView.dart';
import 'package:testeSuflex/modules/product/productAddOrEditView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageView(),
    );
  }
}
