import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeatureBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks() {
    //* check permssion
    return homeRepo.fetchFeatureBooks();
  }
}
