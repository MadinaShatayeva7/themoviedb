import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget{
  AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() {
    return _AuthWidgetState();
  }
}

class _AuthWidgetState extends State<AuthWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('THE MOVIE DB'), centerTitle: true,),
      body: ListView(
        children: [
          _AuthUnfo(),
        ],
      ),
    );
  }
}

class _AuthUnfo extends StatelessWidget {
  //final _AuthUnfo({Key? key}) : super(key: key);

  final textStyle = TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          Text('Войти в свою учётную запись', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          SizedBox(height: 10,),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text:
                      'Чтобы пользоваться правкой и возможностями рейтинга TMDb, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой.',
                  style: textStyle),
              TextSpan(
                  text: ' Нажмите здесь',
                  style: TextStyle(color: Color.fromRGBO(1, 180, 228, 1), fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('Нажмите здесь')),
              TextSpan(text: ', чтобы начать.', style: textStyle),
            ],
          )),          
          SizedBox(height: 20,),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text:
                      'Если Вы зарегистрировались, но не получили письмо для подтверждения,',
                  style: textStyle),
              TextSpan(
                  text: ' нажмите здесь',
                  style: TextStyle(color: Color.fromRGBO(1, 180, 228, 1), fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('нажмите здесь,')),
              TextSpan(text: ', чтобы отправить письмо повторно.', style: textStyle),
            ],
          )),
          SizedBox(height: 25,),
          _FormWidget(),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget{
  _FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<_FormWidget>{
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth(){
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    
    setState(() {
      if(login == 'admin' && password == 'admin'){
        errorText = null;

        Navigator.of(context).pushNamed('/main_screen');
      } else {
        errorText = 'Неверный логин или пароль';
      }
    });
  }
  void _password() {
    print('add password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 16, color: Color.fromRGBO(33, 37, 41, 1));
    final textFieldDecorator = InputDecoration(isCollapsed: true, border: OutlineInputBorder(), contentPadding: EdgeInsets.all(10));
    final buttonColor = (Color.fromRGBO(1, 180, 228, 1));
    final buttonStyle = ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white), backgroundColor: MaterialStateProperty.all(buttonColor), padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 17, vertical: 8)));
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(errorText != null)
          ...[Text(errorText, style: TextStyle(color: Colors.red, fontSize: 16),),
          SizedBox(height: 10,)]
        ,
        Text('Имя пользователя', style: textStyle,),
        SizedBox(height: 5,),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        SizedBox(height: 20,),
        Text('Пароль', style: textStyle,),
        SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator, obscureText: true,),
        SizedBox(height: 25,),
        Row(children: [
          ElevatedButton(onPressed: _auth, child: Text('Войти', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),), style: buttonStyle,),
          SizedBox(width: 20,),
          TextButton(
            onPressed: _password, 
            child: const Text('Сбросить пароль'), 
            style: AppButtonStyle.linkButton),
        ],)
      ],
    );
  }
}