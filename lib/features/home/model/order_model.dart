import 'product_model.dart';

class OrderModel {
  final int quantity;
  final ProductModel productModel;
  const OrderModel({
    required this.quantity,
    required this.productModel,
  });
  factory OrderModel.fromJson(Map<String,dynamic> json) => OrderModel(
        quantity: json['quantity'],
        productModel: json['productModel'],
      );
  Map<String, dynamic> toJson() {
    return {'quantity': quantity, 'productModel': productModel};
  }
}
