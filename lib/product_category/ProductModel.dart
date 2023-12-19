class ProductModel {
  Category? category;

  ProductModel({this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['Category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  String? imageBackgroundColor;
  String? textColor;
  int? fontSize;
  int? imageRadius;
  String? viewBackgroundColor;
  bool? allVisible;
  String? linkType;
  List<Items>? items;

  Category(
      {this.imageBackgroundColor,
      this.textColor,
      this.fontSize,
      this.imageRadius,
      this.viewBackgroundColor,
      this.allVisible,
      this.linkType,
      this.items});

  Category.fromJson(Map<String, dynamic> json) {
    imageBackgroundColor = json['ImageBackgroundColor'];
    textColor = json['TextColor'];
    fontSize = json['FontSize'];
    imageRadius = json['ImageRadius'];
    viewBackgroundColor = json['ViewBackgroundColor'];
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
  int? price;

  Items({this.imageLink, this.linkHandle, this.linkId, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    imageLink = json['ImageLink'];
    linkHandle = json['LinkHandle'];
    linkId = json['LinkId'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageLink'] = this.imageLink;
    data['LinkHandle'] = this.linkHandle;
    data['LinkId'] = this.linkId;
    data['Price'] = this.price;
    return data;
  }
}