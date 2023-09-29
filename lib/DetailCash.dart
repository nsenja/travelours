// tambah_pemasukan.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Database_Helper.dart';


class DetailCash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Cash Flow'),
      ),
        body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          final isExpense = transaction.type == TransactionType.expense;

          return ListTile(
            leading: Icon(
              isExpense ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
              color: isExpense ? Colors.red : Colors.green,
            ),
            title: Text(transaction.description),
            subtitle: Text('Amount: ${transaction.amount}'),
          );
        },
      ),
    );
  }
}

class Transaction {
  final String description;
  final double amount;
  final TransactionType type;

  Transaction(this.description, this.amount, this.type);
}

enum TransactionType {
  income,
  expense,
}

// Dummy data (gantilah dengan data transaksi sesuai kebutuhan)
final transactions = [
  Transaction('Pemasukan 1', 2.000, TransactionType.income),
  Transaction('Pengeluaran 1',1.000, TransactionType.expense),
  // Tambahkan transaksi lain di sini
];