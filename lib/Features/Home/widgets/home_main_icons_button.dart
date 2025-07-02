
import 'package:firebase1/Features/Ai/presentation/views/ai_page.dart';
import 'package:firebase1/Features/Ask/ask_page.dart';
import 'package:firebase1/Features/Home/widgets/custom_home_icons_item.dart';
import 'package:firebase1/Features/Note/presntation/views/note_page.dart';
import 'package:firebase1/Features/info/info_page.dart';
import 'package:flutter/material.dart';

class HomeMainIconsButton extends StatelessWidget {
  const HomeMainIconsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomHomeIconsItem(
          isGif: true,
          gifPath: 'asset/icons/ai.gif',
          iconText: 'Scan',
          pageName: AiPage(),
          iconSize: 35,
        ),
        CustomHomeIconsItem(
          isGif: true,
          gifPath: 'asset/icons/ask.gif',
          iconText: 'Ask',
          pageName: AskPage(),
          iconSize: 35,
        ),
        CustomHomeIconsItem(
          isGif: true,
          gifPath: 'asset/icons/notes.gif',
          iconText: 'Note',
          pageName: NotePage(),
          iconSize: 35,
        ),
        CustomHomeIconsItem(
          isGif: true,
          gifPath: 'asset/icons/info.gif',
          iconText: 'Info',
          pageName: InfoPage(),
          iconSize: 35,
        ),
      ],
    );
  }
}
