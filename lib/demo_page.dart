import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/animation/animation_demo.dart';
import 'package:flutter_demo/demo/dart/async_demo.dart';
import 'package:flutter_demo/demo/dart/stream_demo.dart';
import 'package:flutter_demo/demo/dart/timer_demo.dart';
import 'package:flutter_demo/demo/drawer/drag_drawer_demo.dart';
import 'package:flutter_demo/demo/flip/flip_demo.dart';
import 'package:flutter_demo/demo/floatbox/float_dragable_demo.dart';
import 'package:flutter_demo/demo/floatbox/float_overlay_demo.dart';
import 'package:flutter_demo/demo/floatbox/float_stack_demo.dart';
import 'package:flutter_demo/demo/gesture/gestrue_scale_demo1.dart';
import 'package:flutter_demo/demo/gesture/gestrue_scale_demo2.dart';
import 'package:flutter_demo/demo/lifecycle/statefullifecycle_demo.dart';
import 'package:flutter_demo/demo/lifecycle/statelessLifecycle_demo.dart';
import 'package:flutter_demo/demo/painter/canvas_douyin_demo.dart';
import 'package:flutter_demo/demo/painter/painter_demo.dart';
import 'package:flutter_demo/demo/router/router_ani_demo.dart';
import 'package:flutter_demo/demo/router/router_data_demo.dart';
import 'package:flutter_demo/demo/router/router_demo.dart';
import 'package:flutter_demo/demo/scroll/scroll_demo.dart';
import 'package:flutter_demo/demo/scroll/scroll_view_demo.dart';
import 'package:flutter_demo/part/charts_flutter_demo.dart';
import 'package:flutter_demo/part/refresh_demo.dart';
import 'package:flutter_demo/part/swiper_demo.dart';
import 'package:flutter_demo/ui/bottom_nav_demo.dart';
import 'package:flutter_demo/ui/container_demo.dart';
import 'package:flutter_demo/ui/dialog_demo.dart';
import 'package:flutter_demo/ui/icon_demo.dart';
import 'package:flutter_demo/ui/image_demo.dart';
import 'package:flutter_demo/ui/table_demo.dart';
import 'package:flutter_demo/ui/textField_demo.dart';
import 'package:flutter_demo/ui/text_demo.dart';
import 'package:flutter_demo/ui/theme_demo.dart';

class DemoPage extends StatefulWidget {
  String type;

  DemoPage(this.type);

  @override
  _UIDemoState createState() => _UIDemoState();
}

class _UIDemoState extends State<DemoPage> {
  HashMap<String, Widget> demos = new HashMap();

  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case "ui":
        demos["底部导航"] = BottomNavDemo();
        demos["弹窗"] = DialogDemo();
        demos['Scroll'] = ScrollViewDemo();
        demos['文本'] = TextDemo();
        demos['表格'] = TableDemo();
        demos['主题模式'] = ThemeDemo();
        demos['图片'] = ImageDemo();
        demos['container'] = ContainerDemo();
        demos['输入框'] = TextFieldDemo();
        demos['icon资源'] = IconDemo();
        break;
      case "part":
        demos["轮播组件"] = SwiperDemo();
        demos["列表刷新组件"] = RefreshDemo();
        demos["charts_flutter"] = ChartsDemo();
        break;
      case "other":
        demos["drawer"] = DrawerDemo();
        demos["flip"] = FlipDemo();
        demos["animation"] = AnimationDemo();
        break;
      case "dart":
        demos["async"] = AsyncDemo();
        demos["stream"] = StreamDemo();
        demos["stream"] = StreamDemo();
        demos["计时器Timer"] = TimerDemo();
        break;
      case "life":
        demos["Stateful"] = StatefulLifecycleDemo();
        demos["Stateless"] = StatelessLifecycleDemo();
        break;
      case "router":
        demos["router"] = RouterDemo();
        demos["RootRouter"] = RouterDemo();
        demos["DataRouter"] = RouterDataDemo();
        demos["AniRouter"] = RouterDAniDemo();
        break;
      case "canvas":
        demos["画布基础"] = PainterDemo();
        demos["画布抖音"] = CanvasDouyinDemo();
        break;
      case "float":
        demos["OverlayFloat"] = FloatOverLayDemo();
        demos["StackFloat"] = FloatStackDemo();
        demos["DraggableFloat"] = FloatDraggableDemo();
        break;
      case "gesture":
        demos["图片缩放和位移"] = GestureScaleDemo1();
        demos["图片缩放"] = GestureScaleDemo2();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: demos.entries.map((item) {
            return RaisedButton(
              child: Text(item.key),
              onPressed: () {
                if (item.key == "RootRouter") {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => item.value),
                    ModalRoute.withName('/222'),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => item.value,
                    ),
                  );
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
