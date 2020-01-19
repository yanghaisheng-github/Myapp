import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes/transition_route_observer.dart';
import 'routes/route.dart';
import 'utils/SpUtil.dart';

void main() async {

  runApp(MyApp());
  // 这句需要在初始化前执行，没办法
  //WidgetsFlutterBinding.ensureInitialized();
  // 配置初始化
  await SpUtil.init();

  //修改系统设置，以下为设置沉浸式状态栏
  //if (Platform.isAndroid)  //需要import 'dart:io';
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async{
    // String token = SpUtil.getString(BaseConstant.keyAppToken);
    // if(ObjectUtil.isNotEmpty(token)){
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 去掉debug显示
      debugShowCheckedModeBanner: false,
      title: '契约',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.orange,
        cursorColor: Colors.orange,
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          display2: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.orange,
          ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          display4: TextStyle(fontFamily: 'Quicksand'),
          display3: TextStyle(fontFamily: 'Quicksand'),
          display1: TextStyle(fontFamily: 'Quicksand'),
          headline: TextStyle(fontFamily: 'NotoSans'),
          title: TextStyle(fontFamily: 'NotoSans'),
          subhead: TextStyle(fontFamily: 'NotoSans'),
          body2: TextStyle(fontFamily: 'NotoSans'),
          body1: TextStyle(fontFamily: 'NotoSans'),
          subtitle: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      //home: LoginScreen(),
      initialRoute: '/hometabs', //初始化加载的路由
      onGenerateRoute: onGenerateRoute,
      // 继承NavigatorObserver，操作Navigator的相关方法时，回调相关的操作
      navigatorObservers: [TransitionRouteObserver()],
      // routes: {
      //   LoginScreen.routeName: (context) => LoginScreen(),
      //   DashboardScreen.routeName: (context) => DashboardScreen(),
      // },
    );
  }
}
