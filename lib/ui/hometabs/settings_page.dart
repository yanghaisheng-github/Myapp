import 'package:flutter/material.dart';
import 'package:flui/src/widgets/static_list.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchValue = false;

  handleTap() {
    print('tap cell');
  }

  onChanged(bool value) => setState(() => _switchValue = value);

  List<FLStaticSectionData> _buildList() {
    return [
      FLStaticSectionData(headerTitle: '账号', itemList: [
        FLStaticItemData(
            title: '账号管理',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            onTap: handleTap),
        FLStaticItemData(
            title: '账号与安全',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            onTap: handleTap),
      ]),
      FLStaticSectionData(headerTitle: '设置', itemList: [
        FLStaticItemData(
            title: '推送通知设置',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            accessoryString: '全部通知',
            onTap: handleTap),
        FLStaticItemData(
          title: '护眼模式',
          accessoryType: FLStaticListCellAccessoryType.accSwitch,
          onChanged: onChanged,
          switchValue: _switchValue,
        ),
        FLStaticItemData(
          title: '自动清理缓存',
          subtitle: '每 10 天清理一次',
          accessoryType: FLStaticListCellAccessoryType.accCheckmark,
          onTap: handleTap,
          selected: true,
        )
      ]),
      FLStaticSectionData(itemList: [
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: '切换账号',
            buttonTitleColor: Colors.blue,
            onButtonPressed: () {
              print('切换账号');
            }),
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: '退出',
            buttonTitleColor: Colors.red,
            onButtonPressed: () {
              print('退出');
            })
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: FLStaticListView(
          shrinkWrap: true,
          sections: _buildList(),
        ));
  }
}
