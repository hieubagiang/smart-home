import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home_mobile/app/presentation/utils/icons.dart';
import 'package:smart_home_mobile/app/presentation/utils/space.dart';

class EmptyDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            IconUtils.emptyDataIcon,
            width: HeightUtils.iconSize,
            height: HeightUtils.iconSize,
          ),
          SizedBox(height: SpaceUtils.spaceMedium),
          Text('empty_data'.tr),
        ],
      ),
    );
  }
}
