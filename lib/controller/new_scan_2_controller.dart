import 'package:get/get.dart';
import '../service/signin_service.dart';
import '../model/user.dart';
import '../model/row_record.dart';
import '../model/image_record.dart';
import '../pages/data_sources.dart';
import '../service/load_records_service.dart';

class NewScan2Controller extends GetxController {
  //var records = <Record>[];

  final userRx = User().obs;
  //final desserts = <Dessert>[].obs;
  final rowRecordsRx = <RowRecord>[].obs;

  final selectedRx = Rxn<RowRecord>();

  final SigninService _signinService = SigninService();
  final LoadRecordsSerice _loadRecordService = LoadRecordsSerice();

  @override
  onInit() {
    super.onInit();

    initUser();

    // 沒有user
    if (userRx.value.userId.isEmpty) {
      rowRecordsRx.value = [];
    } else {
      try {
        Future.delayed(Duration(seconds: 3));

        // load and convert
        _loadRecordService.load().then((records) {
          print('onInit len:${records.length}');

          var rowRecordList = List<RowRecord>.generate(records.length, (index) {
            RowRecord r = RowRecord('${index + 1}', records[index]);
            //       print('r1: $r');
            return r;
          });

          rowRecordsRx.value = rowRecordList;
          print('onInit rowRecordList len:${rowRecordList.length}');
        }).catchError((error) {
          print('Future finished with error ${error}');
        }).whenComplete(() {
          print('Either of then or catchError has run at this point');
        });
      } catch (e) {
        print('load records error occurred!');
        rethrow;
      }
      //convert(recordList);
    }
  }

  login() async {
    // make status to loading
    // change(null, status: RxStatus.loading());

    Future.delayed(Duration(seconds: 3));
//
  }

  initUser() {
    User auser = User('7777');
    userRx.value = auser;
  }

  selectItem(String key) {
    print('controller selectItem is called');
    print('selectItem key:$key');

    late RowRecord changed;
    var ls = rowRecordsRx.map((e) {
      if (e.key == key) {
        e.selected = true;
        changed = e;
        print('selectItem true');
      } else {
        e.selected = false;
        //  print('selectItem false');
      }
      return e;
    }).toList();

    print('bbbb');
    rowRecordsRx.value = ls;
    selectedRx.value = changed;

    // update();
  }

  startScan() {
    // print('start scan done!!!');
  }
}
