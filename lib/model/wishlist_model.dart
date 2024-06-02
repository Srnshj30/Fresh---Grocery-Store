class WishlistModel {
  String productName;
  String productId;
  String productImage;
  int productPrice;
  // ignore: prefer_typing_uninitialized_variables
  var productUnit;
  WishlistModel({
    required this.productUnit,
    required this.productName,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });
}
