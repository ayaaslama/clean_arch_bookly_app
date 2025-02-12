import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  for (var book in books) {
    box.add(book);
  }
}
