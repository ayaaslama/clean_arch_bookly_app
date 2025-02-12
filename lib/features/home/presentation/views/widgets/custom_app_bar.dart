import 'package:clean_arch_bookly_app/core/helpers/assets.dart';
import 'package:clean_arch_bookly_app/core/helpers/extentions.dart';
import 'package:clean_arch_bookly_app/core/routing/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 18),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.searchView);
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ],
      ),
    );
  }
}
