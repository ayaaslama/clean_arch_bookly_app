import 'package:clean_arch_bookly_app/core/networking/failure.dart';
import 'package:clean_arch_bookly_app/core/use_cases/use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBooksUseCase extends UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;

  FetchSearchBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(String params) async {
    return await searchRepo.searchBooks(query: params);
  }
}
