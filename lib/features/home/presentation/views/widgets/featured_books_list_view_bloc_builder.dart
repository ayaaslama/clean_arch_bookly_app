import 'package:clean_arch_bookly_app/core/helpers/functions/build_error_snack_bar.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatuedBooksListViewBlocBuilder extends StatefulWidget {
  const FeatuedBooksListViewBlocBuilder({super.key});

  @override
  State<FeatuedBooksListViewBlocBuilder> createState() =>
      _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState
    extends State<FeatuedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          setState(() {
            books.addAll(state.books);
          });
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildErrorWidget(state.errMessage));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return buildErrorWidget(state.errMessage);
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: const CustomBookImageLoadingIndicator(),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }
}
