import 'package:flutter/material.dart';
import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import 'profile_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/background_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            CustomTextWidget(
              text: 'Settings',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                navigateTo(context, const ProfileView());
              },
              child: Container(
                padding: const EdgeInsetsDirectional.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.offWhite,
                ),
                width: screenSize(context).width,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/preson.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Hassan Marzouk',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        CustomTextWidget(
                          text: 'My Profile',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            CustomButton(
              function: () {},
              text: 'Log Out',
            ),
          ],
        ),
      ),
    );
  }
}
