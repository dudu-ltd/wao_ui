// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:gl_dart/gl_dart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:example/main.dart';

// // class F extends Function {}

// Gl gl = Gl(version: GlVersion.GL_VERSION_4_6);
// var a = 3;
// var b = 4;
// var c = 5;
// void init() {
//   // Pointer.fromFunction(() {
//   //   return 1;
//   // });
//   Pointer<Float> mat_specular = Pointer<Float>.fromAddress(a.hashCode);
//   Pointer<Float> mat_shininess = Pointer<Float>.fromAddress(b.hashCode);
//   Pointer<Float> light_position = Pointer<Float>.fromAddress(c.hashCode);
//   gl.begin(GL_POINTS);
//   gl.clearColor(0, 0, 0, 0);
//   gl.shadeModel(GL_SMOOTH);

//   gl.materialfv(GL_FRONT, GL_SPECULAR, mat_specular);
//   gl.materialfv(GL_FRONT, GL_SHININESS, mat_shininess);
//   gl.lightfv(GL_LIGHT0, GL_POSITION, light_position);
//   gl.enable(GL_LIGHTING);
//   gl.enable(GL_LIGHT0);
//   gl.enable(GL_DEPTH_TEST);
//   // gl.createTransformFeedbacks(3, Pointer.fromAddress(333333333));
// }

// /*调用GLUT函数，绘制一个球*/
// void display() {
//   gl.clear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
//   gl.rectf(-0.5, -0.5, 0.5, 0.5);
//   gl.flush();
// }

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     init();
//     display();
//     Pointer.fromAddress(3);
//     print(a);
//     print(b);
//     print(c);
//     expect(1, 1);
//   });
// }
