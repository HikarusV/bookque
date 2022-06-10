// import 'package:bookque/common/state_enum.dart';
// import 'package:flutter/material.dart';

// import '../../common/state_enum.dart';
// import '../../data/datasource/api_handler/api_helper.dart';

// class HomeProvider with ChangeNotifier {
//   String messageRecomendationData = '';
//   String messageNewsData = '';

//   bool errorRecomendationData = false;
//   bool errorNewsData = false;

//   ResultState staterecommendationData = ResultState.noData;
//   ResultState statenewsData = ResultState.noData;

//   ResultState get getRecommendationData => getRecommendationData;
//   ResultState get getNewsData => getNewsData;

//   List dataRandomRecomendationItems = [];
//   List dataNewsItems = [];

//   Future<void> fetchRecomendationData() async {
//     try {
//       staterecommendationData = ResultState.loading;
//       final result = HandleApi.getRecommendationRandomItem();
//       if (!result['error']) {
//         messageRecomendationData = result['message'];
//       }    
//     } catch {

//     }
//   }

//   Future<void> fetchNewsData(String userid) async {
//     try {
//       statenewsData = ResultState.loading;
//       final result = HandleApi.getNewestItems(userid);

//       if (!result['error']) {
        
//       } 

//       messageNewsData = result['message'];
//     } catch {
      
//     }
//   }
// }
