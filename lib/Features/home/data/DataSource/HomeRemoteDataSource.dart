import 'package:clean/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<bookEntitiy>> fetchFeaturedBooks();
  Future<List<bookEntitiy>> fetchNewestBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  @override
  Future<List<bookEntitiy>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  Future<List<bookEntitiy>> fetchNewestBooks() {
    throw UnimplementedError();
  }

}