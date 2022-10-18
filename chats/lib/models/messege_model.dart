import 'package:chats/models/user_model.dart';

class Message
{
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  Message({required this.isLiked,required this.sender,required this.text,required this.time,required this.unread});
}
//current user

final User currentUser=User(

  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/rubel.jpg',
);
//USERS
final User emma =User(
  id: 1,
  name: 'Emma',
  imageUrl: 'assets/images/emma.jpg',
);
final User sajib =User(
  id: 2,
  name: 'Sajib',
  imageUrl:'assets/images/sajib.jpg' ,
);
final User himel =User(
  id: 3,
  name: 'Himel',
  imageUrl:'assets/images/himel.jpg' ,
);
final User imran =User(
  id: 4,
  name: 'Imran',
  imageUrl: 'assets/images/imran.jpg',
);
final User rita =User(
  id: 5,
  name: 'Rita',
  imageUrl:'assets/images/rita.jpg' ,
);
final User dulon =User(
  id: 6,
  name: 'Dulon',
  imageUrl: 'assets/images/dulon.jpg',
);
final User rubel =User(
  id: 7,
  name: 'Rubel',
  imageUrl:'assets/images/rubel.jpg' ,
);

//Favorite Contacts
List<User> favorites=[rubel,dulon,imran,sajib,rita];

//Example chats on home screen

List<Message> chats = [
  Message(
    sender: rubel,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: dulon,
    time: '4:30 PM',
    text: 'Hey, how are you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: emma,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: rita,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sajib,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: rita,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: dulon,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: rubel,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sajib,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: dulon,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: rubel,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
