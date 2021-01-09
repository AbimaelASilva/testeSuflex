class ProductModel {
  int id;
  String title;
  String category;
  String description;
  double price;
  int discount;
  String imagePath;
  String creationDate;
  String dateLastChange;
  bool isANewProduct;

  ProductModel(
      {this.id,
      this.title,
      this.category,
      this.description,
      this.price,
      this.discount,
      this.imagePath,
      this.creationDate,
      this.dateLastChange,
      this.isANewProduct});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      discount: json['discount'],
      imagePath: json['imagePath'],
      creationDate: json['creationDate'],
      dateLastChange: json['dateLastChange'],
      isANewProduct: json['isANewProduct'],
    );
  }

/*
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    imagePath = json['imagePath'];
    creationDate = json['creationDate'];
    dateLastChange = json['dateLastChange'];
  }
  */

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['imagePath'] = this.imagePath;
    data['creationDate'] = this.creationDate;
    data['dateLastChange'] = this.dateLastChange;
    data['isANewProduct'] = this.isANewProduct;
    return data;
  }
}
