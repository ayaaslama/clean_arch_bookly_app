import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/fetch_search_books_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fetchSearchBooksUseCase) : super(SearchInitial());
  final FetchSearchBooksUseCase fetchSearchBooksUseCase;

  Future<void> fetchSearchResults({required String query}) async {
    emit(SearchLoading());
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    var booksResult = await fetchSearchBooksUseCase.call(query);
    booksResult.fold(
      (failure) {
        emit(SearchFailure(failure.errMessage));
      },
      (books) {
        emit(SearchSuccess(books));
      },
    );
  }
}
