import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String id;
  final String name;
  final String image;
  final String date;
  final String? description;

  News(
      {required this.id,
      required this.name,
      required this.image,
      required this.date,
      required this.description});

  @override
  List<Object?> get props => [id, name, image, date, description];
}
