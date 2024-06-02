class WishlistModel {
  String productName;
  String productId;
  String productImage;
  int productPrice;
  var productUnit;
  WishlistModel({
    required this.productUnit,
    required this.productName,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });
}
