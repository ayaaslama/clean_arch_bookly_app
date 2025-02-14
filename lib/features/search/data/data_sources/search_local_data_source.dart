import 'package:clean_arch_bookly_app/core/helpers/constants.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchSearchBooks({required String query});
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> fetchSearchBooks({required String query}) {
    var box = Hive.box<BookEntity>(kSearchBox);
    return box.values.toList();
  }
}
