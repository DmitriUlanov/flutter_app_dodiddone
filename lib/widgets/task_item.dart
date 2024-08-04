import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Импортируем пакет intl

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime deadline;
  // final Duration duration; // Добавляем свойство для продолжительности

  const TaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.deadline,
    //required this.duration, // Передаем продолжительность
  });

  @override
  Widget build(BuildContext context) {
    // Форматируем дедлайн в нужном формате
    String formattedDeadline = DateFormat('dd.MM.yy HH:mm').format(deadline);

    // Определяем градиент в зависимости от времени до дедлайна
    Duration timeUntilDeadline = deadline.difference(DateTime.now());
    Color gradientStart;
    if (timeUntilDeadline.inDays < 1) {
      gradientStart = Colors.red; // Срочная
    } else if (timeUntilDeadline.inDays < 3) {
      gradientStart = Colors.yellow; // Средняя срочность
    } else {
      gradientStart = Colors.green; // Не срочная
    }

    Gradient gradient = LinearGradient(
      colors: [gradientStart, Colors.white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container( // Добавляем Container для градиента
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Черный текст для контраста
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку "Редактировать"
                    // Например, можно открыть диалог для редактирования задачи
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Редактировать задачу'),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              // Ввод текста для редактирования названия задачи
                            ),
                            TextField(
                              // Ввод текста для редактирования описания задачи
                            ),
                            // Добавить поле для редактирования дедлайна
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Отмена'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Сохранение изменений задачи
                              Navigator.pop(context);
                            },
                            child: const Text('Сохранить'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку "Удалить"
                    // Например, можно показать диалог с подтверждением удаления
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Удалить задачу'),
                        content: const Text('Вы уверены, что хотите удалить эту задачу?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Отмена'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Удаление задачи
                              Navigator.pop(context);
                            },
                            child: const Text('Удалить'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Дедлайн: $formattedDeadline', // Используем отформатированный дедлайн
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
