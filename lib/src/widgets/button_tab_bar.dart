import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/formatters.dart';

class ButtonTabBarModel with ChangeNotifier {
  int _currentTab = 0;
  final List<DateTime> _tabs = [];

  ButtonTabBarModel();

  UnmodifiableListView<DateTime> get thursdays => UnmodifiableListView(_tabs);

  DateTime? get currentTab {
    if (_tabs.length > _currentTab) {
      return _tabs[_currentTab];
    } else {
      return null;
    }
  }

  DateTime? get previousTab {
    if (_tabs.length > (_currentTab + 1)) {
      return _tabs[_currentTab + 1];
    } else {
      return null;
    }
  }

  DateTime? get nextTab {
    if ((_tabs.length > (_currentTab - 1)) && (_currentTab > 0)) {
      return _tabs[_currentTab - 1];
    } else {
      return null;
    }
  }

  next() async {
    if (_currentTab > 0) {
      _currentTab -= 1;
      notifyListeners();
    }
  }

  previous() async {
    if ((_currentTab + 1) < _tabs.length) {
      _currentTab += 1;
      notifyListeners();
    }
  }
}

class ButtonTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ButtonTabBarModel(),
      child: Consumer<ButtonTabBarModel>(
        builder: (_, model, __) => ButtonBar(
            alignment: MainAxisAlignment.center,
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            buttonPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            //buttonHeight: 21,
            children: <Widget>[
              ElevatedButton(
                child: Text(model.previousTab == null
                    ? '...'
                    : '${fullDateFormatter.format(model!.previousTab)}'),
                onPressed: model.previousTab == null
                    ? null
                    : () {
                        model.previous();
                      },
              ),
              ElevatedButton(
                //color: Theme.of(context).bottomAppBarColor,
                //color:Colors.white,
                //color: Colors.deepOrange,
                child: Text('${fullDateFormatter.format(model.currentTab)}'),
                onPressed: model.currentTab == null ? null : () {},
              ),
              ElevatedButton(
                child: Text(model.nextTab == null
                    ? '...'
                    : '${fullDateFormatter.format(model!.nextTab)}'),
                onPressed: model.nextTab == null
                    ? null
                    : () {
                        model.next();
                      },
              ),
            ]),
      ),
    );
  }
}
