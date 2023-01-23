import 'package:daw_mobile/providers/languageProvider.dart';
import 'package:flutter/material.dart';
import '../Models/HistoryItems.dart';

class HistoryPro with ChangeNotifier {
  //Create 9 items

  //this is a normal comment
  List<HistoryItems> _items = LanguageProvider.isEng
      ? [
          HistoryItems(
            id: '1',
            from: 'Director of Administration',
            to: 'General Manager',
            subject: 'Modify the administrative',
          ),
          HistoryItems(
            id: '2',
            from: 'Ahmad Eldib',
            to: 'Farooq Tariq',
            subject: 'The location of book',
          ),
          HistoryItems(
            id: '3',
            from: 'Farooq Tariq',
            to: 'Ahmad Eldib',
            subject: 'Waiting to proceed',
          ),
          HistoryItems(
            id: '4',
            from: 'M. Khalid',
            to: 'M. AlAmri',
            subject: 'Outgoing',
          ),
          HistoryItems(
            id: '5',
            from: 'Salim Abdullah',
            to: 'Mahmood Ahmad',
            subject: 'Returned',
          ),
          HistoryItems(
            id: '6',
            from: 'Mahmood Ahmad',
            to: 'Salim Abdullah',
            subject: 'New',
          ),
        ]
      : [
          HistoryItems(
            id: '1',
            from: 'مدير الشؤون الإدارية',
            to: 'المدير العام',
            subject: 'تعديل السياسة الإدارية',
          ),
          HistoryItems(id: '2', from: 'أحمد الديب', to: 'فاروق طارق', subject: 'مكان وجود كتاب'),
          HistoryItems(
            id: '3',
            from: 'فاروق طارق',
            to: 'أحمد الديب',
            subject: 'بإنتظار الإتمام',
          ),
          HistoryItems(
            id: '4',
            from: 'محمد خالد',
            to: 'محمد العامري',
            subject: 'الصادر الخارجي',
          ),
          HistoryItems(
            id: '5',
            from: 'سالم العبدالله',
            to: 'محمود أحمد',
            subject: 'معاد',
          ),
          HistoryItems(
            id: '6',
            from: 'محمود أحمد',
            to: 'سالم العبدالله',
            subject: 'جديد',
          ),
        ];

  //Get all items
  List<HistoryItems> get items {
    return [..._items];
  }

  void addItems() {
    notifyListeners();
  }
}
