import 'package:flutter/material.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _TopHeader(),
      _MovieName(),
      _MovieDateAndTime(),
      _MovieDescription(),
      _MovieAutors(),
    ],);
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image(image: AssetImage('assets/images/fokus.jpg')),          
          Container(
            height: 184.0,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                    colors: [
                      Colors.transparent,
                      Color.fromRGBO(33, 33, 95, 1),
                    ],
                    stops: [
                      0.6,
                      1.0
                    ])),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(image: AssetImage('assets/images/cinderella.jpg')))
          ),
      ],);
  }
}

class _MovieName extends StatelessWidget {
  const _MovieName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'Фокус-покус 2 ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20,)),
            TextSpan(text: ' (2022)', style: TextStyle(fontSize: 16, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}

class _MovieDateAndTime extends StatelessWidget {
  const _MovieDateAndTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(29, 29, 85, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 95),
        child: Text(
          'R, 30/09/2022 (US) 1h 47m \nфэнтези, комедия, семейный',
          style: TextStyle(color: Colors.white, fontSize: 16),
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _MovieDescription extends StatelessWidget {
  const _MovieDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Back and more glorious than ever.', style: TextStyle(color: Colors.white),),
        Text('Обзор', style: TextStyle(color: Colors.white),),
        Text('Три девушки объединяются, чтобы остановить сестёр Сандерсон, которые вернулись в современный Салем 29 лет спустя.', style: TextStyle(color: Colors.white),),
      ],
    );
  }
}

class _MovieAutors extends StatelessWidget {
  _MovieAutors({Key? key}) : super(key: key);

  final mainTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
  final textStyle = TextStyle(color: Colors.white,);

  @override
  Widget build(BuildContext context) {
    return Column(      
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Text('David Kirschner', style: mainTextStyle),
                Text('Characters, Story', style: textStyle),
              ],
            ),
            Column(
              children: [
                Text('Anne Fletcher', style: mainTextStyle),
                Text('Director', style: textStyle),
              ],
            )
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mick Garris', style: mainTextStyle),
                Text('Characters', style: textStyle),
              ],
            ),
            Column(
              children: [
                Text('Blake Harris', style: mainTextStyle),
                Text('Story', style: textStyle),
              ],
            )
          ],
        ),
      ],
    );
  }
}