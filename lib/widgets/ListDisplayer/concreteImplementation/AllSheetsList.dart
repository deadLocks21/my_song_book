import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/CategoriesChoice/ISearchCategoriesAnalyzer.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AbstractSheetsList.dart';
import 'package:my_song_book/widgets/SearchBar/ISearchAnalyzer.dart';

class AllSheetsList extends AbstractSheetsList
    implements ISearchAnalyzer, ISearchCategoriesAnalyzer {
  final sheetsTable = SheetsTable.instance;

  AllSheetsList() {
    super.baseList = sheetsTable.sheets;
  }

  String _text = "";
  String get text => _text;
  set text(String text) {
    bool add = _text.length < text.length;
    _text = text.toLowerCase();
    List<Sheet> searchList = add ? displayedList : applyCategories(baseList);
    displayedList = applyText(searchList);
    notifyListeners();
  }

  List<Category> _categories = [];
  @override
  addCategory(Category category) {
    this._categories.add(category);
    displayedList = applyCategories(displayedList);
    notifyListeners();
  }

  @override
  removeCategory(Category category) {
    this._categories.remove(category);
    displayedList = applyCategories(applyText(baseList));
    notifyListeners();
  }

  @override
  bool inCategories(Category category) => this._categories.contains(category);

  applyText(List<Sheet> searchList) {
    return searchList
        .where((Sheet element) =>
            element.code.toLowerCase().contains(text) ||
            element.name.toLowerCase().contains(text))
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
