import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';

import '../../../../core/utils/functions/save_books.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=subject:Programming&startIndex=${pageNumber * 10}");

    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeatureBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming&startIndex=${pageNumber * 10}");

    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSimilarBooksBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
