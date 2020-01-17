import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import '../utils/SpUtil.dart';
import '../config/keys.dart';

class StorageManager {
  /// 网络连接
  var connect;

  initAutoLogin() async {
    try {
      // 监测网络变化
      connect = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        if (result != ConnectivityResult.mobile &&
            result != ConnectivityResult.wifi) {
          await SpUtil.instance.saveBoolean(Keys.brokenNetwork, true);
        } else {
          await SpUtil.instance.saveBoolean(Keys.brokenNetwork, false);
          // final hasLogged =
          //     await SpUtil.instance.getBoolean(Keys.hasLogged);
          // final currentUser = await im.getCurrentLoginUser();
          // if (hasLogged) if (currentUser == '' || currentUser == null) {
          //   final account = await SpUtil.instance.getString(Keys.account);
          //   im.imAutoLogin(account);
          // }
        }
      });
    } on PlatformException {
      print('你已登录或者其他错误');
    }
  }
}
