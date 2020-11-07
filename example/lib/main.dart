/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
  ScreenUtil.init(designSize: Size(750 / 2, 1334 / 2), allowFontScaling: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉Flutter右上角的debug
      title: 'gleam example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'gleam example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        children: [
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              GleamImage(
                  image:
                      'https://tvax2.sinaimg.cn/crop.0.0.1079.1079.1024/00019562ly1gkffsfazmwj20u00tz0uf.jpg?KID=imgbed,tva&Expires=1604654948&ssig=66QSdllaXt',
                  width: 60,
                  height: 60,
                  shape: BoxShape.circle),
              SizedBox(
                width: 16.0,
              ),
              Text(
                'gleam',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            '一个简单、轻量、可靠的Flutter UI 组件库',
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
          SizedBox(
            height: 30.0,
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'BottomSheet 底部菜单弹窗',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Dialog 弹出框',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Empty 空状态',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'FilledButton 填充按钮',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamOutlineButton 细边框按钮',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamTextButton 文字按钮',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamOutlineButton 细边框按钮',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamTextButton 文字按钮',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamTextField 文本输入框',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamIcon 图标',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamImage 图片',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'ImagePicker 照片选择',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Placeholder 占位状态',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Search 搜索',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'ShareSheet 分享面板',
            onPressed: () {},
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Tag 标签',
            onPressed: () {},
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}