import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks() {
    // TODO: implement fetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
