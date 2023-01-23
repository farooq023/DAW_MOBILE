import 'package:flutter/material.dart';
import '../models/inboxItems.dart';

class InboxPro with ChangeNotifier {
  //Create 9 items
  // List<InboxItems> itemList = LanguageProvider.isEng
  //     ? [
  //         InboxItems(
  //           id: '1',
  //           title: 'New',
  //           subtitle: 'Test 1',
  //           user: 'Ahmad Eldib',
  //           reqN: 'M_836_11_HF_1234',

  //           //date should be the today's date
  //         ),
  //         InboxItems(
  //           id: '2',
  //           title: 'Waiting to proceed',
  //           subtitle: 'Test 2',
  //           user: 'M. Khalid',
  //           reqN: 'M_836_11_HF_1234',
  //         ),
  //         InboxItems(
  //           id: '3',
  //           title: 'Returned',
  //           user: 'Salim Abdullah',
  //           subtitle: 'Test 3',
  //           reqN: 'M_53311_HF_957',
  //         ),
  //         InboxItems(
  //           id: '4',
  //           title: 'Waiting to proceed',
  //           subtitle: 'Test 4',
  //           user: 'M. Al Amri',
  //           reqN: 'FM_8311_HF_1234',
  //         ),
  //         InboxItems(
  //           id: '5',
  //           title: 'Outgoing',
  //           subtitle: 'Test 5',
  //           user: 'Farooq Tariq',
  //           reqN: 'M_836_11_HH12F_323',
  //         ),
  //         InboxItems(
  //           id: '6',
  //           title: 'Signing',
  //           subtitle: 'Test 6',
  //           user: 'Mahmood Ahmad',
  //           reqN: 'M_836_11_HF_1234',
  //         ),
  //       ]
  //     : [
  //         InboxItems(
  //           id: '1',
  //           title: 'جديد',
  //           subtitle: 'تجربة 1',
  //           user: 'أحمد الديب',
  //           reqN: 'M_836_11_HF_1234',

  //           //date should be the today's date
  //         ),
  //         InboxItems(
  //           id: '2',
  //           title: 'بإنتظار الإجراء',
  //           subtitle: 'تجربة 2',
  //           user: 'محمد خالد',
  //           reqN: 'M_836_11_HF_1234',
  //         ),
  //         InboxItems(
  //           id: '3',
  //           title: 'معاد',
  //           user: 'سالم عبدالله',
  //           subtitle: 'تجربة 3',
  //           reqN: 'M_53311_HF_957',
  //         ),
  //         InboxItems(
  //           id: '4',
  //           title: 'بإنتظار الإتمام',
  //           subtitle: 'تجربة 4',
  //           user: 'محمد العمري',
  //           reqN: 'FM_8311_HF_1234',
  //         ),
  //         InboxItems(
  //           id: '5',
  //           title: 'الصادر الخارجي',
  //           subtitle: 'تجربة 5',
  //           user: 'فاروق طارق',
  //           reqN: 'M_836_11_HH12F_323',
  //         ),
  //         InboxItems(
  //           id: '6',
  //           title: 'التوقيع',
  //           subtitle: 'تجربة 6',
  //           user: 'محمود أحمد',
  //           reqN: 'M_836_11_HF_1234',
  //         ),
  //       ];

  List<InboxItems> itemList = [
    InboxItems(
      id: '1',
      title: 'جديد',
      subtitle: 'تجربة 1',
      user: 'أحمد الديب',
      reqN: 'M_836_11_HF_1234',

      //date should be the today's date
    ),
    InboxItems(
      id: '2',
      title: 'بإنتظار الإجراء',
      subtitle: 'تجربة 2',
      user: 'محمد خالد',
      reqN: 'M_836_11_HF_1234',
    ),
    InboxItems(
      id: '3',
      title: 'معاد',
      user: 'سالم عبدالله',
      subtitle: 'تجربة 3',
      reqN: 'M_53311_HF_957',
    ),
    InboxItems(
      id: '4',
      title: 'بإنتظار الإتمام',
      subtitle: 'تجربة 4',
      user: 'محمد العمري',
      reqN: 'FM_8311_HF_1234',
    ),
    InboxItems(
      id: '5',
      title: 'الصادر الخارجي',
      subtitle: 'تجربة 5',
      user: 'فاروق طارق',
      reqN: 'M_836_11_HH12F_323',
    ),
    InboxItems(
      id: '6',
      title: 'التوقيع',
      subtitle: 'تجربة 6',
      user: 'محمود أحمد',
      reqN: 'M_836_11_HF_1234',
    ),
  ];

  // Get all items
  List<InboxItems> get items {
    return [...itemList];
  }

  // void addItems() {
  //   notifyListeners();
  // }
}
