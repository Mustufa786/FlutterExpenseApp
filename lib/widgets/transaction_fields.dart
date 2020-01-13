import 'package:flutter/material.dart';

class TransactionFields extends StatefulWidget {
  final Function addNewTx;

  TransactionFields(this.addNewTx);

  @override
  _TransactionFieldsState createState() => _TransactionFieldsState();
}

class _TransactionFieldsState extends State<TransactionFields> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();


  void _showDatePicker(){

    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: null, lastDate: null);
  }

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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text("No Date Chosen"),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                widget.addNewTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
