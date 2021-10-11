import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/constants/colors_constant.dart';
import 'package:smart_home/app/common/constants/constants.dart';
import 'package:smart_home/app/common/utils/utils.dart';

class DescriptionConstant {
  static const int EXPAND_TEXT_ANIMATION_LENGTH = 200;
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  bool _isExpanded = false;
  bool _enableExpanded = false;

  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > ConstantsUtils.DESCRIPTION_MAX_LENGTH) {
      firstHalf =
          widget.text.substring(0, ConstantsUtils.DESCRIPTION_MAX_LENGTH);
      secondHalf = widget.text
          .substring(ConstantsUtils.DESCRIPTION_MAX_LENGTH, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    _enableExpanded =
        widget.text.length > ConstantsUtils.DESCRIPTION_MAX_LENGTH;
    _isExpanded = !_enableExpanded;
  }

  @override
  Widget build(BuildContext context) {
    if (!_enableExpanded) {
      return _buildExpandedText();
    }
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedCrossFade(
        duration: const Duration(
            milliseconds: DescriptionConstant.EXPAND_TEXT_ANIMATION_LENGTH),
        crossFadeState:
            !_isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: _buildCollapsedText(),
        secondChild: _buildExpandedText(),
      ),
    );
  }

  Widget _buildExpandedText() {
    return Text(
      widget.text,
      style: StyleUtils.style16Thin,
    );
  }

  Widget _buildCollapsedText() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: firstHalf,
            style: StyleUtils.style16Thin,
          ),
          TextSpan(
            text: '...' + 'show_more'.tr,
            style: StyleUtils.style16Bold.copyWith(color: ColorUtils.greyColor),
          ),
        ],
      ),
    );
  }
}
