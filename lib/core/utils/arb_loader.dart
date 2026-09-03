import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

/// كلاس مسؤول عن تحميل ملفات الترجمة .arb وتحويلها إلى Map
class ArbLoader {
  static final ArbLoader _instance = ArbLoader._internal();
  factory ArbLoader() => _instance;
  ArbLoader._internal();

  Map<String, dynamic> _cachedTranslations = {};

  /// تحميل ملف الترجمة المناسب للغة الحالية
  Future<void> load(Locale locale) async {
    try {
      final path = 'lib/core/l10n/app_${locale.languageCode}.arb';
      final jsonString = await rootBundle.loadString(path);
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      // إزالة المفاتيح الخاصة مثل @@locale
      jsonMap.removeWhere((key, _) => key.startsWith('@@'));
      _cachedTranslations = jsonMap;
    } catch (e) {
      _cachedTranslations = {};
    }
  }

  String get(String key) => _cachedTranslations[key] ?? '';
}
