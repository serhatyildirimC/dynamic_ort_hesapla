import 'package:dynamic_ort_hesapla/helper/data_helper.dart';
import 'package:dynamic_ort_hesapla/model/lesson.dart';
import 'package:dynamic_ort_hesapla/widgets/credits_dropdown.dart';
import 'package:dynamic_ort_hesapla/widgets/lesson_list.dart';
import 'package:dynamic_ort_hesapla/widgets/letter_notes_dropdown.dart';
import 'package:dynamic_ort_hesapla/widgets/show_avarage.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AvarageCalculator extends StatefulWidget {
  const AvarageCalculator({Key? key}) : super(key: key);

  @override
  State<AvarageCalculator> createState() => _AvarageCalculatorState();
}

class _AvarageCalculatorState extends State<AvarageCalculator> {
  double chosenLetter1 = 0;
  double chosenCredit1 = 1;
  String lessonName = '';
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: ShowAvarage(
                      avarage: DataHelper.calculateAvarage(),
                      lessonCount: DataHelper.allLessons.length),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            // ignore: prefer_const_constructors
            Expanded(
              // ignore: prefer_const_constructors
              child: LessonList(
                onDismiss: (index) {
                  DataHelper.allLessons.removeAt(index);
                  setState(() {});
                },
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
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: LetterNoteDropdown(
                  onLetterChose: (chosenLetter) {
                    chosenLetter1 = chosenLetter;
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CreditDropdown(
                  onCreditChose: (chosenCredit) {
                    chosenCredit1 = chosenCredit;
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _addLessonCalculateAvarage();
              },
              icon: const Icon(Icons.arrow_forward_ios_sharp),
              color: Constants.mainColor,
              iconSize: 30,
            ),
          ],
        )
      ]),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        lessonName = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ders adi giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Ders Adi Giriniz',
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.2),
      ),
    );
  }

  void _addLessonCalculateAvarage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var lessonForAdd = Lesson(
          letter: DataHelper.notesToLetter(chosenLetter1),
          name: lessonName,
          letterNote: chosenLetter1,
          credi: chosenCredit1);
      DataHelper.addLesson(lessonForAdd);
      setState(() {});
    }
  }
}
