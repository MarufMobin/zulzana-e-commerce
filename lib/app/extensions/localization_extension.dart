import 'package:flutter/material.dart';
import 'package:zulzana_e_commerce/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get localization => AppLocalizations.of(this)!;
}