import 'package:flutter/foundation.dart';

import '../../../../app/core/service/network_caller/network_caller.dart';
import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../data/models/sign_in_params.dart';
import '../../data/models/user_model.dart';

class SignInProvider extends ChangeNotifier {
  bool _signInProgress = false;

  bool get signInProgress => _signInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;
    _signInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      String token = response.body['data']['token'];
      UserModel user = UserModel.fromJson(response.body['data']['user']);
      // TODO: Save user token and user data into shared preference
    } else {
      _errorMessage = response.errorMessage;
    }
    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
