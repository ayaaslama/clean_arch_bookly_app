import 'package:clean_arch_bookly_app/core/helpers/functions/build_error_snack_bar.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViewBlocBuilder extends StatefulWidget {
  const SimilarBooksListViewBlocBuilder({super.key});

  @override
  State<SimilarBooksListViewBlocBuilder> createState() =>
      _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState
    extends State<SimilarBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          setState(() {
            books.addAll(state.books);
          });
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListview(books: books);
        } else if (state is SimilarBooksFailure) {
          return buildErrorWidget(state.errMessage);
        } else {
          return Column(
            children: List.generate(10, (index) {
              return const CustomBookImageLoadingIndicator();
            }),
          );
        }
      },
    );
  }
}
