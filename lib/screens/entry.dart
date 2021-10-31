import 'package:flutter/material.dart';
import 'package:shark/config/colors.dart';
import 'package:shark/config/style.dart';

class LoanEntry extends StatefulWidget {
  const LoanEntry({Key? key}) : super(key: key);

  @override
  _LoanEntryState createState() => _LoanEntryState();
}

class _LoanEntryState extends State<LoanEntry> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  //TODO: change the type of duration
  TextEditingController durationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          customTextFeild('Name', nameController, TextInputType.name),
          customTextFeild('Phone', phoneController, TextInputType.phone),
          customTextFeild('Amount', amountController, TextInputType.number),
          customTextFeild(
              'Duration', durationController, TextInputType.datetime),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(themeColor)),
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
