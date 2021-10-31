import 'package:flutter/material.dart';
import 'package:shark/config/colors.dart';
import 'package:shark/config/style.dart';

class OutstandingLoans extends StatefulWidget {
  const OutstandingLoans({Key? key}) : super(key: key);

  @override
  _OutstandingLoansState createState() => _OutstandingLoansState();
}

class _OutstandingLoansState extends State<OutstandingLoans> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onDoubleTap: () {
              // dialogue showing the time remaining for the loan
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
                      'John Mungai Kahura',
                      style: nameStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone: ',
                          style: cardStyle,
                        ),
                        Text(
                          '0746443929',
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
                          '5000',
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
                          '1000',
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
                          '1 month 4 days',
                          style: cardStyle,
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                              backgroundColor: MaterialStateProperty.all<Color>(
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
  }
}
