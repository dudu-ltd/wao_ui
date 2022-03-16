// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
// import 'dart:ffi';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:gl_dart/gl_dart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:example/main.dart';

// Gl gl = Gl(version: GlVersion.GL_VERSION_4_6);

// void glRect(double leftX, double leftY, double rightX, double rightY) {
//   //画封闭曲线
//   gl.begin(GL_LINE_LOOP);
//   //左下角
//   gl.vertex2d(leftX, leftY);
//   //右下角
//   gl.vertex2d(rightX, leftY);
//   //右上角
//   gl.vertex2d(rightX, rightY);
//   //左上角
//   gl.vertex2d(leftX, rightY);
//   //结束画线
//   gl.end();
// }

// //画圆角矩形，传入矩形宽高，角半径，矩形中心点坐标
// void glRoundRec(
//     double centerX, double centerY, double width, double height, double cirR) {
//   //二分之PI，一个象限的角度
//   double PI_HALF = pi / 2;
//   //划分程度,值越大画得越精细
//   double divide = 20.0;
//   //圆角矩形的坐标
//   double tx, ty;
//   //画封闭曲线
//   gl.begin(GL_LINE_LOOP);
//   var opX = [];
//   var opY = [];
//   //四个象限不同的操作符
//   opX[4] = {1, -1, -1, 1};
//   opY[4] = {1, 1, -1, -1};
//   //用来计数，从第一象限到第四象限
//   double x = 0;
//   //x自增时加的值
//   int part = 1 ~/ divide;
//   //计算内矩形宽高一半的数值
//   double w = width / 2 - cirR;
//   double h = height / 2 - cirR;
//   //循环画线
//   for (int x = 0; x < 4; x += part) {
//     //求出弧度
//     double rad = PI_HALF * x;
//     //计算坐标值
//     tx = cirR * cos(rad) + opX[x] * w + centerX;
//     ty = cirR * sin(rad) + opY[x] * h + centerY;
//     //传入坐标画线
//     gl.vertex2f(tx, ty);
//   }
//   //结束画线
//   gl.end();
// }

// //画弧线，相对偏移量XY，开始的弧度，结束的弧度，半径
// void glArc(
//     double x, double y, double start_angle, double end_angle, double radius) {
//   //开始绘制曲线
//   gl.begin(GL_LINE_STRIP);
//   //每次画增加的弧度
//   double delta_angle = pi / 180;
//   //画圆弧
//   for (double i = start_angle; i <= end_angle; i += delta_angle) {
//     //绝对定位加三角函数值
//     double vx = x + radius * cos(i);
//     double vy = y + radius * sin(i);
//     gl.vertex2d(vx, vy);
//   }
//   //结束绘画
//   gl.end();
// }

// //画圆
// void glCircle(double x, double y, double radius) {
//   //画全圆
//   glArc(x, y, 0, 2 * pi, radius);
// }

// //画三角形，传入三个点的坐标
// void glTri(double x1, double y1, double x2, double y2, double x3, double y3) {
//   //画封闭线
//   gl.begin(GL_LINE_LOOP);
//   //一点
//   gl.vertex2d(x1, y1);
//   //二点
//   gl.vertex2d(x2, y2);
//   //三点
//   gl.vertex2d(x3, y3);
//   //结束画线
//   gl.end();
// }

// //画线，传入两点坐标
// void glLine(double x1, double y1, double x2, double y2) {
//   //画封闭线
//   gl.begin(GL_LINE_STRIP);
//   //一点
//   gl.vertex2d(x1, y1);
//   //二点
//   gl.vertex2d(x2, y2);
//   //结束画线
//   gl.end();
// }

