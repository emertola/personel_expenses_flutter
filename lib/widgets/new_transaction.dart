import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final descController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    final editDesc = descController.text;
    final editAmount = double.parse(amountController.text);

    if (editDesc.isEmpty || editAmount <= 0) {
      return;
    }

    widget.addTransactionHandler(
      editDesc,
      editAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: descController,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submit(),
            ),
            TextButton(
              onPressed: submit,
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(primary: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
