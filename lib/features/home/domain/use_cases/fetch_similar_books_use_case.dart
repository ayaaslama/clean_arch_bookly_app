import 'package:clean_arch_bookly_app/core/networking/failure.dart';
import 'package:clean_arch_bookly_app/core/use_cases/use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(String params) async {
    return await homeRepo.fetchSimilarBooks(category: params);
  }
}
