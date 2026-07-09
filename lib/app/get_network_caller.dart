import 'package:zulzana_e_commerce/app/core/service/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () => {
      'content-type': 'application/json',
    },
  );
}
