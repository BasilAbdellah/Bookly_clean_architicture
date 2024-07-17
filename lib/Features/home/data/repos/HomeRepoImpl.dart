import 'package:clean/Features/home/data/DataSource/HomeLocaleDataSource.dart';
import 'package:clean/Features/home/data/DataSource/HomeRemoteDataSource.dart';
import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/Features/home/domain/repos/HomeRepo.dart';
import 'package:clean/core/Errors/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocaleDataSource homeLocaleDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocaleDataSource});

  @override
  Future<Either<Failure, List<bookEntitiy>>> fetchFeaturedBooks() async {
    try {
      List<bookEntitiy> books;
     books = homeLocaleDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
       books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(e.toString()));


    }
  }

  @override
  Future<Either<Failure, List<bookEntitiy>>> fetchNewestBooks() async{
    try {
      List<bookEntitiy> books;
      books = homeLocaleDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(e.toString()));


    }
  }
}
