import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../manager/subject/subject_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.cubit});
  final SubjectCubit cubit ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.blueBaseColor,
      controller: cubit.searchController,
      onChanged: (value) {
        cubit.doAction(SubjectActions.SearchByName);
      },
      decoration: InputDecoration(
        hintText: '${AppLocalizations.of(context)?.search}',
        hintStyle: AppStyles.styleRegular14(context)
            .copyWith(color: AppColors.black30Color),
        prefixIcon: Icon(Icons.search),
        prefixIconColor: AppColors.black30Color,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(20),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
