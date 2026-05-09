import 'package:logger/logger.dart';

/// This file sets up a global logger instance 
/// can be used throughout the app.
final logger = Logger(
  printer: PrettyPrinter(),
);
