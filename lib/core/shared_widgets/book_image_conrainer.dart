import 'package:clean_arch_bookly_app/core/helpers/assets.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImageContainer extends StatelessWidget {
  const BookImageContainer({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image.isNotEmpty ? image : AssetsData.bookImage,
          placeholder:
              (context, url) =>
                  const Center(child: CustomBookImageLoadingIndicator()),
          errorWidget:
              (context, url, error) => Image.asset(AssetsData.bookImage),
        ),
      ),
    );
  }
}
