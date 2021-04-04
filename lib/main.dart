import 'package:flutter/material.dart';
import 'package:packedup/LoginView/LoginView.dart';
import 'package:packedup/Themes/PackedUpTheme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(
      MaterialApp(
        theme: PackedUpThemes().pUpMainTheme,
        home:  LoginView(),
        ),
    );
