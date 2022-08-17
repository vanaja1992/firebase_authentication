import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_colors.dart';

class PopupMessageToast{
  static showMessageToast(String errorMessage){
  return
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.messageToastColor,
        textColor: AppColors.backgroundColor,
        fontSize: 16.0);
  }
}