class CreditCard {
  String cardNumber;
  String name;
  String date;
  String cvv;

  CreditCard({
    required this.cardNumber, 
    required this.name, 
    required this.date, 
    required this.cvv
  });

  @override
  String toString() {
    return "cardNumber=$cardNumber, name=$name, validate=$date, cvv=$cvv";
  }
}