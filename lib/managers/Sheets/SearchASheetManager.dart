import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/Sheets/DisplayedSheetsManager.dart';
import 'package:my_song_book/widgets/SearchBar/ISearchAnalyzer.dart';

class SearchASheetManager extends ISearchAnalyzer {
  SearchASheetManager._private(String name) {
    displayedListManager = DisplayedSheetsManager.instance(name);
  }
  static Map<String, SearchASheetManager> _instances = {};
  static SearchASheetManager instance(String name) {
    if (!_instances.containsKey(name))
      _instances[name] = SearchASheetManager._private(name);
    return _instances[name]!;
  }

  late var displayedListManager;

  set text(String text) {
    bool add = super.text.length < text.length;
    super.text = text.toLowerCase();
    List<Sheet> searchList = add
        ? displayedListManager.displayedList
        : applyCategories(displayedListManager.baseList);
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
            element.code.toLowerCase().contains(super.text) ||
            element.name.toLowerCase().contains(super.text))
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
