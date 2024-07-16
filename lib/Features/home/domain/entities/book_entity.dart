import 'package:flutter/widgets.dart';

class bookEntitiy{
  final String? bookId;
  final String? Image;
  final String? title;
  final String? authorName;
  final num? price;
  final num? rating;

  bookEntitiy({@required this.bookId,@required this.Image, @required this.title, @required this.authorName, @required this.price, @required this.rating});

}