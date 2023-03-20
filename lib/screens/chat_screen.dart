import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grazac_chat_app/screens/add_product.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddProduct()));
                //Implement logout functionality
              }),
        ],
        title: Text('Availabble Products'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        child: Icon(Icons.logout),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(user.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
               final data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    print(index);
                    var item = (data.docs[index].data() as Map);
                    var image = item['image'];
                    var name = item['product_name'];
                    var desc = item['description'];
                    var model = item['product_model'];
                    var amount = item['price'];
                    // String data = snapshot.data.toString();
                    double _myBalance = double.parse(amount);
                    String _newBalance =
                        NumberFormat.currency(symbol: '₦').format(_myBalance);

                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(color: Colors.teal),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(image),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _newBalance,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              infoRow(title: 'Name', value: name),
                              SizedBox(
                                height: 10,
                              ),
                              infoRow(title: 'model', value: model),
                              SizedBox(
                                height: 10,
                              ),
                              infoRow(title: 'description', value: desc),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.edit_document,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Container(
                color: Colors.black,
                width: double.infinity,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Product Yet',
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddProduct()));
                        //Implement send functionality.
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 50,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              );
            }
          }),
      // SafeArea(
      //   child:
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: <Widget>[
      //     Container(
      //       decoration: kMessageContainerDecoration,
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           Expanded(
      //             child: TextField(
      //               onChanged: (value) {
      //                 //Do something with the user input.
      //               },
      //               decoration: kMessageTextFieldDecoration,
      //             ),
      //           ),
      //           ElevatedButton(
      //             onPressed: () {
      //               //Implement send functionality.
      //             },
      //             child: Text(
      //               'Send',
      //               style: kSendButtonTextStyle,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     ElevatedButton(
      //         onPressed: () {
      //           // final double _height = MediaQuery.of(context).size.height;
      //           // final double _weight = MediaQuery.of(context).size.width;

      //           // print(_height);
      //           // print(_weight);
      //         },
      //         child: Text('Log Out'))
      //   ],
      // ),
      // ),
    );
  }

  Row infoRow({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          '${title.toUpperCase()} : ',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
