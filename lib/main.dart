import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/utils/env.dart';

void main() async {
  await Env.load();
  runApp(const ProviderScope(child: App()));
}
