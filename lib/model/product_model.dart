class ProductModel {
  String productImage;
  String productName;
  int productPrice;
  String productAbout;
  String productId;

  ProductModel(
      {required this.productImage,
      required this.productName,
      required this.productId,
      required this.productPrice,
      required this.productAbout});
}
