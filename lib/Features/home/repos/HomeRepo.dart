import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/core/Errors/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<bookEntitiy>>> fetchFeaturedBooks();
  Future<Either<Failure,List<bookEntitiy>>> fetchNewestBooks();
}