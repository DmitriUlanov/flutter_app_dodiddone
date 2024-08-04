import 'package:flutter/material.dart';

import '../screens/all_tasks.dart';
import '../theme/theme.dart';
import '../screens/profile.dart'; // Импортируем profile_page

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  DateTime? _selectedDeadline; // Переменная для хранения выбранного дедлайна

  static const List<Widget> _widgetOptions = <Widget>[
    TaskPage(), // Заменяем Text('Задачи') на TaskPage()
    Text('Сегодня'),
    ProfilePage(), // Заменяем Text('Профиль') на ProfilePage()
    Text('Выполнено'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Функция для показа диалога выбора даты и времени
  void _showDeadlinePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(pickedDate),
      ).then((pickedTime) {
        if (pickedTime == null) return;

        setState(() {
          _selectedDeadline = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Прозрачный AppBar
        elevation: 0, // Убираем тень
      ),
      extendBodyBehindAppBar: true,
      body: Container( // Добавляем Container для градиента
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DoDidDoneTheme.lightTheme.colorScheme.secondary,
              DoDidDoneTheme.lightTheme.colorScheme.primary,
            ],
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Обработка добавления новой задачи
          // Например, можно открыть диалог для ввода текста
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Добавить задачу'),
              content: SizedBox(
                width: 400, // Устанавливаем ширину диалогового окна
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'Название'),
                      // Ввод текста для новой задачи
                    ),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Описание'),
                      // Ввод текста для описания задачи
                    ),
                    // Кнопка выбора дедлайна
                    Padding( // Добавляем Padding для отступа
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: _showDeadlinePicker,
                        child: const Text('Выбрать дедлайн'),
                      ),
                    ),
                    // Отображение выбранного дедлайна
                    if (_selectedDeadline != null)
                      Text(
                        'Выбранный дедлайн: $_selectedDeadline',
                        style: const TextStyle(fontSize: 14),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Отмена'),
                ),
                TextButton(
                  onPressed: () {
                    // Сохранение новой задачи
                    Navigator.pop(context);
                  },
                  child: const Text('Добавить'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
