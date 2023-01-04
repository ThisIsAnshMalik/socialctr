import 'package:flutter/foundation.dart';

class LoadingProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isloading => _isLoading;

  bool _newUser = true;
  bool get newUser => _newUser;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setNewUser(bool value) {
    _newUser = value;
    notifyListeners();
  }
}
