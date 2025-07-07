import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/fetch_feature_books_use_case.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeatureBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeatureBooksUseCase fetchFeatureBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeatureBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