// //函数用来画图
// void display() {
//   //GL_COLOR_BUFFER_BIT表示清除颜色
//   gl.clear(GL_COLOR_BUFFER_BIT);
//   //设置画线颜色
//   gl.color3f(0.5, 0.5, 0.5);
//   //画点大小
//   gl.pointSize(2);
//   //画圆角矩形，大肚子
//   glRoundRec(0, 0, 146, 120, 15);
//   //画圆，中间小圈
//   glCircle(0, 0, 10);
//   //画矩形，脖子
//   glRect(-25, 60, 25, 76);
//   //画圆角矩形，大脸
//   glRoundRec(0, 113, 128, 74, 10);
//   //两个眼睛
//   glCircle(-30, 111, 10);
//   glCircle(30, 111, 10);
//   //两条天线
//   glLine(-35, 150, -35, 173);
//   glLine(35, 150, 35, 173);
//   //圆角矩形，两个耳朵
//   glRoundRec(81, 115, 20, 34, 5);
//   glRoundRec(-81, 115, 20, 34, 5);
//   //圆弧，画嘴
//   glArc(0, 133, 11 * pi / 8, 13 * pi / 8, 45);
//   //画三角，肚子里的三角
//   glTri(-30, -15, 30, -15, 0, 28);
//   //画矩形，胳膊连接处
//   glRect(-81, 43, -73, 25);
//   glRect(81, 43, 73, 25);
//   //画矩形，上臂
//   glRect(-108, 45, -81, 0);
//   glRect(108, 45, 81, 0);
//   //画矩形，中臂
//   glRect(-101, 0, -88, -4);
//   glRect(101, 0, 88, -4);
//   //画矩形，下臂
//   glRect(-108, -4, -81, -37);
//   glRect(108, -4, 81, -37);
//   //画圆形，手掌
//   glCircle(-95, -47, 10);
//   glCircle(95, -47, 10);
//   //画腿连接处
//   glRect(-41, -62, -21, -66);
//   glRect(41, -62, 21, -66);
//   //画圆角矩形，大长腿
//   glRoundRec(-32, -92, 38, 52, 10);
//   glRoundRec(32, -92, 38, 52, 10);
//   //画矩形，脚踝
//   glRect(-41, -125, -21, -117);
//   glRect(41, -125, 21, -117);
//   //画矩形，大脚掌
//   glRect(-59, -125, -8, -137);
//   glRect(59, -125, 8, -137);

//   //保证前面的OpenGL命令立即执行，而不是让它们在缓冲区中等待
//   gl.flush();
// }

// //窗口大小变化时调用的函数
// void ChangeSize(int w, int h) {
//   //避免高度为0
//   if (h == 0) {
//     h = 1;
//   }
//   //定义视口大小，宽高一致
//   gl.viewport(0, 0, w, h);
//   double half = 200;
//   //重置坐标系统，使投影变换复位
//   gl.matrixMode(GL_PROJECTION);
//   //将当前的用户坐标系的原点移到了屏幕中心
//   gl.loadIdentity();
//   //定义正交视域体
//   if (w < h) {
//     //如果高度大于宽度，则将高度视角扩大，图形显示居中
//     gl.ortho(-half, half, -half * h / w, half * h / w, -half, half);
//   } else {
//     //如果宽度大于高度，则将宽度视角扩大，图形显示居中
//     gl.ortho(-half * w / h, half * w / h, -half, half, -half, half);
//   }
// }

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     display();
//     //   TextureLayer();
//     // //对GLUT进行初始化，并处理所有的命令行参数
//     // glutInit(&argc, argv);
//     // //指定RGB颜色模式和单缓冲窗口
//     // glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
//     // //定义窗口的位置
//     // glutInitWindowPosition(100, 100);
//     // //定义窗口的大小
//     // glutInitWindowSize(400, 400);
//     // //创建窗口，同时为之命名
//     // glutCreateWindow("OpenGL");
//     // //设置窗口清除颜色为白色
//     // glClearColor(1.0f,1.0f,1.0f,1.0f);
//     // //参数为一个函数，绘图时这个函数就会被调用
//     // glutDisplayFunc(&display);
//     // //参数为一个函数，当窗口大小改变时会被调用
//     // glutReshapeFunc(ChangeSize);
//     // //该函数让GLUT框架开始运行，所有设置的回调函数开始工作，直到用户终止程序为止
//     // glutMainLoop();
//     // //程序返回
//     // return 0;
//   });
// }
