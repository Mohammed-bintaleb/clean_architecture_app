part of 'similar_books_cubit.dart';

class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure(this.errMessage);
}

class SimilarBooksPaginationLoading extends SimilarBooksState {}

class SimilarBooksPaginationFailure extends SimilarBooksState {
  final String errMessage;
  SimilarBooksPaginationFailure(this.errMessage);
}
