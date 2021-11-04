
class CartModel{
  String imageUrl;
  String categoryName;
  String amount;

  CartModel({this.imageUrl, this.categoryName, this.amount});

  CartModel.fromJson(Map<String, dynamic> json){
     CartModel(
      imageUrl: json['imageUrl'],
      categoryName: json['cat'],
      amount: json['amount']
    );
  }
}