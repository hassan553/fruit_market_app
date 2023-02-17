import 'package:equatable/equatable.dart';
import 'package:fruit_market_app/features/home/model/product_model.dart';

class CollectionModel extends Equatable {
 final  String title;
 final  String subTitle;
 final  int priceOff;
 final  List<dynamic> products;
  const CollectionModel({
     this.priceOff=0,
     this.subTitle='',
     this.title='',
     this.products=const[],
  });
  factory CollectionModel.fromJson(Map json) => CollectionModel(
        priceOff: json['price_off'],
        subTitle: json['sub_title'],
        title: json['title'],
        products: json['products'],
      );
      
        @override
        // TODO: implement props
        List<Object?> get props => [title,subTitle,priceOff,products];
}
