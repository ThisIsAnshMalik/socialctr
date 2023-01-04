import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:socialctr/models/DataModel.dart';
import 'package:socialctr/view/Detailed_screen.dart';

class CustomList extends StatelessWidget {
  const CustomList({Key? key}) : super(key: key);

  Future<List<DataModel>> readJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString("json/Data.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => DataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder(
        future: readJsonData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            var item = snapshot.data as List<DataModel>;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: item.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.1,
                      )),
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 185,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return DetailedScreen(
                          title: item[index].title.toString(),
                          imageUrl: item[index].imageUrl.toString(),
                          discription: item[index].description.toString(),
                        );
                      })));
                    },
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Image.network(
                              item[index].imageUrl.toString(),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover,
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              color: Colors.black45,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item[index].title.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.75)),
                                  )),
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
