import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true; // Флаг для определения режима (вход/регистрация)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: isLogin
                ? [
                    DoDidDoneTheme.lightTheme.colorScheme.secondary,
                    DoDidDoneTheme.lightTheme.colorScheme.primary,
                  ]
                : [
                    DoDidDoneTheme.lightTheme.colorScheme.primary,
                    DoDidDoneTheme.lightTheme.colorScheme.secondary,
                  ],
            stops: const [0.1, 0.9], // Основной цвет занимает 90%
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Добавляем Image.asset и Text "JUST DO IT" в одну строку
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Добавляем ClipRRect для скругления картинки
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40), // Скругление углов
                    child: Image.asset(
                      'assets/Morty_pic.png', // Замените на правильный путь к файлу
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 10), // Отступ между картинкой и текстом
                  Text(
                    'JUST DO IT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150), // Увеличиваем отступ до 150
              // Добавляем RichText для названия приложения
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'do',
                      style: TextStyle(
                        color: DoDidDoneTheme.lightTheme.colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: '-did-',
                      style: const TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'done',
                      style: TextStyle(
                        color: DoDidDoneTheme.lightTheme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Почта',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Добавляем поле для повтора пароля
              if (!isLogin) // Отображаем только при регистрации
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Повторить пароль',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DoDidDoneTheme.lightTheme.colorScheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(isLogin ? 'Войти' : 'Зарегистрироваться'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin ? 'У меня еще нет аккаунта...' : 'Уже есть аккаунт...',
                  style: TextStyle(
                    color: !isLogin 
                        ? Colors.black // Изменяем цвет на черный, если isLogin == false
                        : DoDidDoneTheme.lightTheme.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
