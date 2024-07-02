import 'dart:io';

import 'package:mississauga/utils/extensions.dart';

enum LoadState { loading, loaded, noData, noInternet, error }

enum ApiExceptions { noInternet, serverErr, authErr, notFoundErr, error }

enum InputFormatType { name, phoneNumber, email, password }

Future<bool> isInternetAvailable({bool enableToast = true}) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      if (enableToast) "No Internet".showToast;
      return false;
    }
  } on SocketException catch (_) {
    if (enableToast) "No Internet".showToast;
    return false;
  }
}
