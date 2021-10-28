import 'package:flutter/material.dart';
import 'package:my_song_book/components/Dashboard/DashboardPage.dart';
import 'package:my_song_book/components/Favorites/FavoritesPage.dart';
import 'package:my_song_book/components/Lists/ListsPage.dart';
import 'package:my_song_book/components/Main/HomeMenu/MenuButton.dart';
import 'package:my_song_book/components/Settings/SettingsPage.dart';
import 'package:my_song_book/components/Sheets/SheetsPage.dart';
import 'package:my_song_book/home_menu_icons_icons.dart';
import 'package:my_song_book/logic/HomeMenuItem.dart';
import 'package:my_song_book/managers/Main/HomeMenuStatesManager.dart';

class HomeMenuItemsManager {
  final homeMenuStatesManager = HomeMenuStatesManager.instance;

  HomeMenuItemsManager._private() {
    _items[1] = new HomeMenuItem(
      icon: HomeMenuIcons.dashboard,
      name: 'Dashboard',
      page: DashboardPage(),
    );
    _items[2] = new HomeMenuItem(
      icon: HomeMenuIcons.sheets,
      name: 'Partitions',
      page: SheetsPage(),
    );
    _items[3] = new HomeMenuItem(
      icon: HomeMenuIcons.favorites,
      name: 'Favories',
      page: FavoritesPage(),
    );
    _items[4] = new HomeMenuItem(
      icon: HomeMenuIcons.lists,
      name: 'Listes',
      page: ListsPage(),
    );
    _items[5] = new HomeMenuItem(
      icon: HomeMenuIcons.settings,
      name: 'Paramètres',
      page: SettingsPage(),
    );
  }
  static final HomeMenuItemsManager _instance = HomeMenuItemsManager._private();
  static HomeMenuItemsManager get instance => _instance;

  Map<int, HomeMenuItem> _items = {};

  int get length => _items.length;

  Widget getHomeButton(index) {
    HomeMenuItem item = _items[index]!;
    return MenuButton(icon: item.icon, value: index, key: item.key);
  }

  RenderBox getRenderBoxOfIndex() => _items[homeMenuStatesManager.index]!
      .key
      .currentContext
      ?.findRenderObject() as RenderBox;

  HomeMenuItem getItemOfIndex() => _items[homeMenuStatesManager.index]!;
}
