import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import '../../../utils/utils.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(text: 'Hello! How can I help you?', isBot: true),
    ChatMessage(text: 'This is a sample response from the bot.', isBot: true),
  ];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Bot'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: _messages[index],
                  isLoading: _isLoading,
                );
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 40.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Iconsax.send),
              onPressed: () {
                _sendMessage(_messageController.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message) async {
    setState(() {
      _isLoading = true;
      _messages.add(ChatMessage(text: message, isBot: false));
      _messages.add(ChatMessage(text: '. . .', isBot: true));
      _messageController.clear();
    });

    try {
      // Gửi yêu cầu API để nhận câu trả lời từ server
      Uri uri = Uri.parse('http://askme.loca.lt/api/askme');
      var response = await http.post(
        uri,
        body: {'question': message},
      );

      // Lấy câu trả lời từ phản hồi API
      String botResponse = response.body;

      setState(() {
        _isLoading = false;
        // Xóa ChatMessage có nội dung là '. . .' nếu _isLoading là false
        _messages
            .removeWhere((message) => message.text == '. . .' && message.isBot);
        _messages.add(ChatMessage(text: botResponse, isBot: true));
      });
    } catch (error) {
      print('Error fetching bot response: $error');
      setState(() {
        _isLoading = false;
        // Xóa ChatMessage có nội dung là '. . .' nếu _isLoading là false và có lỗi
        _messages
            .removeWhere((message) => message.text == '. . .' && message.isBot);
      });
    }
  }
}

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isLoading;

  const MessageBubble({required this.message, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: message.isBot ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            color: message.isBot ? TColors.buttonPrimary : TColors.success,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: TColors.white,
                    ),
              ),
              // if (isLoading)
              //   Padding(
              //     padding: const EdgeInsets.only(top: 8.0),
              //     child: CircularProgressIndicator(
              //       color: TColors.white,
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isBot;

  ChatMessage({required this.text, required this.isBot});
}
