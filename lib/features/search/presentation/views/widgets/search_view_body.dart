import 'package:clean_arch_bookly_app/core/helpers/spacing.dart';
import 'package:clean_arch_bookly_app/core/theming/text_styles.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String query = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {
        query = _searchController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: CustomSearchTextField(
                  controller: _searchController,
                  onChanged: (value) {
                    BlocProvider.of<SearchCubit>(
                      context,
                    ).fetchSearchResults(query: value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'Search Result',
                  style: AppTextStyles.textStyle18SemiBold,
                ),
              ),
              verticalSpace(16),
            ],
          ),
        ),
        SearchResultListView(),
      ],
    );
  }
}
