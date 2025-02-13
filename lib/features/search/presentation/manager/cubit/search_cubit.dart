import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  SearchRepo searchRepo;

  Future<void> fetchSearchResults({required String query}) async {
    emit(SearchLoading());

    var booksResult = await searchRepo.searchBooks(query: query);
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
