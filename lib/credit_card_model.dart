class CreditCardModel {
  CreditCardModel(this.cardNumber, this.expiryDate, this.cardName,
      this.cardLastName, this.cvvCode, this.isCvvFocused);

  String cardNumber = '';
  String expiryDate = '';
  String cardName = '';
  String cardLastName = '';
  String cvvCode = '';
  String brand = '';
  bool isCvvFocused = false;
}
