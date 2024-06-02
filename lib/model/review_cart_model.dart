// ignore_for_file: prefer_typing_uninitialized_variables

class ReviewCartModel {
  String cartName;
  String cartImage;
  String cartId;
  int cartPrice;
  int cartQty;
  var cartUnit;
  ReviewCartModel({
    required this.cartUnit,
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQty,
  });
}
