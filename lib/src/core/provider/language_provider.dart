import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/models/language.dart';
import 'language_service.dart';

@injectable
class LanguageProvider with ChangeNotifier {
  Language _selectedLanguage = Language(code: 'en');
  final LanguageService _languageService;

  @factoryMethod
  LanguageProvider(this._languageService);

  Language get selectedLanguage => _selectedLanguage;

  Future<void> loadSelectedLanguage() async {
    final languageCode = await _languageService.getSelectedLanguage();
    if (languageCode != null) {
      _selectedLanguage = Language(code: languageCode);
      notifyListeners();
    }
  }

  Future<void> changeLanguage(Language language) async {
    _selectedLanguage = language;
    await _languageService.saveSelectedLanguage(language.code);
    notifyListeners();
  }
}
