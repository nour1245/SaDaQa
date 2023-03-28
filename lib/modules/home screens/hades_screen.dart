import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:quran/models/hadis_model.dart';

class HadisScreen extends StatelessWidget {
  const HadisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: readJsonData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error : ${snapshot.error}');
            } else if (snapshot.hasData) {
              var data = snapshot.data as List<HadisModel>;
              return ListView.separated(
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: const Color.fromARGB(255, 55, 150, 111),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '${data[index].hadith}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data[index].description}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List<HadisModel>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/muslim.json');
    final list = jsonDecode(jsonData) as List<dynamic>;
    return list.map((e) => HadisModel.fromJson(e)).toList();
  }
}
