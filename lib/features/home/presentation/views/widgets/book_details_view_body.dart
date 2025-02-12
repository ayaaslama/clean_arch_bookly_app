import 'package:clean_arch_bookly_app/core/helpers/spacing.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(book: book),
                Expanded(child: verticalSpace(50)),
                SimilarBooksSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
