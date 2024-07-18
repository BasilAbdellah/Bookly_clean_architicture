import 'package:bloc/bloc.dart';
import 'package:clean/Features/home/domain/UseCases/FetchFeaturedBooksUseCase.dart';
import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.featuredBooksUseCase) : super(FetchFeaturedBooksInitial());
final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks()async{
    emit(FetchFeaturedBooksLoading());
    var response = await featuredBooksUseCase.call();
    response.fold((failure) {
      emit(FetchFeaturedBooksFailure(failure.message));
    }, (books) {
    emit(FetchFeaturedBooksSuccess(books));
    },);
}
}
