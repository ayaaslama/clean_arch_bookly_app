import 'package:clean_arch_bookly_app/core/helpers/assets.dart';
import 'package:clean_arch_bookly_app/core/helpers/extentions.dart';
import 'package:clean_arch_bookly_app/core/helpers/spacing.dart';
import 'package:clean_arch_bookly_app/core/shared_widgets/book_image_conrainer.dart';
import 'package:clean_arch_bookly_app/core/theming/text_styles.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_page_count.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_published_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes_names.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.bookDetailsView, arguments: book);
      },
      child: SizedBox(
        height: 120.h,
        child: Row(
          children: [
            BookImageContainer(image: book.image!),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      style: AppTextStyles.textStyle20Normal.copyWith(
                        fontFamily: AssetsData.kGtSectraFine,
                      ),
                    ),
                  ),
                  verticalSpace(10),
                  Text(
                    book.authorName!,
                    maxLines: 1,
                    style: AppTextStyles.textStyle14Normal,
                  ),
                  verticalSpace(3),
                  Row(
                    children: [
                      BookPageCount(pageCount: book.pageCount!),
                      Spacer(),
                      BookPublishedDate(book: book),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
