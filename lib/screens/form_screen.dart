import 'package:account/main.dart';
import 'package:account/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account/provider/transaction_provider.dart';

class FormScreen extends StatefulWidget {


  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  final gamename = TextEditingController();
  final genre = TextEditingController();
  final review = TextEditingController();
  final rating = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(51, 47, 0, 255),
        centerTitle: true,
          title: const Text(
            'เพิ่มข้อมูล',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  
                  decoration: const InputDecoration(
                    labelText: 'ชื่อเกมส์',
                  ),
                  autofocus: false,
                  controller: gamename,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'แนวเกมส์',
                  ),
                  autofocus: false,
                  controller: genre,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'review',
                  ),
                  autofocus: false,
                  controller: review,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                  ),
                  keyboardType: TextInputType.number,
                  controller: rating,
                  validator: (String? input) {
                    try {
                      double amount = double.parse(input!);
                      if (amount > 5 ) {
                        return 'กรุณากรอกข้อมูลไม่เกินกว่า 5';
                      }
                      else if (amount == 0 ) {
                        return 'กรุณากรอกข้อมูลมากกว่า 0';
                      }
                    } catch (e) {
                      return 'กรุณากรอกข้อมูลเป็นตัวเลข';
                    }
                  },
                ),
                FilledButton(
                  style:
                        FilledButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('SAVE',style: TextStyle(fontSize: 20),),
                    onPressed: () {
                          if (formKey.currentState!.validate())
                            {
                              // create transaction data object
                              var statement1 = Transactions(
                                  keyID: null,
                                  title1: gamename.text,
                                  title2: genre.text,
                                  title3: review.text,
                                  amount: double.parse(rating.text),
                                  date: DateTime.now()
                                  );
                              
                            
                              // add transaction data object to provider
                              var provider = Provider.of<TransactionProvider>(context, listen: false);
                              
                              provider.addTransaction(statement1);
                             

                              Navigator.push(context, MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context){
                                  return MyHomePage();
                                }
                              ));
                            }
                        })
              ],
            )));
  }
}
