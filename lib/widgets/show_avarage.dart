import 'package:dynamic_ort_hesapla/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

class ShowAvarage extends StatelessWidget {
  final double avarage;
  final int lessonCount;
  const ShowAvarage(
      {Key? key, required this.avarage, required this.lessonCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? '$lessonCount Ders Girildi' : 'Ders Seciniz',
          style: Constants.showAvarageBodyStyle,
        ),
        Text(
          avarage >= 0 ? avarage.toStringAsFixed(2) : '0,0',
          style: Constants.avarageStyle,
        ),
        Text(
          'Ortalama',
          style: Constants.showAvarageBodyStyle,
        ),
      ],
    );
  }
}
