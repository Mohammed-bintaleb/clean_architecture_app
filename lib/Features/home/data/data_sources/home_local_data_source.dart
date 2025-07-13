import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kFeatureBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0}) {
    int start = pageNumber * 10;
    int end = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kSimilarBooksBox);
    int length = box.values.length;
    if (length == 0 || start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }
}
