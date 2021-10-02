import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_mobile/app/common/constants/colors_constant.dart';
import 'package:smart_home_mobile/app/common/utils/utils.dart';

class RadioWiget extends StatelessWidget {
  const RadioWiget(
      {Key? key,
      this.text = "",
      required this.groupValue,
      required this.value,
      this.onChanged})
      : super(key: key);
  final String text;
  final dynamic groupValue;
  final dynamic value;
  final Function(dynamic value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Theme(
              data: ThemeData(
                unselectedWidgetColor: ColorUtils.activeColor,
              ),
              child: Radio<int>(
                activeColor: ColorUtils.activeColor,
                value: value,
                groupValue: groupValue,
                onChanged: (value) {
                  if (onChanged != null) {
                    onChanged!(value);
                  }
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: SpaceUtils.spaceSmall),
            child: Text(
              text,
              style:
                  StyleUtils.style16Thin.copyWith(color: ColorUtils.labelColor),
            ),
          ),
        ],
      ),
    );
  }
}
