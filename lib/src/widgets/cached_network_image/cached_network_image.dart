// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/app_images.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';


class CachedNetworkImageWidget extends StatelessWidget {
  String imageUrl;

  double? height;
  double? width;
  BoxFit? fit;
  bool? isImgCircular;

  CachedNetworkImageWidget({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.isImgCircular,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isImgCircular == true
          ? BorderRadius.circular(10)
          : BorderRadius.circular(0),
      child: CachedNetworkImage(
        imageUrl: Api.getImageURL(imageUrl),
        height: height == null ? 50 : height,
        width: width == null ? 50 : width,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CustomLoader(color: white, size: 20,),
        ),
        errorWidget: (context, url, error) => Image.asset(
          AppImages.logo,
        ),
      ),
    );
  }
}
