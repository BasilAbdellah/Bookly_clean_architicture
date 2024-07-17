import 'package:clean/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocaleDataSource {
  List<bookEntitiy> fetchFeaturedBooks();
  List<bookEntitiy> fetchNewestBooks();
}

class HomeLocaleDataSourceImpl extends  HomeLocaleDataSource{
  @override
  List<bookEntitiy> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  List<bookEntitiy> fetchNewestBooks() {
    throw UnimplementedError();
  }

}