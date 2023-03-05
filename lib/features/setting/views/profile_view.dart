import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/background_widget.dart';

import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/preson.jpg'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.offWhite,
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  text: 'Hassan Marzouk',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.offWhite,
                  ),
                  width: screenSize(context).width,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 60,
                        padding: const EdgeInsetsDirectional.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/car.PNG'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: 'Hassan Marzouk',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            CustomTextWidget(
                              text: 'Red|Mercedes',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                CustomButton(
                  function: () {},
                  text: 'Add Car ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
