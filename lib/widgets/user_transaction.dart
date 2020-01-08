import 'package:flutter/material.dart';
import 'package:personal_expense/model/transaction.dart';
import 'package:personal_expense/widgets/transaction_fields.dart';
import 'package:personal_expense/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        title: "New Shoes", id: "t1", amount: 69.99, date: DateTime.now()),
    Transaction(
        title: "New Socks", id: "t2", amount: 50.99, date: DateTime.now())
  ];

  _addNewTransactions(String title, double amount) {
    final newTx = Transaction(
        title: title,
        id: DateTime.now().toString(),
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionFields(_addNewTransactions),
        TransactionList(_transactions),
      ],
    );
  }
}
