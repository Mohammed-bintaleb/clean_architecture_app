import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRrpoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRrpoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchFeatureBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeatureBooks();

      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();

      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
