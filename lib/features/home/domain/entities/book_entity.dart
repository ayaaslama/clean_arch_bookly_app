import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? authorName;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final int? pageCount;
  @HiveField(5)
  final String? publishedDate;
  @HiveField(6)
  final String? previewLink;
  @HiveField(7)
  final String? categories;

  BookEntity({
    required this.bookId,
    required this.title,
    this.authorName,
    this.image,
    this.pageCount,
    this.publishedDate,
    this.previewLink,
    this.categories,
  });
}
