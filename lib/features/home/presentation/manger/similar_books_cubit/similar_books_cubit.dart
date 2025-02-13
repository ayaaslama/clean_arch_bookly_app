import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter/material.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
    : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await fetchSimilarBooksUseCase.call(category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
