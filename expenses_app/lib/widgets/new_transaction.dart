import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);

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
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black, // Text Color (Foreground color)
                ),
                onPressed: () {},
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
}
