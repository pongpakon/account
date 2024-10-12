import 'package:account/main.dart';
import 'package:account/models/transactions.dart';
import 'package:account/provider/transaction_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  Transactions statement;

  EditScreen({super.key, required this.statement});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final time = TextEditingController();
  final importantwork = TextEditingController();
  final heritage = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    name.text = widget.statement.title1;
    time.text = widget.statement.title2;
    importantwork.text = widget.statement.title3;
    heritage.text = widget.statement.amount.toString();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(51, 47, 0, 255),
          centerTitle: true,
          title: const Text(
            'แก้ไขข้อมูล',
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
                    labelText: 'ชื่อนักปรัชญา',
                  ),
                  autofocus: false,
                  controller: name,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ยุคสมัย',
                  ),
                  autofocus: false,
                  controller: time,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ผลงานสำคัญ',
                  ),
                  autofocus: false,
                  controller: importantwork,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                 TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'อิทธิพลและมรดกทางความคิด',
                  ),
                  autofocus: false,
                  controller: heritage,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                FilledButton(
                    style:
                        FilledButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      'แก้ไขข้อมูล',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // create transaction data object
                        var statement = Transactions(
                            keyID: widget.statement.keyID,
                            title1: name.text,
                            title2: time.text,
                            title3: importantwork.text,
                            title4: heritage.text,
                            amount: double.parse(rating.text),
                            date: DateTime.now());

                        // add transaction data object to provider
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);

                        provider.updateTransaction(statement);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return MyHomePage();
                                }));
                      }
                    })
              ],
            )));
  }
}
