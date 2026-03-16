import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnboardingControls extends StatelessWidget {
  const OnboardingControls({
    super.key,
    required this.controller,
    required this.selectedPage,
    required this.pagesLength,
  });

  final PageController controller;
  final int selectedPage;
  final int pagesLength;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    if (selectedPage == pagesLength) {
      return const SizedBox.shrink();
    }

    return Positioned(
      bottom: 50,
      child: SizedBox(
        height: 50,
        width: ScreenUtil().screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              selectedPage == 0
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          selectedPage - 1,
                          duration: const Duration(microseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Icon(
                        Icons.arrow_circle_left,
                        color: appColors.addressBlockTitle,
                        size: 30,
                      ),
                    ),
              SizedBox(
                height: 100,
                width: 100,
                child: PageViewDotIndicator(
                  currentItem: selectedPage,
                  count: pagesLength + 1,
                  unselectedColor: appColors.onboardingDotUnselected,
                  selectedColor: appColors.addressBlockTitle,
                  duration: const Duration(microseconds: 200),
                  onItemClicked: (index) {
                    controller.animateToPage(
                      index,
                      duration: const Duration(microseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              selectedPage == pagesLength
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          selectedPage + 1,
                          duration: const Duration(microseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Icon(
                        Icons.arrow_circle_right,
                        color: appColors.addressBlockTitle,
                        size: 30,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
