import 'package:clean_arch_bookly_app/core/helpers/spacing.dart';
import 'package:clean_arch_bookly_app/core/theming/text_styles.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class BookPublishedDate extends StatelessWidget {
  const BookPublishedDate({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.solidCalendarDays,
            size: 14.sp,
            color: Color(0xffFFDD4f),
          ),
          horizontalSpace(2),
          Text(
            book.publishedDate!,
            style: AppTextStyles.textStyle14Normal.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
