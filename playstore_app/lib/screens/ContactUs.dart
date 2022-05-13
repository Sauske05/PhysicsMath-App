import 'package:flutter/material.dart';
import '../widgets/Main_drawer.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(),
      body: FormClass(),
    );
  }
}

class FormClass extends StatefulWidget {
  const FormClass({super.key});

  @override
  State<FormClass> createState() => _FormClassState();
}

class _FormClassState extends State<FormClass> {
  final key = GlobalKey<FormState>();
  Widget _textformfield(labeltxt, hinttxt, condition) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // maxLines: 5,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hinttxt,
          labelText: labeltxt,
        ),
        validator: ((value) {
          if (value!.isEmpty) {
            return condition;
          }
          return null;
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _textformfield('Full Name', "Enter your full name", 'Invalid Name'),
            _textformfield('Email', "Eg: sasuke123@gmail.com", 'Invalid Email'),
            _textformfield('Query', "Enter your concern", 'Type something.')
          ],
        ));
  }
}
