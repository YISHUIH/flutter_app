import 'package:flutter/material.dart';

/// Copyright , 2015-2019,  <br>

/// Author:  1070379530@qq.com <br>

/// Date: 2019/5/6 9:35    <br>

/// Description: 封装的颜色   <br>


class colors{
  static const Color them_bg_gray=Color(0xFFF5F5F5);
  static const Color them_text_gray=Color(0xFFB3B3B3);

  
  static const int _whitePrimaryValue = 0xFFFFFFFF;
  static const MaterialColor white_appbar=MaterialColor(_whitePrimaryValue, <int,Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });
}