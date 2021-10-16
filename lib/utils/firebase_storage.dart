import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FirestoreApp extends StatefulWidget {
  const FirestoreApp({Key? key}) : super(key: key);

  @override
  _FirestoreAppState createState() => _FirestoreAppState();
}

class _FirestoreAppState extends State<FirestoreApp> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //call collection from firestore
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: StreamBuilder(
            stream: users.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //prevent null check
              if (!snapshot.hasData) {
                return Center(
                  child: Text('Loading'),
                );
              }

              return GridView(
                children: snapshot.data!.docs.map((user) {
                  return Center(
                    child: ListTile(
                      //load data from firestore
                      title: Text(user['name']),
                      //remove data from firestore
                      onLongPress: () {
                        user.reference.delete();
                        // user.reference.set('name', SetOptions() textController.text);
                      },
                    ),
                  );
                }).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 4 / 3, //width / height
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            //add data to firebase
            users.add({'name': textController.text});
            textController.clear();
          },
        ),
      ),
    );
  }
}
