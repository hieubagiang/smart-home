import 'package:flutter/material.dart';
import 'package:smart_home/app/common/assets/constans.dart';


class AssetImageWidget extends StatelessWidget {
  const AssetImageWidget();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      placeholderAsset,
      fit: BoxFit.cover,
    );
  }
}
