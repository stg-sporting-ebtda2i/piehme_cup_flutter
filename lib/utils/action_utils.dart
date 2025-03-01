import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:piehme_cup_flutter/dialogs/alert_dialog.dart';
import 'package:piehme_cup_flutter/dialogs/message.dart';
import 'package:provider/provider.dart';

import '../providers/header_provider.dart';

class ActionUtils {

  final BuildContext context;
  final VoidCallback callback;
  final Future<void> Function() action;

  ActionUtils({
    required this.context,
    required this.action,
    required this.callback,
  });

  void confirmAction({String text='Are you sure that you want to continue?', String confirmBtn='Confirm'}) {
    showAlertDialog(
        context: context,
        text: text,
        positiveBtnText: confirmBtn,
        positiveBtnAction: () {performAction();Navigator.pop(context);},
    );
  }

  Future<void> performAction() async {
    EasyLoading.show(status: 'Loading...');
    try {
      await action();
    } catch(e) {
      toast(e.toString());
    } finally {
      EasyLoading.dismiss(animation: true);
      if (context.mounted) {
        context.read<HeaderProvider>().refreshCoins();
        callback();
      }
    }
  }

}