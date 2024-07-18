part of 'fetch_newest_books_cubit.dart';

@immutable
sealed class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}
final class FetchNewestBooksLoading extends FetchNewestBooksState {}
final class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errMessage;
  FetchNewestBooksFailure(this.errMessage);
}
final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<bookEntitiy> books;
  FetchNewestBooksSuccess(this.books);
}
