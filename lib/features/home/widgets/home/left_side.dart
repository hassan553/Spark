import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/functions/globle_functions.dart';
import 'package:rakna/features/widgets/custom_text.dart';

class LeftSideWidget extends StatelessWidget {
  const LeftSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff373737),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      height: screenSize(context).height * .64,
      width: screenSize(context).width * .4,
      child: LayoutBuilder(
        builder: (context, constrainedBox) {
          print(constrainedBox.maxWidth);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                6,
                (index) => InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(218, 230, 230, 235),
                      borderRadius: BorderRadius.only(
                        topRight: index == 0
                            ? const Radius.circular(10)
                            : const Radius.circular(0),
                        bottomRight: index == 5
                            ? const Radius.circular(10)
                            : const Radius.circular(0),
                      ),
                    ),
                    width: constrainedBox.maxWidth,
                    margin: const EdgeInsets.only(left: 2, bottom: 2, right: 1),
                    height: constrainedBox.maxHeight * .13,
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: CrossFadeState.showFirst,
                      firstChild: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: constrainedBox.maxWidth * .7,
                            height: constrainedBox.maxHeight * .7,
                            color: Colors.red,
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: CustomTextWidget(
                              text: 'Booked',
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      secondChild: CustomTextWidget(
                        text: 'P-02',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          );
        },
      ),
    );
  }
}