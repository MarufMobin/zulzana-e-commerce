import 'package:flutter/foundation.dart';

import '../../../../app/core/service/network_caller/network_caller.dart';
import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../data/models/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _categoryPerPage = 32;
  bool _isInitialLoading = false;
  bool _isLoadingMore = false;
  String? _errorMessage;
  final List<CategoryModel> _categoryList = [];
  int? _lastPage;
  int _currentPage = 0;

  bool get isInitialLoading => _isInitialLoading;

  bool get isLoadingMore => _isLoadingMore;

  String? get errorMessage => _errorMessage;

  List<CategoryModel> get categoryList => _categoryList;

  Future<bool> getCategoryData() async {
    bool isSuccess = false;

    if (_currentPage == 0 || (_lastPage != null && _currentPage < _lastPage!)) {
      _currentPage++;
    } else {
      return false;
    }

    if (_currentPage == 1) {
      _isInitialLoading = true;
    } else {
      _isLoadingMore = true;
    }
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.categoryUrl(_currentPage, _categoryPerPage),
    );

    if (response.isSuccess) {
      List<CategoryModel> list = [];
      for (Map<String, dynamic> jsonData in response.body['data']['results']) {
        list.add(CategoryModel.fromJson(jsonData));
      }
      _categoryList.addAll(list);
      _lastPage = response.body['data']['last_page'];
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (_currentPage == 1) {
      _isInitialLoading = false;
    } else {
      _isLoadingMore = false;
    }
    notifyListeners();

    return isSuccess;
  }

  void refreshCategoryList() {
    _currentPage = 0;
    _lastPage = null;
    _categoryList.clear();
    getCategoryData();
  }

  bool get isLoading => _isInitialLoading || _isLoadingMore;
}
