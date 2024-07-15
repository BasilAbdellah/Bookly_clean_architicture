import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/Features/home/domain/repos/HomeRepo.dart';
import 'package:clean/core/Errors/Failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooks{
  final HomeRepo homeRepo;
  FetchFeaturedBooks( this.homeRepo);

  Future<Either<Failure,List<bookEntitiy>>> fetchFeaturedBooks(){
    return homeRepo.fetchFeaturedBooks();
  }
}