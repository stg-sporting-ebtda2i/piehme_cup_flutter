
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:piehme_cup_flutter/dialogs/toast_error.dart';

class Loading {
  static Future<void> show(Function load, {String message = 'Loading...', Duration delay = const Duration(milliseconds: 1000)}) async {
    bool done = false;

    Future.delayed(delay, () {
      if (!EasyLoading.isShow && !done) {
        EasyLoading.show(status: message);
      }
    });

    try {
      await load();
    }catch(e) {
      toast(e.toString());
    }
    done = true;

    EasyLoading.dismiss(animation: true);
  }
}