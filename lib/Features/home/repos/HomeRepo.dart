import 'package:clean/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo{
  Future<List<bookEntitiy>> fetchFeaturedBooks();
  Future<List<bookEntitiy>> fetchNewestBooks();
}