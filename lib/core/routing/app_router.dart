import 'package:clean_arch_bookly_app/core/di/dependency_injection.dart';
import 'package:clean_arch_bookly_app/core/routing/routes_names.dart';
import 'package:clean_arch_bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/newset_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/home_view.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/search_view.dart';
import 'package:clean_arch_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.homeView:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) => FeaturedBooksCubit(
                          FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
                        )..fetchFeaturedBooks(),
                  ),
                  BlocProvider(
                    create:
                        (context) => NewestBooksCubit(
                          FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
                        )..fetchNewestBooks(),
                  ),
                ],
                child: const HomeView(),
              ),
        );

      case Routes.bookDetailsView:
        return MaterialPageRoute(builder: (_) => const BookDetailsView());

      case Routes.searchView:
        return MaterialPageRoute(builder: (_) => const SearchView());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
