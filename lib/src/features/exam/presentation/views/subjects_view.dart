import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import '../../../../core/styles/app_colors.dart';
import '../widgets/cached_network_widget.dart';
import '../widgets/shadow_container_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                '${AppLocalizations.of(context)?.survey}',
                style: AppStyles.styleMedium20(context)
                    .copyWith(color: AppColors.blueBaseColor),
              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: AppColors.blueBaseColor,
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
              ),
              SizedBox(height: 30),
              Text('${AppLocalizations.of(context)?.browseBySubject}',
                  style: AppStyles.styleMedium18(context)),
              SizedBox(height: 15),

              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20, top: 10),

                  itemBuilder: (context, index) => shadowContainer(
                    height: 80,
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.examView);
                        },
                        leading: CachedNetworkWidget(
                          imageUrl:
                              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-vector%2Fmathematics-concept-illustration_10771389.htm&psig=AOvVaw3Q6ZBpG9bVWQZIYp9rYQp-&ust=1684736474803000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCJjJwJ6J9fMCFQAAAAAdAAAAABAD',
                        ),
                        title: Text(
                          'Mathematics',
                          style: AppStyles.styleRegular16(context),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: 15,
                ),
              )
            ],
          ),
        ));
  }
}
