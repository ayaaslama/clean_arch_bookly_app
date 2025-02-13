import 'package:clean_arch_bookly_app/core/networking/failure.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/search_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImpl({
    required this.searchRemoteDataSource,
    required this.searchLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
  }) async {
    try {
      List<BookEntity> books;

      books = searchLocalDataSource.fetchSearchBooks(query: query);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await searchRemoteDataSource.fetchSearchBooks(query: query);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
