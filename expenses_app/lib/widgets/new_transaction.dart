import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({Key? key, required this.onSubmit}) : super(key: key);

  final void Function(String title, double amount) onSubmit;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                DecimalNumberFilter(),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black, // Text Color (Foreground color)
                ),
                onPressed: () {
                  final givenTitle = _titleController.value.text;
                  final givenAmount =
                      double.tryParse(_amountController.value.text) ?? -1;

                  print("given title: $givenTitle");
                  print("given amount: $givenAmount");

                  if (!isValid(givenTitle, givenAmount)) {
                    Fluttertoast.showToast(
                        msg: "Please enter a valid title and amount",
                        gravity: ToastGravity.TOP);
                    return;
                  }
                  widget.onSubmit(givenTitle, givenAmount);
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Add Transaction",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isValid(String givenTitle, double givenAmount) {
    if (givenTitle.isEmpty || givenAmount <= 0) {
      return false;
    }
    return true;
  }

  FilteringTextInputFormatter DecimalNumberFilter() {
    return FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[.]{0,1}[0-9]*'));
  }
}
