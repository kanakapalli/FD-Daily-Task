import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskProgressData {
  final int totalTask;
  final int totalCompleted;

  const TaskProgressData({
    required this.totalTask,
    required this.totalCompleted,
  });
}

class TaskProgress extends StatelessWidget {
  const TaskProgress({
    required this.data,
    Key? key,
  }) : super(key: key);

  final TaskProgressData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildText(context),
        Expanded(child: _buildProgress(context)),
      ],
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      "${data.totalCompleted} of ${data.totalTask} completed",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
        fontSize: 13,
      ),
    );
  }

  Widget _buildProgress(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      progressColor: Theme.of(context).primaryColor,
      percent: data.totalCompleted / data.totalTask,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
    );
  }
}
