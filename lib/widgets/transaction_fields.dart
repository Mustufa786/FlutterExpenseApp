import 'package:flutter/material.dart';

class TransactionFields extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTx;

  TransactionFields(this.addNewTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            FlatButton(
              textColor: Colors.blue,
              onPressed: () {
                addNewTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
