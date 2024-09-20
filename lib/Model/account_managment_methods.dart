import 'transaction_model_class.dart';

class Account {
  String userName;
  String userAccNumber;
  double balance;

  List<Transaction> transactions = [];

  Account(this.userName, this.userAccNumber, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      transactions.add(Transaction(amount: amount, isDeposit: true));
      print("$amount deposited. New balance: $balance");
    } else {
      print('Enter a positive number');
    }
  }

  void withdraw(double amount) {
    if (amount <= balance && amount > 0) {
      balance -= amount;
      transactions.add(Transaction(amount: amount, isDeposit: false));
      print("$amount withdrawn. New balance: $balance");
    } else {
      print('Insufficient balance or invalid amount');
    }
  }

  void showBalance() {
    print('Account holder: $userName');
    print('Account number: $userAccNumber');
    print('Total balance: $balance');
  }
}
