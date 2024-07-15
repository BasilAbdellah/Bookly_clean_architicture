import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/Features/home/domain/repos/HomeRepo.dart';
import 'package:clean/core/Errors/Failure.dart';
import 'package:clean/core/UseCases/UseCase.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<bookEntitiy>,NoParam> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<bookEntitiy>>> call([NoParam? param])  async{
    return await homeRepo.fetchFeaturedBooks();
  }


}

