import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:quran/shared/network/local/cash_helper.dart';

class SuraScreen extends StatefulWidget {
  final List? pages;
  int? lastPage;
  SuraScreen({Key? key, this.pages}) : super(key: key);

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                CacheHelper.saveData(key: 'lastPage', value: widget.lastPage);
              },
              child: const Text(
                'حفظ الصفحة',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PDF(
                fitEachPage: true,
                pageSnap: true,
                defaultPage: widget.pages == null ? 1 : widget.pages?[0] - 1,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: true,
                pageFling: true,
                fitPolicy: FitPolicy.BOTH,
                onError: (error) {
                  print(error.toString());
                },
                onPageError: (page, error) {
                  print('$page: ${error.toString()}');
                },
                onPageChanged: (int? page, int? total) {
                  print('page change: $page/$total');
                  widget.lastPage = page;
                },
              ).fromAsset('assets/Quran.pdf'),
            ),
          ],
        ),
      ),
    );
  }
}
