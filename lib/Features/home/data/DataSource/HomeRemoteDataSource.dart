import 'package:clean/Features/home/data/models/BookModel.dart';
import 'package:clean/Features/home/data/models/Items.dart';
import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/constants.dart';
import 'package:clean/core/utils/ApiService.dart';
import 'package:clean/core/utils/functions/SaveBooks.dart';

abstract class HomeRemoteDataSource {
  Future<List<bookEntitiy>> fetchFeaturedBooks();
  Future<List<bookEntitiy>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<bookEntitiy>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming");
    List<bookEntitiy> books = getBooksList(data);
    SaveBooksData(books, KFeaturedBox);
    return books;
  }

  @override
  Future<List<bookEntitiy>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=programming");
    List<bookEntitiy> books = getBooksList(data);
    SaveBooksData(books, KNewestBox);
    return books;
  }

  List<bookEntitiy> getBooksList(Map<String, dynamic> data) {
    List<bookEntitiy> books = [];
    for (var bookMap in data["items"]) {
      books.add(Items.fromJson(bookMap));
    }
    return books;
  }
}
