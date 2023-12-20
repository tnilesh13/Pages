class ProductModel {
  Product? product;

  ProductModel({this.product});

  ProductModel.fromJson(Map<String, dynamic> json) {
    product = json['Product'] != null
        ? new Product.fromJson(json['Product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['Product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? imageBackgroundColor;
  String? textColor;
  double? fontSize;
  double? imageRadius;
  String? viewBackgroundColor;
  String? containerBackgroundColor;
  bool? allVisible;
  String? linkType;
  List<Items>? items;

  Product(
      {this.imageBackgroundColor,
      this.textColor,
      this.fontSize,
      this.imageRadius,
      this.viewBackgroundColor,
      this.containerBackgroundColor,
      this.allVisible,
      this.linkType,
      this.items});

  Product.fromJson(Map<String, dynamic> json) {
    imageBackgroundColor = json['ImageBackgroundColor'];
    textColor = json['TextColor'];
    fontSize = json['FontSize'];
    imageRadius = json['ImageRadius'];
    viewBackgroundColor = json['ViewBackgroundColor'];
    containerBackgroundColor = json['ContainerBackgroundColor'];
    allVisible = json['AllVisible'];
    linkType = json['LinkType'];
    if (json['Items'] != null) {
      items = <Items>[];
      json['Items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageBackgroundColor'] = this.imageBackgroundColor;
    data['TextColor'] = this.textColor;
    data['FontSize'] = this.fontSize;
    data['ImageRadius'] = this.imageRadius;
    data['ViewBackgroundColor'] = this.viewBackgroundColor;
    data['ContainerBackgroundColor'] = this.containerBackgroundColor;
    data['AllVisible'] = this.allVisible;
    data['LinkType'] = this.linkType;
    if (this.items != null) {
      data['Items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? imageLink;
  String? linkHandle;
  int? linkId;
  double? price;
  String? titleText;

  Items({this.imageLink, this.linkHandle, this.linkId, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    imageLink = json['ImageLink'];
    linkHandle = json['LinkHandle'];
    linkId = json['LinkId'];
    price = json['Price'];
    titleText = json['TitleText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageLink'] = this.imageLink;
    data['LinkHandle'] = this.linkHandle;
    data['LinkId'] = this.linkId;
    data['Price'] = this.price;
    data['TitleText'] = this.titleText;
    return data;
  }
}