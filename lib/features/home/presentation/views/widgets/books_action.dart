import 'package:clean_arch_bookly_app/core/helpers/launch_url.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              text: 'Free',
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomURL(context, "book.previewLink");
              },
              backgroundColor: Color(0xffEF8262),
              text: "getText()",
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookEntity book) {
    if (book.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
