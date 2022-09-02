import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class CreditDropdown extends StatefulWidget {
  final Function onCreditChose;
  const CreditDropdown({Key? key, required this.onCreditChose})
      : super(key: key);

  @override
  State<CreditDropdown> createState() => _CreditDropdownState();
}

class _CreditDropdownState extends State<CreditDropdown> {
  double chosenCredit = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.2),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
          underline: Container(),
          value: chosenCredit,
          elevation: 16,
          iconEnabledColor: Constants.mainColor.shade800,
          onChanged: (value) {
            setState(() {
              chosenCredit = value!;
              widget.onCreditChose(chosenCredit);
            });
          },
          items: DataHelper.tumKrediler()),
    );
  }
}
