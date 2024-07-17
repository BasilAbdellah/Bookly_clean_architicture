import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocaleDataSource {
  List<bookEntitiy> fetchFeaturedBooks();
  List<bookEntitiy> fetchNewestBooks();
}

class HomeLocaleDataSourceImpl extends  HomeLocaleDataSource{
  @override
  List<bookEntitiy> fetchFeaturedBooks() {
    var box = Hive.box<bookEntitiy>(KFeaturedBox);
    return box.values.toList();
  }

  @override
  List<bookEntitiy> fetchNewestBooks() {
    var box = Hive.box<bookEntitiy>(KNewestBox);
    return box.values.toList();  }

}