import '../../Models/user.model.dart';
import '../../utils/api_client.dart';
import 'package:flutter/foundation.dart';

class UserController extends ChangeNotifier {
  final _apiClient = ApiClient();

  User? _user;
  String? _name;
  bool _isEditing = false;

  User? get user => _user;
  String? get name => _name;
  bool get isEditing => _isEditing;

  void fetchUserData(int userId) async {
    _user = await _apiClient.getUserById(userId);
    _name = _user?.name;
    print("User data fetched");
    print(_user);
    notifyListeners();
  }

  void startEditing() {
    _isEditing = true;
    notifyListeners();
  }

  void cancelEditing() {
    _isEditing = false;
    notifyListeners();
  }

  Future<void> updateUserData(String name) async {
    if (_user != null) {
      _user = await _apiClient.updateUserById(_user!.id, name);
      _isEditing = false;
      notifyListeners();
    }
  }
}
