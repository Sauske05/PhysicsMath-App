import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DownloadDialog extends StatefulWidget {
  final String? title;
  DownloadDialog(this.title);

  @override
  State<DownloadDialog> createState() => _DownloadDialogState();
}

class _DownloadDialogState extends State<DownloadDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startdownloading() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('Physics Content/${widget.title}.pdf')
        .getDownloadURL();
    print(downloadURL);

    setState(() {});

    String? filename = widget.title;
    String path = await _getfilePath(filename);

    await dio.download(downloadURL, path, onReceiveProgress: (count, total) {
      setState(() {
        progress = count / total;
      });
      print(progress);
    }, deleteOnError: true).then((value) => Navigator.pop(context));
  }

  Future<String> _getfilePath(String? filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startdownloading();
    print('ALl DOne');
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const CircularProgressIndicator.adaptive(),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Downloading : $downloadingprogress%",
          style: TextStyle(fontSize: 17),
        )
      ]),
    );
  }
}
