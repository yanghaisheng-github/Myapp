import 'package:shared_preferences/shared_preferences.dart';
import '../config/keys.dart';

class SpUtil {
  // app全局配置
  static SharedPreferences sp;
  // SharedPreferences初始化
  static init() async {
    sp = await SharedPreferences.getInstance();
  }

  // 单例模式: 使用factory关键字修饰构造函数
  factory SpUtil() => _getInstance();
  static SpUtil _instance;
  static SpUtil get instance =>  _getInstance();
  SpUtil._internal(){
    // 命名构造函数，实例初始化操作，单例模式中只会被执行一次
    // 当没有函数体的时候可以直接简写为：SpUtil_();
  }
  static SpUtil _getInstance(){
    if (_instance == null) {
      _instance = new SpUtil._internal();
    }
    return _instance;
  }

  Future saveString(String key, String value) async {
    if (key == Keys.account) {
      await  sp.setString(key, value);
      return;
    }
    String account =  sp.getString(Keys.account) ?? "default";
    await  sp.setString(key + account, value);
  }

  Future saveInt(String key, int value) async {
    String account =  sp.getString(Keys.account) ?? "default";
    await  sp.setInt(key + account, value);
  }

  Future saveDouble(String key, double value) async {
    String account =  sp.getString(Keys.account) ?? "default";
    await  sp.setDouble(key + account, value);
  }

  Future saveBoolean(String key, bool value) async {
    String account =  sp.getString(Keys.account) ?? "default";
    await  sp.setBool(key + account, value);
  }

  Future saveStringList(String key, List<String> list) async {
    String account =  sp.getString(Keys.account) ?? "default";
    await  sp.setStringList(key + account, list);
  }

  Future<bool> readAndSaveList(String key, String data) async {
    String account =  sp.getString(Keys.account) ?? "default";
    List<String> strings =  sp.getStringList(key + account) ?? [];
    if (strings.length >= 10) return false;
    strings.add(data);
    await  sp.setStringList(key + account, strings);
    return true;
  }

  void readAndExchangeList(String key, String data, int index) async {
    String account =  sp.getString(Keys.account) ?? "default";
    List<String> strings =  sp.getStringList(key + account) ?? [];
    strings[index] = data;
    await  sp.setStringList(key + account, strings);
  }

  void readAndRemoveList(String key, int index) async {
    String account =  sp.getString(Keys.account) ?? "default";
    List<String> strings =  sp.getStringList(key + account) ?? [];
    strings.removeAt(index);
    await  sp.setStringList(key + account, strings);
  }

  /// get
  Future<String> getString(String key) async {
    if (key == Keys.account) {
      return  sp.getString(key);
    }
    String account =  sp.getString(Keys.account) ?? "default";
    return  sp.getString(key + account);
  }

  Future<int> getInt(String key) async {
    String account =  sp.getString(Keys.account) ?? "default";
    return  sp.getInt(key + account);
  }

  Future<double> getDouble(String key) async {
    String account =  sp.getString(Keys.account) ?? "default";
    return  sp.getDouble(key + account);
  }

  Future<bool> getBoolean(String key) async {
    String account =  sp.getString(Keys.account) ?? "default";
    return  sp.getBool(key + account) ?? false;
  }

  Future<List<String>> getStringList(String key) async {
    String account =  sp.getString(Keys.account) ?? "default";
    return  sp.getStringList(key + account);
  }

  Future<List<String>> readList(String key) async {
    String account =  sp.getString(Keys.account) ?? "default";
    List<String> strings =  sp.getStringList(key + account) ?? [];
    return strings;
  }
}
