import 'package:flutter/material.dart';
import 'package:personal_expense/model/transaction.dart';
import 'package:personal_expense/widgets/chart.dart';
import 'package:personal_expense/widgets/transaction_fields.dart';
import 'package:personal_expense/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
//    Transaction(
//        title: "New Shoes", id: "t1", amount: 69.99, date: DateTime.now()),
//    Transaction(
//        title: "New Socks", id: "t2", amount: 50.99, date: DateTime.now())
  ];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addNewTransactions(String title, double amount, DateTime selectedDate) {
    final newTx = Transaction(
        title: title,
        id: DateTime.now().toString(),
        amount: amount,
        date: selectedDate);

    setState(() {
      _transactions.add(newTx);
    });

    Navigator.pop(context);
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (c) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: TransactionFields(_addNewTransactions),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Expense"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _startNewTransaction(context);
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
    );
  }
}
