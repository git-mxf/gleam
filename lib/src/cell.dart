/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-11-19 15:43:34 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-19 17:21:25
 */

import 'package:flutter/material.dart';
import 'package:gleam/src/utils.dart';
//TODO: 右侧内容和title对齐
//TODO: 点击水波纹
//TODO: 点击跳转

/// Cell单元格
///
//单元格大小
enum CellSize {
  large, //大号单元格
  small, //小号单元格(默认)
}

//右侧箭头方向
enum CellArrowDirection {
  up, //箭头向上
  down, //箭头向下
  left, //箭头向左
  right, //箭头向右
}

class Cell extends StatelessWidget {
  //左侧标题
  final dynamic title;

  //左侧标题样式(左侧标题是文字时生效)
  final TextStyle titleStyle;

  //右侧内容
  final dynamic value;

  //右侧内容样式(右侧内容是文字时生效)
  final TextStyle valueStyle;

  //标题下方的描述信息
  final dynamic label;

  //标题下方的描述信息样式(标题下方的描述信息是文字时生效)
  final TextStyle labelStyle;

  //单元格大小
  final CellSize size;

  //左侧图标
  final Widget icon;

  //是否开启点击反馈
  final bool clickable;

  //是否展示右侧箭头并开启点击反馈
  final bool isLink;

  //是否显示表单必填星号
  final bool required;

  //是否使内容垂直居中
  final bool center;

  //右侧箭头方向
  final CellArrowDirection arrowDirection;

  //内边距
  final EdgeInsetsGeometry padding;

  //单元格底部分割线
  final BorderSide divider;

  //是否显示单元格底部分割线
  final bool showDivider;

  //点击回调函数
  final Function() onPressed;

  const Cell({
    Key key,
    this.title,
    this.titleStyle = const TextStyle(color: Color(0XFF323233), fontSize: 14.0),
    this.value,
    this.valueStyle = const TextStyle(
      color: Color(0XFF969799),
      fontSize: 14.0,
    ),
    this.label,
    this.labelStyle = const TextStyle(
      color: Color(0XFF969799),
      fontSize: 12.0,
    ),
    this.size = CellSize.small,
    this.icon,
    this.clickable = false,
    this.isLink = false,
    this.required = false,
    this.center = false,
    this.arrowDirection = CellArrowDirection.right,
    this.padding = const EdgeInsets.all(0),
    this.divider,
    this.showDivider = true,
    this.onPressed,
  }) : super(key: key);

  //右侧箭头
  Widget _arrowIcon([CellArrowDirection cellArrowDirection]) {
    IconData _iconData = Icons.chevron_right;
    switch (cellArrowDirection) {
      case CellArrowDirection.up:
        _iconData = Icons.expand_less;
        break;

      case CellArrowDirection.down:
        _iconData = Icons.expand_more;
        break;

      case CellArrowDirection.left:
        _iconData = Icons.chevron_left;
        break;

      case CellArrowDirection.right:
        _iconData = Icons.chevron_right;
        break;
      default:
    }

    Widget _arrow = Icon(
      _iconData,
      color: Color(0XFF969799),
    );
    return _arrow;
  }

  @override
  Widget build(BuildContext context) {
    Widget _title;
    Widget _value;
    Widget _label;

    //如果只设置value, 在value展示在title的位置且使用title的样式
    if (title == null && value != null && label == null) {
      _title = dynamicText(value, titleStyle);
      _value = null;
      _label = null;
    } else {
      _title = dynamicText(title, titleStyle);
      _value = dynamicText(value, valueStyle);
      _label = dynamicText(label, labelStyle);
    }

    _title = Row(
      children: [
        Offstage(
          offstage: icon != null ? false : true,
          child: icon,
        ),
        _title
      ],
    );

    if (_value != null || isLink) {
      Widget _arrow = _arrowIcon(arrowDirection);
      List<Widget> _children = [];
      if (_value != null) {
        _children.add(_value);
      }
      _children.add(
        Offstage(
          offstage: isLink ? false : true,
          child: _arrow,
        ),
      );
      _value = Row(
        mainAxisSize: MainAxisSize.min,
        children: _children,
      );
    }

    Decoration _decoration = BoxDecoration(
      border: Border(
        bottom: showDivider
            ? divider ??
                Divider.createBorderSide(context,
                    color: Color(0XFFEBEDF0), width: 1.0)
            : BorderSide.none,
      ),
    );

    ListTile _tile = ListTile(
      contentPadding: padding,
      title: _title,
      trailing: _value,
      subtitle: _label,
      //设置tileColor后,会没有水波纹
      // tileColor: Color(0XFFF7F8FA),
      // selectedTileColor: Colors.red,
      enabled: isLink,
      dense: true,
      onTap: onPressed,
    );

    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: _decoration,
      child: _tile,
    );
  }
}
