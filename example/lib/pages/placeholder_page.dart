/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/material.dart';
import 'package:gleam/style/style.dart';
import 'package:oktoast/oktoast.dart';

/// PlaceholderPage占位状态示例程序
class PlaceholderPage extends StatefulWidget {
  PlaceholderPage({Key key}) : super(key: key);

  @override
  _PlaceholderPageState createState() => _PlaceholderPageState();
}

class _PlaceholderPageState extends State<PlaceholderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        children: ListTile.divideTiles(context: context, tiles: [
          //提出弹窗
          ListTile(
              title: Text(
                '提示弹窗',
                style: Style.normal15Color333333,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              onTap: () {
                showToast('确定');
              }),
        ]).toList(),
      ),
    );
  }
}
