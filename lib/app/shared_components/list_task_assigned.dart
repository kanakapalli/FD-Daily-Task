import 'package:daily_task/app/constans/app_constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListTaskAssignedData {
  const ListTaskAssignedData({
    required this.icon,
    required this.label,
    required this.jobDesk,
    this.editDate,
    this.assignTo,
  });

  final String? assignTo;
  final DateTime? editDate;
  final Icon icon;
  final String jobDesk;
  final String label;
}

class ListTaskAssigned extends StatelessWidget {
  const ListTaskAssigned({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Function()? onPressedAssign;
  final Function()? onPressedMember;
  final ListTaskAssignedData data;
  final Function() onPressed;

  Widget _buildIcon() {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: Image.asset(ImagePath.jam),
    );
  }

  Widget _buildTitle() {
    return Text(
      data.label,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    String edit = "";

    if (data.editDate != null) {
      edit = " \u2022 edited ${timeago.format(data.editDate!)}";
    }

    return Text(
      data.jobDesk + edit,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign() {
    return (data.assignTo != null)
        ? Container(
            padding: const EdgeInsets.all(6),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: const Text("in review"),
          )
        : DottedBorder(
            color: kFontColorPallets[1],
            strokeWidth: .3,
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            child: IconButton(
              onPressed: onPressedAssign,
              color: kFontColorPallets[1],
              iconSize: 15,
              icon: const Icon(EvaIcons.plus),
              splashRadius: 24,
              tooltip: "assign",
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 12, right: 12, left: 12),
      onTap: onPressed,
      hoverColor: Colors.green.withOpacity(0.3),
      visualDensity: const VisualDensity(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      leading: _buildIcon(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      trailing: _buildAssign(),
    );
  }
}
