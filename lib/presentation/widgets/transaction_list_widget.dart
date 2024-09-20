import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Model/transaction_model_class.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({
    super.key,
     required this.transaction,
  });

   final Transaction transaction;

  @override
  Widget build(BuildContext context) {

    final String sign = transaction.isDeposit ? "+" : "-";
    final Color color = transaction.isDeposit ? Colors.green : Colors.red;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF1F1FD),
        borderRadius: BorderRadius.circular(25)
      ),
      child: ListTile(
        title: Text(transaction.isDeposit ? "Deposit" : "Withdraw", style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),),
        subtitle: Text(
            DateFormat('dd-MMM-yyyy | hh:mm a').format(DateTime.now())
        ),
        trailing: Text( "$sign${transaction.amount.toString()}\$", style: TextStyle(
          color: color,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}