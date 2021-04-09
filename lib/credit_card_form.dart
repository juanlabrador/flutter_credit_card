import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'credit_card_model.dart';
import 'flutter_credit_card.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardName,
    required this.cardLastName,
    required this.cvvCode,
    this.obscureCvv = false,
    this.obscureNumber = false,
    required this.onCreditCardModelChange,
    required this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
    this.fontFamily,
    this.cardNumberController,
    this.expiryDateController,
    this.cardNameController,
    this.cardLastnameNameController,
    this.cvvCodeController,
    this.cardNameDecoration = const InputDecoration(
      labelText: 'First Name',
    ),
    this.cardLastNameDecoration = const InputDecoration(
      labelText: 'Last Name',
    ),
    this.cardNumberDecoration = const InputDecoration(
      labelText: 'Card number',
      hintText: 'XXXX XXXX XXXX XXXX',
    ),
    this.expiryDateDecoration = const InputDecoration(
      labelText: 'Expired Date',
      hintText: 'MM/YY',
    ),
    this.cvvCodeDecoration = const InputDecoration(
      labelText: 'CVV',
      hintText: 'XXX',
    ),
    required this.formKey,
    this.cvvValidationMessage = 'Please input a valid CVV',
    this.dateValidationMessage = 'Please input a valid date',
    this.numberValidationMessage = 'Please input a valid number',
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardName;
  final String cardLastName;
  final String cvvCode;
  final String cvvValidationMessage;
  final String dateValidationMessage;
  final String numberValidationMessage;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color? cursorColor;
  final bool obscureCvv;
  final bool obscureNumber;
  final GlobalKey<FormState> formKey;
  final String? fontFamily;

  final InputDecoration cardNumberDecoration;
  final InputDecoration cardNameDecoration;
  final InputDecoration cardLastNameDecoration;
  final InputDecoration expiryDateDecoration;
  final InputDecoration cvvCodeDecoration;

  final TextEditingController? cardNumberController;
  final TextEditingController? expiryDateController;
  final TextEditingController? cardNameController;
  final TextEditingController? cardLastnameNameController;
  final TextEditingController? cvvCodeController;

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  late String cardNumber;
  late String expiryDate;
  late String cardName;
  late String cardLastName;
  late String cvvCode;
  bool isCvvFocused = false;
  late Color themeColor;

  late void Function(CreditCardModel) onCreditCardModelChange;
  late CreditCardModel creditCardModel;

  final MaskedTextController _cardNumberController =
      MaskedTextController(mask: '0000 0000 0000 0000');
  final TextEditingController _expiryDateController =
      MaskedTextController(mask: '00/00');
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardLastnameNameController =
      TextEditingController();
  final TextEditingController _cvvCodeController =
      MaskedTextController(mask: '0000');

  FocusNode cvvFocusNode = FocusNode();
  FocusNode cardNumberNode = FocusNode();
  FocusNode expiryDateNode = FocusNode();
  FocusNode cardNameNode = FocusNode();
  FocusNode cardLastNameNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber;
    expiryDate = widget.expiryDate;
    cardName = widget.cardName;
    cardLastName = widget.cardLastName;
    cvvCode = widget.cvvCode;

    creditCardModel = CreditCardModel(
        cardNumber, expiryDate, cardName, cardLastName, cvvCode, isCvvFocused);
  }

  @override
  void initState() {
    super.initState();

    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    if (widget.cardNumberController != null) {
      widget.cardNumberController?.addListener(() {
        setState(() {
          cardNumber = widget.cardNumberController!.text;
          creditCardModel.cardNumber = cardNumber;
          onCreditCardModelChange(creditCardModel);
        });
      });
    } else {
      _cardNumberController.addListener(() {
        setState(() {
          cardNumber = _cardNumberController.text;
          creditCardModel.cardNumber = cardNumber;
          onCreditCardModelChange(creditCardModel);
        });
      });
    }

    if (widget.expiryDateController != null) {
      widget.expiryDateController?.addListener(() {
        setState(() {
          expiryDate = widget.expiryDateController!.text;
          creditCardModel.expiryDate = expiryDate;
          onCreditCardModelChange(creditCardModel);
        });
      });
    } else {
      _expiryDateController.addListener(() {
        setState(() {
          expiryDate = _expiryDateController.text;
          creditCardModel.expiryDate = expiryDate;
          onCreditCardModelChange(creditCardModel);
        });
      });
    }

    if (widget.cardNameController != null) {
      widget.cardNameController?.addListener(() {
        setState(() {
          cardName = widget.cardNameController!.text;
          creditCardModel.cardName = cardName;
          onCreditCardModelChange(creditCardModel);
        });
      });
    } else {
      _cardNameController.addListener(() {
        setState(() {
          cardName = _cardNameController.text;
          creditCardModel.cardName = cardName;
          onCreditCardModelChange(creditCardModel);
        });
      });
    }

    if (widget.cardLastnameNameController != null) {
      widget.cardLastnameNameController?.addListener(() {
        setState(() {
          cardLastName = widget.cardLastnameNameController!.text;
          creditCardModel.cardLastName = cardLastName;
          onCreditCardModelChange(creditCardModel);
        });
      });
    } else {
      _cardLastnameNameController.addListener(() {
        setState(() {
          cardLastName = _cardLastnameNameController.text;
          creditCardModel.cardLastName = cardLastName;
          onCreditCardModelChange(creditCardModel);
        });
      });
    }

    if (widget.cvvCodeController != null) {
      widget.cvvCodeController?.addListener(() {
        setState(() {
          cvvCode = widget.cvvCodeController!.text;
          creditCardModel.cvvCode = cvvCode;
          onCreditCardModelChange(creditCardModel);
        });
      });
    } else {
      _cvvCodeController.addListener(() {
        setState(() {
          cvvCode = _cvvCodeController.text;
          creditCardModel.cvvCode = cvvCode;
          onCreditCardModelChange(creditCardModel);
        });
      });
    }
  }

  @override
  void dispose() {
    cardNameNode.dispose();
    cardLastNameNode.dispose();
    cvvFocusNode.dispose();
    expiryDateNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    themeColor = widget.themeColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: themeColor.withOpacity(0.8),
        primaryColorDark: themeColor,
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                obscureText: widget.obscureNumber,
                controller:
                    widget.cardNumberController ?? _cardNumberController,
                cursorColor: widget.cursorColor ?? themeColor,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(expiryDateNode);
                },
                style: TextStyle(
                  color: widget.textColor,
                  fontFamily: widget.fontFamily,
                ),
                decoration: widget.cardNumberDecoration,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (String? value) {
                  // Validate less that 13 digits +3 white spaces
                  if (value!.isEmpty || value.length < 16) {
                    return widget.numberValidationMessage;
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin: const EdgeInsets.only(left: 16, top: 5, right: 10),
                    child: TextFormField(
                      controller:
                          widget.expiryDateController ?? _expiryDateController,
                      cursorColor: widget.cursorColor ?? themeColor,
                      focusNode: expiryDateNode,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(cvvFocusNode);
                      },
                      style: TextStyle(
                        color: widget.textColor,
                        fontFamily: widget.fontFamily,
                      ),
                      decoration: widget.expiryDateDecoration,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return widget.dateValidationMessage;
                        }

                        final DateTime now = DateTime.now();
                        final List<String> date = value.split(RegExp(r'/'));
                        final int month = int.parse(date.first);
                        final int year = int.parse('20${date.last}');
                        final DateTime cardDate = DateTime(year, month);

                        if (cardDate.isBefore(now) ||
                            month > 12 ||
                            month == 0) {
                          return widget.dateValidationMessage;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin: const EdgeInsets.only(left: 10, top: 5, right: 16),
                    child: TextFormField(
                      obscureText: widget.obscureCvv,
                      focusNode: cvvFocusNode,
                      controller:
                          widget.cvvCodeController ?? _cvvCodeController,
                      cursorColor: widget.cursorColor ?? themeColor,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(cardNameNode);
                      },
                      style: TextStyle(
                        color: widget.textColor,
                        fontFamily: widget.fontFamily,
                      ),
                      decoration: widget.cvvCodeDecoration,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (String text) {
                        setState(() {
                          cvvCode = text;
                        });
                      },
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 3) {
                          return widget.cvvValidationMessage;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin: const EdgeInsets.only(left: 16, top: 5, right: 10),
                    child: TextFormField(
                      controller:
                          widget.cardNameController ?? _cardNameController,
                      cursorColor: widget.cursorColor ?? themeColor,
                      focusNode: cardNameNode,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(cardLastNameNode);
                      },
                      style: TextStyle(
                        color: widget.textColor,
                        fontFamily: widget.fontFamily,
                      ),
                      decoration: widget.cardNameDecoration,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin: const EdgeInsets.only(left: 10, top: 5, right: 16),
                    child: TextFormField(
                      focusNode: cardLastNameNode,
                      controller: widget.cardLastnameNameController ??
                          _cardLastnameNameController,
                      cursorColor: widget.cursorColor ?? themeColor,
                      onEditingComplete: () {
                        onCreditCardModelChange(creditCardModel);
                      },
                      style: TextStyle(
                        color: widget.textColor,
                        fontFamily: widget.fontFamily,
                      ),
                      decoration: widget.cardLastNameDecoration,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
