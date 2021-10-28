import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/DisplayedListManager.dart';

class SearchASheetManager {
  SearchASheetManager._private();
  static final SearchASheetManager _instance = SearchASheetManager._private();
  static SearchASheetManager get instance => _instance;

  final displayedListManager = DisplayedListManager.instance;

  String _text = "";
  set text(String text) {
    bool add = _text.length < text.length;
    this._text = text.toLowerCase();
    List<Sheet> searchList =
        add ? displayedListManager.displayedList : applyCategories(displayedListManager.baseList);
    displayedListManager.displayedList = applyText(searchList);
  }

  List<Category> _categories = [];
  addCategory(Category category) {
    this._categories.add(category);
    displayedListManager.displayedList =
        applyCategories(displayedListManager.displayedList);
  }

  removeCategory(Category category) {
    this._categories.remove(category);
    displayedListManager.displayedList =
        applyCategories(applyText(displayedListManager.baseList));
  }

  applyText(List<Sheet> searchList) {
    return searchList
        .where((Sheet element) =>
            element.code.toLowerCase().contains(this._text) ||
            element.name.toLowerCase().contains(this._text))
        .toList();
  }

  applyCategories(List<Sheet> searchList) {
    return searchList.where(
      (Sheet sheet) {
        bool isIn = true;

        this._categories.forEach((category) {
          isIn = isIn && sheet.categories.contains(category);
        });

        return isIn;
      },
    ).toList();
  }
}
