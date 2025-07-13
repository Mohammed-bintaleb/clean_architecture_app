import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0});

  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {int pageNumber = 0});
}
