import 'package:clean_arch_bookly_app/core/helpers/constants.dart';
import 'package:clean_arch_bookly_app/core/helpers/functions/save_books.dart';
import 'package:clean_arch_bookly_app/core/networking/api_constants.dart';
import 'package:clean_arch_bookly_app/core/networking/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchBooks({required String query});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchBooks({required String query}) async {
    var data = await apiService.get(
      endPoint: ApiConstants.searchBooksEndpoint(query),
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSimilarBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
