import 'package:zulzana_e_commerce/app/core/service/network_caller/network_caller.dart';

import '../features/auth/presentation/provider/auth_controller.dart';

NetworkCaller getNetworkCaller() {
  /*Map<String, String> headers = {
    'content-type' : 'application/json'
  };

  if( AuthController.accessToken != null ){
    headers['token'] = AuthController.accessToken!;
  }

  return NetworkCaller(headers: ()=> headers);*/

  return NetworkCaller(
    headers: () => {
      'content-type': 'application/json',
      if (AuthController.accessToken != null)
        'token': AuthController.accessToken!,
    },
  );
}
