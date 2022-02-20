import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/firebase_options.dart';
import 'package:surf_practice_chat_flutter/screens/chat.dart';
import 'package:surf_practice_chat_flutter/screens/chat_model.dart';
import 'package:surf_practice_chat_flutter/screens/inherited_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyD5bCOfO29kCv2mIdmYa6CEKhud4Gs1YIU',
      iosKey: 'AIzaSyBZo6-selWq9F-oQqwjr9eB2VpSvFc9DYE',
      webKey: 'AIzaSyAtMxD7Nb6Z06IL2yg8DbI56xoneVhXSNQ',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatRepository = ChatRepositoryFirebase(FirebaseFirestore.instance);

    return MaterialApp(
      theme: ThemeData(
          // colorSchemeSeed: Colors.grey,
          // useMaterial3: true,
          ),
      home: ChatModelProvider(
        model: ChatModel(chatRepository: chatRepository),
        child: ChatScreen(),
      ),
    );
  }
}
