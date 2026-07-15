import 'package:flutter/foundation.dart';
import 'package:zulzana_e_commerce/app/core/service/network_caller/network_caller.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../data/models/slider_model.dart';

class HomeSlidersProvider extends ChangeNotifier {
  bool _getSliderInProgress = false;

  bool get sliderInProgress => _getSliderInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<SliderModel> _sliders = [];

  List<SliderModel> get sliders => _sliders;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _getSliderInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.homeSlidersUrl,
    );

    if (response.isSuccess) {
      List<SliderModel> sliderModels = [];
      for (Map<String, dynamic> model in response.body['data']['result']) {
        sliderModels.add(SliderModel.fromJson(model));
      }
      _sliders = sliderModels;

      isSuccess = false;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getSliderInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
