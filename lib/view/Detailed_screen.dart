import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  String title;
  String imageUrl;
  String discription;

  DetailedScreen(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.discription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text(
                      "20/4/2023",
                      style: TextStyle(fontSize: 14, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Divider(
                      thickness: 1.3,
                      color: Colors.white,
                    ),
                    Text(
                      discription,
                      style: TextStyle(
                          fontSize: 16, color: Colors.white.withOpacity(0.5)),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
