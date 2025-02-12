import 'package:clean_arch_bookly_app/core/helpers/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle textStyle18SemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle20Normal = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle30Normal = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.normal,
    fontFamily: AssetsData.kGtSectraFine,
  );
  static TextStyle textStyle14Normal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
}
