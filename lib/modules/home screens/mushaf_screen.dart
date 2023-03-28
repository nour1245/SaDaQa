import 'package:flutter/material.dart';
import 'package:quran/modules/home%20screens/sura.dart';
import 'package:quran/shared/components/components.dart';
import 'package:quran/shared/network/local/cash_helper.dart';

class MushafScreen extends StatelessWidget {
  final List chapters;
  const MushafScreen({Key? key, required this.chapters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المصحف'),
          actions: [
            TextButton(
              onPressed: () {
                var gotopage = CacheHelper.getData(key: 'lastPage');
                navigatTO(
                  context,
                  SuraScreen(
                    pages: [gotopage + 1],
                  ),
                );
              },
              child: const Text(
                'الصفحة المحفوظة',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        body: chapters.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        const Text("يمكنك الوصول للمصحف بدون انترنت من "),
                      
                      TextButton(
                          onPressed: () {
                            navigatTO(
                              context,
                              SuraScreen(),
                            );
                          },
                          child: const Text('هنــا'),
                        ),
                      ],
                    ),
                    const Text(
                        'يمكنك الوصول بشكل اسرع لسورة معينة عند الاتصال بالانترنت')
                  ],
                ),
              )
            : ListView.separated(
                itemCount: chapters.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.grey,
                    height: 1,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return bulidListItem(index, context);
                },
              ),
      ),
    );
  }

  Widget bulidListItem(index, context) => InkWell(
        onTap: () {
          navigatTO(context, SuraScreen(pages: chapters[index].pages));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${chapters[index].nameArabic}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      ' عدد الايات:${chapters[index].versesCount}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: Text(
                    '| الصفحات:${chapters[index].pages}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: Text(
                    '| ترتيب النزول:${chapters[index].revelationOrder}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  chapters[index].revelationPlace.toString() == 'makkah'
                      ? const Flexible(
                          child: Text(
                            '| مكان النزول:مكة',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const Flexible(
                          child: Text(
                          '| مكان النزول:المدينة',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                ],
              ),
            ],
          ),
        ),
      );
}
