import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String image;
  final String name;
  final int star;
  final int price;
  final List nutrition;
  const ProductModel({
    required this.id,
    required this.name,
    required this.nutrition,
    required this.price,
    required this.image,
    required this.star,
  });
  factory ProductModel.fromJson(Map json) => ProductModel(
        name: json['name'],
        nutrition: json['nutrition'] ?? [],
        price: json['price'],
        image: json['image'],
        star: json['star'],
        id: json['id'],
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'nutrition': nutrition,
      'star': star,
    };
  }

  @override
  List<Object?> get props => [id, name, image, price, nutrition, star];
}
