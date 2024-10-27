import 'package:flutter/material.dart';

import '../../../../core/global/custom_appbar.dart';

AppBar examDetailsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.only(top: 10, left: 5),
      child: CustomAppBar(
        appBarTxt: '',
        showArrow: true,
      ),
    ),
    automaticallyImplyLeading: false,
  );
}