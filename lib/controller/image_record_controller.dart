// import 'package:get/get.dart';

// import '../model/image_record.dart';
// import '../service/load_records_service.dart';

// class ImageRecordController extends GetxController
//     with StateMixin<List<Record>> {
//   final LoadRecordsSerice _loadRecordService = LoadRecordsSerice();

//   @override
//   void onInit() {
//     super.onInit();
//     importRecords();
//   }

//   importRecords() async {
//     // make status to loading
//     change(null, status: RxStatus.loading());

//     Future.delayed(Duration(seconds: 3));

//     // Code to get data
//     await _loadRecordService.load().then((records) {
//       records.isEmpty
//           ? change(records, status: RxStatus.empty())
//           : change(records, status: RxStatus.success());
//     }, onError: (err) {
//       change(null, status: RxStatus.error(err.toString()));
//     });
//   }
// }


// /*
// class HomePage extends GetView<UserController> {

//   @override
//   Widget build(BuildContext context) {

//     // controller from GetView
//     return controller.obx((state) {
//         return OtherWidget()
//     },
//     onLoading: CircularProgressIndicator(),
//    )
//   }
// }
// */