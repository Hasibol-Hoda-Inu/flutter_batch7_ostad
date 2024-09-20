import 'package:flutter/material.dart';
import 'package:simple_bank_management/presentation/transaction_screen.dart';

class SimpleBankManagement extends StatelessWidget {
  const SimpleBankManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TransactionScreen(),
    );
  }
}
