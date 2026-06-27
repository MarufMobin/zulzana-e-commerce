import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier{
  Locale _currentLocale = Locale('en');
  final List<Locale> _locale = [ Locale('en'), Locale('bn')];

  List<Locale> get supportedLocals => _locale;
  Locale get currentLocale => _currentLocale;


  void changeLocal( Locale locale ){
    _currentLocale = locale;
    _saveLocale(locale);
    notifyListeners();
  }

  Future<void> _saveLocale( Locale locale) async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString('locale', locale.languageCode);
  }

  Future<void>setDefaultLocale()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? locale = sharedPreferences.getString('locale');

    if( locale != null ){
      _currentLocale = Locale(locale);
    }
  }



}