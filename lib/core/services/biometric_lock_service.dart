import 'dart:developer' as developer;

import 'package:local_auth/local_auth.dart';
import 'package:tamalok/core/helper/local_storage_helper.dart';
import 'package:tamalok/core/services/locator/locator.dart';

class BiometricLockService {
  BiometricLockService({LocalAuthentication? localAuthentication, LocalStorageHelper? storage})
    : _localAuthentication = localAuthentication ?? LocalAuthentication(),
      _storage = storage ?? locator<LocalStorageHelper>();

  static const String boxName = 'settings';
  static const String biometricLockKey = 'biometric_lock_enabled';

  final LocalAuthentication _localAuthentication;
  final LocalStorageHelper _storage;

  Future<bool> isEnabled() async {
    final response = await _storage.getValue(boxName, biometricLockKey);
    return response.fold((_) => false, (value) => value == true);
  }

  Future<void> setEnabled(bool value) async {
    await _storage.saveValue(boxName, biometricLockKey, value);
  }

  Future<bool> canUseBiometrics() async {
    try {
      final canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
      final isDeviceSupported = await _localAuthentication.isDeviceSupported();
      final availableBiometrics = await _localAuthentication.getAvailableBiometrics();

      developer.log(
        'Biometric capability: canCheck=$canCheckBiometrics, '
        'isSupported=$isDeviceSupported, available=$availableBiometrics',
        name: 'BiometricLockService',
      );

      return canCheckBiometrics && isDeviceSupported && availableBiometrics.isNotEmpty;
    } catch (error, stackTrace) {
      developer.log(
        'Failed to check biometric capability',
        name: 'BiometricLockService',
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  Future<bool> authenticate({required String reason}) {
    return _localAuthentication.authenticate(
      localizedReason: reason,
      biometricOnly: true,
      persistAcrossBackgrounding: true,
    );
  }
}
