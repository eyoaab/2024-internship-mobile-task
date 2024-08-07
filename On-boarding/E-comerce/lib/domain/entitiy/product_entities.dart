import 'package:equatable/equatable.dart';

class ProductEnities extends Equatable{
  const ProductEnities ({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price
  });
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  
  @override
  List<Object?> get props => [
    id,
    name,
    description,
    imageUrl,
    price,
  ];

}