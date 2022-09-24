import 'package:flutter/material.dart';

class CreditCardProvider with ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String cvv    = '';
  String cardNumber = '';
  String date = '';
  String name = '';


  void setCVV(String cvv) {
    this.cvv = cvv;
    notifyListeners();
  }

  get getCVV => this.cvv;

  void setCardNumber(String cardNumber) {
    this.cardNumber =  addSpaceToCardNumber(cardNumber);
    notifyListeners();
  }

  get getCardNumber => this.cardNumber;

  void setDate(String date) {
    if (date.length == 3) {
      if (date.contains("/")) {
        this.date = date.substring(0, 2);
      } else {
        this.date = "${date.substring(0, 2)}/${date.substring(2)}";
      }
    } else {
      this.date = date;
    }
    notifyListeners();
  }

  get getDate => this.date;

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  get getName => this.name;


  String addSpaceToCardNumber(String date) {
    date = date.replaceAll(RegExp(r'[^0-9]'), '');

    if (date.isNotEmpty && date[date.length - 1] == ' ') {
      return date.substring(0, date.length - 1);
    } else {
      date = date.replaceAll(" ", "");
      String cardNumber = "";

      for (int i = 1; i <= date.length; i++) {
        cardNumber = cardNumber + date[i - 1];
        if (i % 4 == 0 && i != date.length) {
          cardNumber = cardNumber + ' ';
        }
      }
      return cardNumber;
    }
  }
}