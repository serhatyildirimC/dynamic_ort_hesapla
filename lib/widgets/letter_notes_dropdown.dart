import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class LetterNoteDropdown extends StatefulWidget {
  final Function onLetterChose;
  const LetterNoteDropdown({Key? key, required this.onLetterChose})
      : super(key: key);

  @override
  State<LetterNoteDropdown> createState() => _LetterNoteDropdownState();
}

class _LetterNoteDropdownState extends State<LetterNoteDropdown> {
  double chosenLetter = 4;
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
          value: chosenLetter,
          elevation: 16,
          iconEnabledColor: Constants.mainColor.shade800,
          onChanged: (value) {
            setState(() {
              chosenLetter = value!;
              widget.onLetterChose(chosenLetter);
            });
          },
          items: DataHelper.tumDerslerinHarfleri()),
    );
  }
}
