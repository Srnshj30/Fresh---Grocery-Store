class ReviewCartModel {
  String cartName;
  String cartImage;
  String cartId;
  int cartPrice;
  int cartQty;

  ReviewCartModel({
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQty,
  });
}
