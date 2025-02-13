import 'package:clean_arch_bookly_app/core/helpers/extentions.dart';
import 'package:clean_arch_bookly_app/core/routing/routes_names.dart';
import 'package:clean_arch_bookly_app/core/shared_widgets/book_image_conrainer.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.bookDetailsView,
                  arguments: books[index],
                );
              },
              child: BookImageContainer(image: books[index].image!),
            ),
          );
        },
      ),
    );
  }
}
