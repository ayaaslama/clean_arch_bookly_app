import 'package:clean_arch_bookly_app/core/di/dependency_injection.dart';
import 'package:clean_arch_bookly_app/core/helpers/bloc_observer.dart';
import 'package:clean_arch_bookly_app/core/helpers/constants.dart';
import 'package:clean_arch_bookly_app/core/routing/app_router.dart';
import 'package:clean_arch_bookly_app/core/routing/routes_names.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(BookEntityAdapter());
  setupGetIt();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  runApp(BooklyApp(appRouter: AppRouter()));
}

class BooklyApp extends StatelessWidget {
  final AppRouter appRouter;

  const BooklyApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            ),
          ),
          initialRoute: Routes.splashView,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
