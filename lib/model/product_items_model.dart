class ProductItemsModel {
  List<ProductItems>? _productItems;

  ProductItemsModel({List<ProductItems>? productItems}) {
    if (productItems != null) {
      _productItems = productItems;
    }
  }

  List<ProductItems>? get productItems => _productItems;
  set productItems(List<ProductItems>? productItems) => _productItems = productItems;

  ProductItemsModel.fromJson(Map<String, dynamic> json) {
    if (json['product_items'] != null) {
      _productItems = <ProductItems>[];
      json['product_items'].forEach((v) {
        _productItems!.add(ProductItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_productItems != null) {
      data['product_items'] = _productItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductItems {
  int? _id;
  String? _name;
  String? _imageUrl;
  int? _price;

  ProductItems({int? id, String? name, String? imageUrl, int? price}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (imageUrl != null) {
      _imageUrl = imageUrl;
    }
    if (price != null) {
      _price = price;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  int? get price => _price;
  set price(int? price) => _price = price;

  ProductItems.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _imageUrl = json['image_url'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['image_url'] = _imageUrl;
    data['price'] = _price;
    return data;
  }
}
