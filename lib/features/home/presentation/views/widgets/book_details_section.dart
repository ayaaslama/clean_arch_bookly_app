import 'package:clean_arch_bookly_app/core/helpers/spacing.dart';
import 'package:clean_arch_bookly_app/core/shared_widgets/book_image_conrainer.dart';
import 'package:clean_arch_bookly_app/core/theming/text_styles.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_page_count.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: BookImageContainer(image: ''),
        ),
        verticalSpace(40),
        Text(
          "title",
          style: AppTextStyles.textStyle30Normal.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(6),
        Opacity(
          opacity: 0.7,
          child: Text(
            "book.authorName![0]",
            style: AppTextStyles.textStyle18SemiBold.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        verticalSpace(18),
        BookPageCount(
          mainAxisAlignment: MainAxisAlignment.center,
          pageCount: 120,
        ),
        verticalSpace(37),
        BooksAction(),
      ],
    );
  }
}
