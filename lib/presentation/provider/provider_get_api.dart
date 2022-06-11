// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../common/state_enum.dart';
// import '../../data/category.dart';
// import '../../data/datasource/api_handler/api_helper.dart';
// import '../../data/detail_items.dart';
// import '../../data/list_items.dart';
// import '../../data/profile.dart';
// import '../../data/search.dart';
//
// class ProviderGetApi extends ChangeNotifier {
//   late final HandleApi getHandleApi;
//
//   String _message = '';
//   late ResultState _resultState;
//   late ListItems _listItems;
//   late Profile _profile;
//   late DetailItems _detailItems;
//   late Category _category;
//   late Searching _searching;
//
//   String get message => _message;
//   ResultState get resultState => _resultState;
//   ListItems get listItems => _listItems;
//   Profile get profile => _profile;
//   DetailItems get detailItems => _detailItems;
//   Category get category => _category;
//   Searching get searching => _searching;
//
//   Future<dynamic> setListItems(String userId) async {
//     try {
//       _resultState = ResultState.loading;
//       notifyListeners();
//       final getListApi = await HandleApi.getItems(userId);
//
//       if (getListApi.items.isEmpty) {
//         _resultState = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _resultState = ResultState.hasData;
//         notifyListeners();
//         return _listItems = getListApi;
//       }
//     } catch (e) {
//       _resultState = ResultState.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
//
//   Future<dynamic> setProfile(String userId) async {
//     try {
//       _resultState = ResultState.loading;
//       notifyListeners();
//       final getApi = await HandleApi.getUser(userId);
//
//       if (getApi.user.name.isEmpty) {
//         _resultState = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _resultState = ResultState.hasData;
//         notifyListeners();
//         return _profile = getApi;
//       }
//     } catch (e) {
//       _resultState = ResultState.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
//
//   Future<dynamic> setDetailItems(String id) async {
//     try {
//       _resultState = ResultState.loading;
//       notifyListeners();
//       final getApi = await HandleApi.getDetailItems(id);
//
//       if (getApi.items.title.isEmpty) {
//         _resultState = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _resultState = ResultState.hasData;
//         notifyListeners();
//         return _detailItems = getApi;
//       }
//     } catch (e) {
//       _resultState = ResultState.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
//
//   Future<dynamic> setCategory(String type) async {
//     try {
//       _resultState = ResultState.loading;
//       notifyListeners();
//       final getApi = await HandleApi.getCategory(type);
//
//       if (getApi.items.isEmpty) {
//         _resultState = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _resultState = ResultState.hasData;
//         notifyListeners();
//         return _category = getApi;
//       }
//     } catch (e) {
//       _resultState = ResultState.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
//
//   Future<dynamic> setSearching(String query) async {
//     try {
//       _resultState = ResultState.loading;
//       notifyListeners();
//       final getApi = await HandleApi.getSearch(query);
//
//       if (getApi.items.isEmpty) {
//         _resultState = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _resultState = ResultState.hasData;
//         notifyListeners();
//         return _searching = getApi;
//       }
//     } catch (e) {
//       _resultState = ResultState.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
// }
