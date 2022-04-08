import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                const Text(
                  'No transaction added yet',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(
                      DateFormat('MMM-yy-dd  HH:mm:ss ')
                          .format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          removeTransaction(transactions[index].id),
                      color: Colors.red,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
