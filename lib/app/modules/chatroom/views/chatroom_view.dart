import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chatroom_controller.dart';

class ChatroomView extends GetView<ChatroomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ChatRoomView',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text('ChatRoomView', style: TextStyle(fontSize: 13)),
            ],
          ),
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.asset('assets/logo/noimage.png'),
                  )
                ],
              ),
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.grey[100],
              child: ListView(
                children: [
                  itemChat(
                    isSender: true,
                  ),
                  itemChat(
                    isSender: false,
                  ),
                  itemChat(
                    isSender: true,
                  )
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: Get.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                            // prefixIcon: IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(Icons.emoji_emotions_outlined)),
                            border: OutlineInputBorder()),
                      ),
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Material(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
            // Container(
            //     height: 235,
            //     child: EmojiPicker(
            //       onEmojiSelected: (category, emoji) {
            //         // Do something when emoji is tapped
            //       },
            //       onBackspacePressed: () {
            //         // Backspace-Button tapped logic
            //         // Remove this line to also remove the button in the UI
            //       },
            //       config: Config(
            //         columns: 7,
            //         emojiSizeMax:
            //             32, // Issue: https://github.com/flutter/flutter/issues/28894
            //         verticalSpacing: 0,
            //         horizontalSpacing: 0,
            //         gridPadding: EdgeInsets.zero,
            //         initCategory: Category.RECENT,
            //         bgColor: Color(0xFFF2F2F2),
            //         indicatorColor: Colors.blue,
            //         iconColor: Colors.grey,
            //         iconColorSelected: Colors.blue,
            //         progressIndicatorColor: Colors.blue,
            //         backspaceColor: Colors.blue,
            //         skinToneDialogBgColor: Colors.white,
            //         skinToneIndicatorColor: Colors.grey,
            //         enableSkinTones: true,
            //         showRecentsTab: true,
            //         recentsLimit: 28,
            //         noRecents: const Text(
            //           'No Recents',
            //           style: TextStyle(fontSize: 20, color: Colors.black26),
            //           textAlign: TextAlign.center,
            //         ),
            //         tabIndicatorAnimDuration: kTabScrollDuration,
            //         categoryIcons: const CategoryIcons(),
            //         buttonMode: ButtonMode.MATERIAL,
            //       ),
            //     ))
          ],
        ));
  }
}

class itemChat extends StatelessWidget {
  const itemChat({
    Key? key,
    required this.isSender,
  }) : super(key: key);
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: isSender
                      ? BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15))
                      : BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
              padding: EdgeInsets.all(20),
              child: Text(
                'Haloo testing 123 hellooooooooo',
                style: TextStyle(color: Colors.black),
              )),
          SizedBox(
            height: 5,
          ),
          Text('18:08')
        ],
      ),
    );
  }
}
