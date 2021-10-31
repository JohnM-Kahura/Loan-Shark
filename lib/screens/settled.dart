import 'package:flutter/material.dart';
import 'package:shark/config/colors.dart';
import 'package:shark/config/style.dart';

class SettledLoans extends StatefulWidget {
  const SettledLoans({Key? key}) : super(key: key);

  @override
  _SettledLoansState createState() => _SettledLoansState();
}

class _SettledLoansState extends State<SettledLoans> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 13,
        itemBuilder: (BuildContext context, int index) {
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
                ],
              ),
            ),
          );
        });
  }
}
