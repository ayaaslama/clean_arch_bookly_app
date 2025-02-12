import 'package:clean_arch_bookly_app/core/helpers/assets.dart';
import 'package:clean_arch_bookly_app/core/helpers/extentions.dart';
import 'package:clean_arch_bookly_app/core/routing/routes_names.dart';
import 'package:clean_arch_bookly_app/core/shared_widgets/book_image_conrainer.dart';
import 'package:clean_arch_bookly_app/core/shared_widgets/infinite_scroll_mixin.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView>
    with InfiniteScrollMixin {
  @override
  Future<void> loadMoreItems(BuildContext context) async {
    await BlocProvider.of<FeaturedBooksCubit>(
      context,
    ).fetchFeaturedBooks(pageNumber: nextPage++);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.bookDetailsView,
                  arguments: widget.books[index],
                );
              },
              child: BookImageContainer(
                image: widget.books[index].image ?? AssetsData.bookImage,
              ),
            ),
          );
        },
      ),
    );
  }
}
