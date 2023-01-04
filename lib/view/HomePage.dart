import 'package:flutter/material.dart';
import 'package:socialctr/firebase/authentication.dart';
import 'package:socialctr/widgets/custom_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(24, 79, 168, 10),
        title: const Text("Test APP SocialCTR"),
        actions: [
          IconButton(
              onPressed: (() {
                authentication.logout(context);
              }),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Posts",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  // scrollDirection: Axis.vertical,
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CustomList(),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
