import 'package:clean/Features/home/data/DataSource/HomeLocaleDataSource.dart';
import 'package:clean/Features/home/data/DataSource/HomeRemoteDataSource.dart';
import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/Features/home/domain/repos/HomeRepo.dart';
import 'package:clean/core/Errors/Failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocaleDataSource homeLocaleDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocaleDataSource});

  @override
  Future<Either<Failure, List<bookEntitiy>>> fetchFeaturedBooks() async {
    try {
      var booksList = homeLocaleDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<bookEntitiy>>> fetchNewestBooks() async{
    try {
      var booksList = homeLocaleDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
