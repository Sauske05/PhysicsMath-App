import 'package:flutter/material.dart';
import '../widgets/Main_drawer.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(),
      body: Center(child: Text('Welcome to our customer Service')),
    );
  }
}
