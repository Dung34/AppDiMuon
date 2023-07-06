import '../../config/config.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextTheme {
  static const TextStyle textPageTitle = TextStyle(
    color: AppColor.black,
    // overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const TextStyle textGreeting = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 36,
  );

  static const TextStyle textPrimary = TextStyle(
    color: AppColor.black,
    fontWeight: AppConfig.defaultFontWeight,
    fontSize: AppConfig.primaryFontSize,
  );

  static const TextStyle textPrimaryMedium = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle textPrimaryBold = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static const TextStyle textPrimaryBoldMedium = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle textLabelSmall = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );

  static const TextStyle textLabelSmallInactive = TextStyle(
    color: AppColor.fourth700,
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );

  static const TextStyle textAppBarPrimary = TextStyle(
    color: AppColor.white,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );

  static const TextStyle textLowPriority = TextStyle(
    color: Color.fromARGB(255, 184, 182, 182),
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle textHintPrimary = TextStyle(
    color: Color.fromARGB(255, 97, 97, 97),
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle textButtonPrimary = TextStyle(
    color: AppColor.white,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    // overflow: TextOverflow.ellipsis,
  );
  static const TextStyle robotoRegular12 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  static const TextStyle robotoRegular14 = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle robotoRegular16 = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static const TextStyle robotoLight12 = TextStyle(
    color: AppColor.primary400,
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );
  static const TextStyle robotoLight14 = TextStyle(
    color: AppColor.primary400,
    fontWeight: FontWeight.w300,
    fontSize: 14,
  );
  static const TextStyle robotoLight16 = TextStyle(
    color: AppColor.primary400,
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );
  static const TextStyle robotoLight18 = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w300,
    fontSize: 18,
  );
  static const TextStyle robotoLight24 = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w300,
    fontSize: 24,
  );
  static const TextStyle robotoMedium12 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static const TextStyle robotoMedium14 = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static const TextStyle robotoMedium16 = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle robotoMedium18 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle robotoMedium24 = TextStyle(
    color: AppColor.primary500,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );
  static const TextStyle robotoBold16 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static const TextStyle robotoBold18 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static const TextStyle robotoBold20 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static const TextStyle robotoBold24 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );

  static const TextStyle lexendBold16 = TextStyle(
    fontFamily: 'Lexend',
    color: AppColor.primary500,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static const TextStyle lexendBold18 = TextStyle(
    fontFamily: 'Lexend',
    color: AppColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );
  static const TextStyle lexendBold24 = TextStyle(
    fontFamily: 'Lexend',
    color: AppColor.primary500,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static const TextStyle lexendBold30 = TextStyle(
    fontFamily: 'Lexend',
    color: AppColor.secondary500,
    fontWeight: FontWeight.w700,
    fontSize: 30,
  );
}
