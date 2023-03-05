import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../widgets/background_widget.dart';

class DoneMessageView extends StatefulWidget {
  final String message;
  final Widget screen;
  const DoneMessageView({super.key,required this.message,required this.screen,});

  @override
  State<DoneMessageView> createState() => _DoneMessageViewState();
}

class _DoneMessageViewState extends State<DoneMessageView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => navigateOff(
        context,
        widget.screen,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/svg/correct.svg'),
                 Text(
                  widget.message,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
