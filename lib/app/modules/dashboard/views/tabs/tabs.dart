import 'package:daily_task/app/modules/dashboard/views/tabs/approvals.dart';
import 'package:daily_task/app/modules/dashboard/views/tabs/overview.dart';
import 'package:daily_task/app/modules/dashboard/views/tabs/uploader.dart';
import 'package:daily_task/app/modules/dashboard/views/tabs/verfication.dart';
import 'package:flutter/widgets.dart';
export './approvals.dart';
export './ocrcheck.dart';
export './overview.dart';
export './verfication.dart';
export './uploader.dart';


import 'ocrcheck.dart';

List<Widget> tabs = [
  const Uploader(),
  const OCRCheck(),
  const Verification(),
  const Approvals(),
  const OverView()
];
