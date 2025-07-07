import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRrpoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRrpoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeatureBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeatureBooks();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left((ServerFailure.fromDioError(e)));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left((ServerFailure.fromDioError(e)));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
