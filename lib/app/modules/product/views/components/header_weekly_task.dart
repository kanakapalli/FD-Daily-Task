import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/header_text.dart';

class HeaderWeeklyTask extends StatelessWidget {
  const HeaderWeeklyTask(
      {Key? key, required this.title, this.showButtons = false})
      : super(key: key);
  final String title;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderText(title),
        const Spacer(),
        if (showButtons)
          Row(
            children: [
              _buildArchive(),
              const SizedBox(width: 10),
              _buildAddNewButton(),
            ],
          ),
      ],
    );
  }

  Widget _buildAddNewButton() {
    return ElevatedButton.icon(
      icon: const Icon(
        EvaIcons.plus,
        size: 16,
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      label: const Text("New"),
    );
  }

  Widget _buildArchive() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey[850],
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      child: const Text("Archive"),
    );
  }
}
