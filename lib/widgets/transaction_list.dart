import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(transactions[index].title),
              subtitle: Text(DateFormat().add_yMMMd().format(transactions[index].date)),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
