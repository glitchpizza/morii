import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:morii/views/LocalTimeline.dart';

var personalTLHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LocalTimeline(); // TODO: Change this to PersonalTimeline when implemented
});

var localTLHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LocalTimeline();
});

var notificationsHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return null;
});