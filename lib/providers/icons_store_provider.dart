import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/dialogs/loading.dart';
import 'package:piehme_cup_flutter/models/card_icon.dart';
import 'package:piehme_cup_flutter/services/icons_service.dart';

class IconsStoreProvider with ChangeNotifier {

  List<CardIcon> _items = <CardIcon>[];

  List<CardIcon> get items => _items;

  void loadStore() async {
    await Loading.show(() async {
      _items = await IconsService.getStoreIcons();
      notifyListeners();
    });
  }

}