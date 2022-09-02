import 'package:dynamic_ort_hesapla/constants/app_constants.dart';
import 'package:dynamic_ort_hesapla/helper/data_helper.dart';
import 'package:dynamic_ort_hesapla/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({Key? key, required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> lessons = DataHelper.allLessons;
    return lessons.isNotEmpty
        ? ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Card(
                  child: ListTile(
                    title: Text(lessons[index].name),
                    leading: CircleAvatar(
                      backgroundColor: Constants.mainColor,
                      child: Text('${index + 1}'),
                    ),
                    trailing: Text(
                      lessons[index].letter,
                      style: Constants.showAvarageBodyStyle,
                    ),
                    subtitle: Text(
                        'Dersin kredisi : ${lessons[index].credi} Sayısal notu : ${lessons[index].letterNote}'),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              'Lütfen Ders Giriniz',
              style: Constants.titleStyle,
            )),
          );
  }
}
