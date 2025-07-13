import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> fetchSimilarBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginationLoading());
    }

    var result = await similarBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksFailure(failure.message));
      } else {
        emit(SimilarBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
