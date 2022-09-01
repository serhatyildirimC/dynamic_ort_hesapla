import 'package:dynamic_ort_hesapla/helper/data_helper.dart';
import 'package:dynamic_ort_hesapla/widgets/show_avarage.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AvarageCalculator extends StatefulWidget {
  const AvarageCalculator({Key? key}) : super(key: key);

  @override
  State<AvarageCalculator> createState() => _AvarageCalculatorState();
}

class _AvarageCalculatorState extends State<AvarageCalculator> {
  double? chosenLetter;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Constants.titleText,
              style: Constants.titleStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  child: ShowAvarage(avarage: 2.57412724, lessonCount: 5),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Text('LIST YER TUTUCU'),
              ),
            ),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        _buildTextFormField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildLetterNotes(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.abc_sharp),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.abc_sharp),
            ),
          ],
        )
      ]),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'asdfsdag',
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
        ),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.2),
      ),
    );
  }

  _buildLetterNotes() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              chosenLetter = value;
            });
          },
          items: DataHelper.tumDerslerinHarfleri()),
    );
  }
}
