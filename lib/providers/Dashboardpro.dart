import 'package:daw_mobile/providers/languageProvider.dart';
import 'package:flutter/material.dart';
import '../models/Items.dart';

class DashboardPro with ChangeNotifier {
  //Create 9 items

  //this is a normal comment
  List<Items> _items = LanguageProvider.isEng
      ? [
          Items(
            id: '1',
            title: 'New',
            color: Color.fromARGB(255, 237, 140, 242),
            icon: Icons.mail,
            number: 0,
          ),
          Items(
            id: '2',
            title: 'Waiting to Proceed',
            color: Color.fromARGB(255, 112, 185, 30),
            icon: Icons.mark_as_unread,
            number: 5,
          ),
          Items(
            id: '3',
            title: 'Returned',
            color: Color.fromARGB(255, 227, 216, 122),
            icon: Icons.rotate_left_rounded,
            number: 2,
          ),
          Items(
            id: '4',
            title: 'Waiting to Complete',
            color: Colors.grey,
            icon: Icons.wifi_protected_setup_sharp,
            number: 0,
          ),
          Items(
            id: '5',
            title: 'Outgoing',
            color: Color.fromARGB(255, 154, 20, 20),
            icon: Icons.mail_outline,
            number: 1,
          ),
          Items(
            id: '6',
            title: 'Signing',
            color: Color.fromARGB(179, 255, 78, 196),
            //Signature icon
            icon: Icons.app_registration,
            number: 9,
          ),
        ]
      : [
          Items(
            id: '1',
            title: 'جديد',
            color: Color.fromARGB(255, 237, 140, 242),
            icon: Icons.mail,
            number: 0,
          ),
          Items(
            id: '2',
            title: 'بإنتظار الإجراء',
            color: Color.fromARGB(255, 112, 185, 30),
            icon: Icons.mark_as_unread,
            number: 5,
          ),
          Items(
            id: '3',
            title: 'معاد',
            color: Color.fromARGB(255, 227, 216, 122),
            icon: Icons.rotate_left_rounded,
            number: 2,
          ),
          Items(
            id: '4',
            title: 'بإنتظار الإتمام',
            color: Colors.grey,
            icon: Icons.wifi_protected_setup_sharp,
            number: 0,
          ),
          Items(
            id: '5',
            title: 'الصادر الخارجي',
            color: Color.fromARGB(255, 154, 20, 20),
            icon: Icons.mail_outline,
            number: 1,
          ),
          Items(
            id: '6',
            title: 'التوقيع',
            color: Color.fromARGB(179, 255, 78, 196),
            //Signature icon
            icon: Icons.app_registration,
            number: 9,
          ),
        ];

  //Get all items
  List<Items> get items {
    return [..._items];
  }

  void addItems() {
    notifyListeners();
  }
}
