import 'package:flutter/material.dart';
import 'package:playstore_app/pastpaper%20folder/pdfviewer.dart';

class ListPP extends StatelessWidget {
  final List<String> physicsPPdata;
  final String year;
  final String month;
  const ListPP(
      {super.key,
      required this.physicsPPdata,
      required this.year,
      required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
            // spread operator used.
            children: [
              ...physicsPPdata.map((e) {
                return Answer(
                  title: e,
                  month: month,
                  year: year,
                );
              }).toList()
            ]),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String title;
  final String month;
  final String year;

  const Answer(
      {super.key,
      required this.title,
      required this.month,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PDFViewer(
                      title,
                      month,
                      year,
                    )));
      }),
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}
