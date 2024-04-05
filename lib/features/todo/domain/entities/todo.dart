import 'package:equatable/equatable.dart';

class Todo extends Equatable {
    int userId;
    int id;
    String title;
    bool completed;

    Todo({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });
    
      @override
      List<Object?> get props => [userId, id, title, completed];

  
}