import 'package:fashionapp/common/utils/kcolors.dart';
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
                      child: const Icon(
                        Icons.arrow_circle_left,
                        color: Kolors.kPrimary,
                        size: 30,
                      ),
                    ),
              SizedBox(
                height: 100,
                width: 100,
                child: PageViewDotIndicator(
                  currentItem: selectedPage,
                  count: pagesLength + 1,
                  unselectedColor: Colors.black26,
                  selectedColor: Kolors.kPrimary,
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
                      child: const Icon(
                        Icons.arrow_circle_right,
                        color: Kolors.kPrimary,
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
