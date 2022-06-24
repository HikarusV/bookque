import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/unsplash.dart';
import 'package:flutter/material.dart';

class ProfileMakerProvider with ChangeNotifier {
  TextEditingController name = TextEditingController();

  ResultState state = ResultState.noData;

  String? imageUrl;
  String? author;

  void getImageUnsplash(String username) async {
    name.text = username;
    state = ResultState.loading;
    notifyListeners();

    try {
      final response = await Unsplash.getRandomPhotos();
      if (!response['error']) {
        imageUrl = response['url'];
        author = response['author'];
        state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      imageUrl = 'https://graph.facebook.com/111968404870160/picture';
      state = ResultState.error;
      notifyListeners();
    }
  }

  initData(String username, String imageUrl) {
    state = ResultState.loading;
    notifyListeners();

    name.text = username;
    this.imageUrl = imageUrl;
    state = ResultState.hasData;
    notifyListeners();
  }
}
