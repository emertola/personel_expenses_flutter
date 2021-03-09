import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expenses/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 1,
      title: 'My Groceries',
      amount: 1980.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'Haircut',
      amount: 150,
      date: DateTime.now(),
    ),
  ];

  final descController = TextEditingController();
  final amountController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart here'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    controller: descController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    controller: amountController,
                  ),
                  TextButton(
                    onPressed: () {
                      print(descController.text);
                      print(amountController.text);
                    },
                    child: Text('Add Transaction'),
                    style: TextButton.styleFrom(primary: Colors.purple),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transactions
                .map(
                  (tx) => Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${tx.amount} Php',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.purple),
                                ),
                                Text(
                                  DateFormat.yMMMMEEEEd().format(tx.date),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              tx.title,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
