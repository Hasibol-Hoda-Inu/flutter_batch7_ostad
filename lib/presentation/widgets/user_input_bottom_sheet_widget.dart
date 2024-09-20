import 'package:flutter/material.dart';

class UserInputBottomSheetWidget extends StatefulWidget {
   const UserInputBottomSheetWidget({
    super.key,
     required this.onDeposit,
     required this.onRemove,
  });

   final Function(double) onDeposit;
   final Function(double) onRemove;
  @override
  State<UserInputBottomSheetWidget> createState() => _UserInputBottomSheetWidgetState();
}

class _UserInputBottomSheetWidgetState extends State<UserInputBottomSheetWidget> {

  TextEditingController _depositeTEcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
              child: Column(
                children: [
                  TextFormField(
                    controller: _depositeTEcontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Amount'),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.green
                        )
                      )
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            widget.onDeposit(double.parse(_depositeTEcontroller.text));
                            Navigator.pop(context);
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green
                          ),
                          child: const Text('Deposit', style: TextStyle(
                            color: Colors.white,
                              fontSize: 18
                          ),)),
                      const SizedBox(width: 30,),
                      ElevatedButton(
                          onPressed: (){
                            widget.onRemove(double.parse(_depositeTEcontroller.text));
                            Navigator.pop(context);
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                          ),
                          child: const Text('Withdraw', style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),))
                    ],
                  )
                ],
              ),
            ),
          );
      }
  }