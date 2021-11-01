import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shark/config/colors.dart';
import 'package:shark/config/style.dart';

class SettledLoans extends StatefulWidget {
  const SettledLoans({Key? key}) : super(key: key);

  @override
  _SettledLoansState createState() => _SettledLoansState();
}

class _SettledLoansState extends State<SettledLoans> {
  List settledLoans = [];

  final Stream<QuerySnapshot> _activeLoansStream =
      FirebaseFirestore.instance.collection('Loans').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _activeLoansStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              // provide a refresh button
              child: Column(
                children: [
                  const Text(
                    'Something went Wrong please try again later',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextButton(
                      onPressed: () {
                        // rebuild whole widget
                      },
                      child: const Text('Refresh')),
                ],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) {
                String name = snapshot.data!.docs[index]['Name'];
                String amount = snapshot.data!.docs[index]['Amount'];
                String phone = snapshot.data!.docs[index]['Phone'];
                String interest = snapshot.data!.docs[index]['Interest'];
                String status = snapshot.data!.docs[index]['Status'];
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.all(2),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: themeColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: nameStyle,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone: ',
                              style: cardStyle,
                            ),
                            Text(
                              phone,
                              style: cardStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Loan Amount: ',
                              style: cardStyle,
                            ),
                            Text(
                              amount,
                              style: cardStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Interest:  ',
                              style: cardStyle,
                            ),
                            Text(
                              interest,
                              style: cardStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
