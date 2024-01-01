class Cart {
  late final int id;
  final String? productid;
  final String? productname;
  final int? productprice;
  final int? initalprice;
  final int? quantity;
  final String? image;

  Cart({
    required this.id,
    required this.productid,
    required this.productname,
    required this.productprice,
    required this.initalprice,
    required this.quantity,
    required this.image,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productid = res["prodductid"],
        productname = res["productname"],
        productprice = res["productprice"],
        initalprice = res["initialprice"],
        quantity = res["quantity"],
        image = res["image"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productid': productid,
      'productname': productname,
      'productprice': productprice,
      'initialprice': initalprice,
      'quantity': quantity,
      'image': image,
    };
  }
}
