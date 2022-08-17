import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import '../assets/app_assets.dart';

class AppImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const AppImageWidget(
      {Key? key, required this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:imageUrl,
      height: height ?? 150.0,
      width: width ?? MediaQuery.of(context).size.width - 32,
      placeholder: (context, url) => Lottie.asset(AppAssets.loadingAnimation,
          width: 100, height: 100, fit: BoxFit.fill),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );

    // return  CachedNetworkImage(
    //   imageUrl: imageUrl,
    //   imageBuilder: (context, imageProvider) => Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //           image: imageProvider,
    //           fit: BoxFit.cover,
    //           colorFilter: const ColorFilter.mode(
    //               AppColors.imageFilterColor,
    //               BlendMode.colorBurn)),
    //     ),
    //   ),
    //   placeholder: (context, url) =>
    //   const CircularProgressIndicator(),
    //   errorWidget: (context, url, error) =>
    //   const Icon(Icons.error),
    // );
  }
}
