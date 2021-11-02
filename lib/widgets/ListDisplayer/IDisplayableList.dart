import 'package:flutter/material.dart';

class IDisplayableList {
  List get displayedList => throw new Exception(
      'Please, set the _displayedList variable of this IDisplayableList.');

  get length => throw new Exception(
      'Please, set the length method of this IDisplayableList.');

  List<Widget> display() => throw new Exception(
      'Please, set the display method of this IDisplayableList.');
    
  sort() => throw new Exception(
      'Please, set the sort method of this IDisplayableList.');
}
