import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/features/home/manager/home_cubit.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/background_widget.dart';

import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
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
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(cubit.userModel!.data!.image!),
                        ),
                        InkWell(
                          onTap: () {
                            cubit.chooseImageFromCamera();
                            //_showBottomSheetWidget(context);
                          },
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
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // CustomTextWidget(
                    //   text: cubit.userModel!.data!.name!,
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 20,
                    // ),
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
                                  text: cubit.userModel!.data!.name!,
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
      },
    );
  }

  void _showBottomSheetWidget(BuildContext context) {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: _buildBottomSheet,
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        child: ListView(
          controller: scrollController,
          children: [],
        ),
      ),
    );
  }
}
