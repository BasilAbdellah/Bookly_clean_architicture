import 'package:bloc/bloc.dart';
import 'package:clean/Features/home/domain/UseCases/FetchNewestBooksUseCase.dart';
import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.fetchNewestBooksUseCase) : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async{
    emit(FetchNewestBooksLoading());
    var response = await fetchNewestBooksUseCase.call();
    response.fold((l) {
      emit(FetchNewestBooksFailure(l.message));
    }, (r) {
      emit(FetchNewestBooksSuccess(r));
    },);
  }
}
