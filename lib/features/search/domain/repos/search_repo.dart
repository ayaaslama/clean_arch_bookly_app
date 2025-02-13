import 'package:clean_arch_bookly_app/core/networking/failure.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
  });
}
