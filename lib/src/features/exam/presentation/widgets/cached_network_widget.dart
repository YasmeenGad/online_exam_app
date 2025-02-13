import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/assets.dart';


class CachedNetworkWidget extends StatelessWidget {
  const CachedNetworkWidget({super.key, required this.imageUrl,  this.height,  this.width});
  final String imageUrl;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height ?? 48,
      width:width ?? 48,
      imageUrl:imageUrl,
     // fit: BoxFit.fill,
      placeholder: (context, url) =>  Lottie.asset(Assets.imagesLoading,fit: BoxFit.fill ,height: 80,width: 80,),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
