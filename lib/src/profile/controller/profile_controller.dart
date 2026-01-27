import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  DateTime? paymentStartDate;
  DateTime? paymentEndDate;
  bool isCashPayment = true;
  bool enableNotification = false;
  bool enableInstantNotification = false;
  bool isPostRequest = true;
  bool isDeleteContinue = false;

  void clearFields() {
    paymentStartDate = null;
    paymentEndDate = null;
    notifyListeners();
  }

  void continueAccountDeletion() {
    isDeleteContinue = !isDeleteContinue;

    notifyListeners();
  }

  void enableInstantNotificationButton() {
    if (enableNotification == true) {
      enableInstantNotification = !enableInstantNotification;
    } else {
      null;
    }

    notifyListeners();
  }

  void enableNotificationButton() {
    enableNotification = !enableNotification;
    if (enableNotification == false) {
      enableInstantNotification = false;
    }

    notifyListeners();
  }

  void isPostRequestEnabled() {
    isPostRequest = !isPostRequest;
    clearFields();
    notifyListeners();
  }

  void selectPaymentMode() {
    isCashPayment = !isCashPayment;
    clearFields();
    notifyListeners();
  }
}
