import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  Future<void> _sendTextToAPI(String text) async {
    final url = Uri.parse(
        'http://10.0.2.2:5000/predict'); // استبدل بـ IP الجهاز الذي يشغل البايثون

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text': text}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          if (data['prediction'] == 'drug reaction') {
            _result = "Does'nt Fond !";
          } else {
            _result = data['prediction'].toString();
          }
        });
      } else {
        setState(() {
          _result = 'Error: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'أدخل النص هنا'),
            ),
            ElevatedButton(
              onPressed: () => _sendTextToAPI(_controller.text),
              child: const Text('إرسال'),
            ),
            Text('النتيجة: $_result'),
          ],
        ),
      ),
    );
  }
}
