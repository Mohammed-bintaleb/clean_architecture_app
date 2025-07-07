part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksPaginationFailure(this.errMessage);
}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;
  FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}
