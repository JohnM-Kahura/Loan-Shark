import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shark/config/colors.dart';
import 'package:shark/config/style.dart';

class OutstandingLoans extends StatefulWidget {
  const OutstandingLoans({Key? key}) : super(key: key);

  @override
  _OutstandingLoansState createState() => _OutstandingLoansState();
}

class _OutstandingLoansState extends State<OutstandingLoans> {
  List activeLoans = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  //TODO: change the type of duration
  TextEditingController durationController = TextEditingController();

  update(String name, String phone, String amount, String interest, String id) {
    Map<String, String> newEntry = {
      'Name': name,
      'Phone': phone,
      'Amount': amount,
      'Interest': interest
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Loans');
    collectionReference.doc(id).update(newEntry);
  }

  delete(String id) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Loans');
    collectionReference.doc(id).delete();
  }

  final Stream<QuerySnapshot> _activeLoansStream =
      FirebaseFirestore.instance.collection('Loans').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _activeLoansStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  String id = snapshot.data!.docs[index].id;
                  String name = snapshot.data!.docs[index]['Name'];
                  String amount = snapshot.data!.docs[index]['Amount'];
                  String phone = snapshot.data!.docs[index]['Phone'];
                  String duration = snapshot.data!.docs[index]['Duration'];
                  String interest = snapshot.data!.docs[index]['Interest'];
                  String status = snapshot.data!.docs[index]['Status'];
                  return GestureDetector(
                    onDoubleTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Are You sure you want to delete this item',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              themeColor)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              themeColor)),
                                  onPressed: () {
                                    delete(id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    onLongPress: () {
                      // dialogue showing the time remaining for the loan
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.width - 100,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      customTextFeild('Name', nameController,
                                          TextInputType.name),
                                      customTextFeild('Phone Number',
                                          phoneController, TextInputType.phone),
                                      customTextFeild(
                                          'Amount',
                                          amountController,
                                          TextInputType.number),
                                      // TODO: see if you can change the interest dynamically
                                      customTextFeild(
                                          'Interest',
                                          interestController,
                                          TextInputType.number),
                                      customTextFeild(
                                          'Duration',
                                          durationController,
                                          TextInputType.number),
                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          themeColor)),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          themeColor)),
                                              onPressed: () async {
                                                try {
                                                  await update(
                                                      nameController.text,
                                                      phoneController.text,
                                                      amountController.text,
                                                      interestController.text,
                                                      id);
                                                } catch (e) {
                                                  print(e);
                                                }
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Update',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Card(
                      elevation: 1,
                      margin: const EdgeInsets.all(2),
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        color: themeColor,
                        // height: 200,
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
                            Row(
                              children: [
                                Text(
                                  'Duration:  ',
                                  style: cardStyle,
                                ),
                                Text(
                                  duration + 'months',
                                  style: cardStyle,
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                    onPressed: () {
                                      // dilogue for the time extension
                                    },
                                    child: Text(
                                      'Extend Loan',
                                      style: buttonTextStyle,
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                    onPressed: () {
                                      //remove card from list
                                      // add the data to the settled tab
                                    },
                                    child: Text(
                                      'Mark as Paid',
                                      style: buttonTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

Widget customTextFeild(
    String hint, TextEditingController controller, TextInputType inputType) {
  return Container(
    margin: const EdgeInsets.all(8),
    child: TextField(
      controller: controller,
      // autofocus: true,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      cursorColor: Colors.blueGrey,
    ),
  );
}
