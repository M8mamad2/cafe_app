
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/data/model/message_model.dart';
import 'package:cafe_mobile/src/view/presentation/widget/chat_widgets/chat_receiver_bubble_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/chat_widgets/chat_sender_bubble_widget.dart';
import 'package:flutter/material.dart';

class ChatListViewBuilderWidget extends StatelessWidget {
  final ScrollController scrollController;
  final FocusNode focusNode;
  final List<MessageModel> messages;
  const ChatListViewBuilderWidget({super.key, required this.scrollController, required this.focusNode, required this.messages});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.width*0.04),
      child: Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap:()=> focusNode.unfocus(),
          child: ListView.builder(
            reverse: true,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              MessageModel message = messages.reversed.toList()[index];
              return message.sender.contains('1') 
                ? ChatReceiverBubbleWidget(receiverMessage: message.data) 
                : ChatSenderBubbleWidget(senderMessage: message.data);
            }
          ),
        ),
      ),
    );
  }
}
