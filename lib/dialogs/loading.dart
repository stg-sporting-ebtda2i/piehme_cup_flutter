
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:piehme_cup_flutter/dialogs/toast_error.dart';

class Loading {
  static Future<void> show(Function load, {String message = 'Loading...', Duration delay = const Duration(milliseconds: 1000)}) async {
    bool done = false;

    if(delay.inMilliseconds == 0) {
      EasyLoading.show(status: message);
    } else {
      Future.delayed(delay, () {
        if (!EasyLoading.isShow && !done) {
          EasyLoading.show(status: message);
        }
      });
    }

    try {
      await load();
    }catch(e) {
      if(e.toString().contains("Exception")){
        log(e.toString());
        toast("Something went wrong");
      }
    }
    done = true;

    EasyLoading.dismiss(animation: true);
  }
}