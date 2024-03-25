import 'dart:async';

import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future <UpiResponse>? _transation; 
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  @override
  Widget build(BuildContext context) {
    List<UpiApp>? apps;

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

    return const Placeholder();
  }
}