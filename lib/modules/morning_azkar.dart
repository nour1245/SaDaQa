import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../models/azkar_model.dart';

class MorningAzkarScreen extends StatefulWidget {
  const MorningAzkarScreen({super.key});

  @override
  State<MorningAzkarScreen> createState() => _MorningAzkarScreenState();
}

class _MorningAzkarScreenState extends State<MorningAzkarScreen> {
  var counters = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
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
              var data = snapshot.data as List<AzkarModel>;
              return ListView.separated(
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () {
                        if (counters[index] < int.parse(data[index].count!)) {
                          setState(() {
                            counters[index]++;
                          });
                        } else {
                          setState(() {
                            counters[index] = 0;
                          });
                        }
                      },
                      child: Card(
                        color: const Color.fromARGB(255, 55, 150, 111),
                        child: Container(
                          child: Column(
                            children: [
                              
                              Text(
                                ' عدد المرات :${data[index].count}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' مرات الذكر :${counters[index]}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Text(
                                '${data[index].zekr}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                '${data[index].description}',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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

  Future<List<AzkarModel>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/day_reminders.json');
    final list = jsonDecode(jsonData) as List<dynamic>;
    return list.map((e) => AzkarModel.fromJson(e)).toList();
  }
}
