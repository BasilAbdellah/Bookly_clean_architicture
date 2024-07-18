part of 'fetch_featured_books_cubit.dart';

@immutable
sealed class FetchFeaturedBooksState {}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errMessage;

  FetchFeaturedBooksFailure(this.errMessage);
}
 final class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<bookEntitiy> books;

  FetchFeaturedBooksSuccess(this.books);
}
