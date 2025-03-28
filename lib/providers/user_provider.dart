import 'package:flutter/foundation.dart';
import 'package:piehme_cup_flutter/models/user.dart';
import 'package:piehme_cup_flutter/services/users_service.dart';

class UserProvider extends ChangeNotifier {
  User _user = User.empty();
  bool _isLoading = false;

  User get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loadUserData() async {
    _isLoading = true;

    _user = await UsersService.getUserIcon();
    _isLoading = false;
    notifyListeners();
  }
}