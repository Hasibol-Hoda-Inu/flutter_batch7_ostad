import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../Model/account_managment_methods.dart';
import 'widgets/transaction_list_widget.dart';
import 'widgets/user_input_bottom_sheet_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final Account _account = Account("Saif", "897", 54879);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff00B679),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.white,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Hello, Enu', style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                          ),),
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red
                            ),
                            child: const Text('PLUS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              color: Colors.white,
                                  fontSize: 12,
                                letterSpacing: 2
                            ),),
                          )
                        ],
                      ),
                      const SizedBox(width: 12,),
                       Column(children: [
                        Container(
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(
                                blurRadius: 16,
                                color: Colors.black.withOpacity(0.20),
                                spreadRadius: 7,
                              blurStyle: BlurStyle.outer
                            )]
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xff2A1395),
                            backgroundImage: AssetImage("assets/images/profile.jpg"),

                          ),
                        )
                      ],),
                    ],)
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transaction', style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),),
                          Row(children: [
                            Text('Sort by '),
                            Text('Date', style: TextStyle(
                                fontWeight: FontWeight.w700
                            ),),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],)
                        ],),
                      const SizedBox(height: 40,),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index){
                                return TransactionListWidget(
                                    transaction: _account.transactions[index]
                                );
                              },
                              separatorBuilder: (context, index){
                                return const SizedBox(height: 16,);
                              },
                              itemCount: _account.transactions.length,
                          )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          buttonBackgroundColor: const Color(0xff00B679),
          color: const Color(0x3800b679),
          height: 60,
          items: const <Widget>[
            Icon(Icons.add, size: 30, color: Colors.white,),
          ],
          onTap: (index) {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context){
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom/2),
                    child: UserInputBottomSheetWidget(
                      onDeposit: _addDeposit,
                      onRemove: _addWithdraw,
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
  void _addDeposit(double amount){
    setState(() {
      _account.deposit(amount);
    });
  }

  void _addWithdraw(double amount){
    setState(() {
      _account.withdraw(amount);
    });
  }
}




