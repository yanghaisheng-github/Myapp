# Myapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 修改第三方包flutter_login
   - 修改src/widget_help.dart，将通知汉化：`Success`改成`成功`，`Error`改成`失败`。
   - 修改src/widgets/aut_card.dart，修改class _LoginCardState中build方法的final authForm变量
     - 将登录按钮`_buildSubmitButton`放到`_buildForgotPassword`和`_buildSwitchAuthButton`的前面，并添加`SizedBox`和`Row`，如下：
     -    SizedBox(height: 20,),
          Container(
            padding: Paddings.fromRBL(cardPadding),
            width: cardWidth,
            child: Column(
              children: <Widget>[
                _buildSubmitButton(theme, messages),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  _buildForgotPassword(theme, messages),
                  _buildSwitchAuthButton(theme, messages),
                ],)
              ],
            ),
          ),
