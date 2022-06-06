import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransactions = [
    Transaction(id: "Muz", title: "Muz", amount: 15.25, date: DateTime.now()),
    Transaction(id: "Elma", title: "Elma", amount: 12.62, date: DateTime.now()),
    Transaction(
        id: "Armut", title: "Armut", amount: 13.85, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final transaction = Transaction(
        id: "${UniqueKey()}",
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      userTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          onSubmit: _addNewTransaction,
        ),
        TransactionList(userTransactions)
      ],
    );
  }
}
