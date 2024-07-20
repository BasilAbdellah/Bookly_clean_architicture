import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void SaveBooksData(List<bookEntitiy> books , String BoxName) {
  var box=Hive.box<bookEntitiy>(BoxName);
  box.addAll(books);
}
