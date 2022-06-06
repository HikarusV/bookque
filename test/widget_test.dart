// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bookque/main.dart';

void main() {
  // test('Get Items test', () async {
  //   final result = await HandleApi.getItems('JUpnMAqoxheLgaIRxQeFQ8hKlHi2');
  //   // print(result);
  //   // print(result.error);
  //
  //   expect(result.error, false);
  // });
  //
  // test('get User test', () async {
  //   final result = await HandleApi.getUser('JUpnMAqoxheLgaIRxQeFQ8hKlHi2');
  //   // print(result);
  //   // print(result.error);
  //
  //   expect(result.error, false);
  // });
  //
  // test('get Detail item test', () async {
  //   final result = await HandleApi.getDetailItems('zOd34ogZ');
  //   // print(result);
  //   // print(result.error);
  //
  //   expect(result.error, false);
  // });
  //
  // test('get Detail Categories test', () async {
  //   final result = await HandleApi.getCategory('Sains');
  //   // print(result);
  //   // print(result.error);
  //
  //   expect(result.error, false);
  // });
  //
  // test('get Post item test', () async {
  //   final result = await HandleApi.postItem(
  //       'JUpnMAqoxheLgaIRxQeFQ8hKlHi2',
  //       'iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==',
  //       'Jurnal',
  //       'www.google.com',
  //       'Judul buku test',
  //       'faras',
  //       'Mencoba post buku',
  //       'Mencoba post buku untuk testing',
  //       'Sains,Teknologi');
  //   // print(result);
  //   // print(result.);
  //
  //   expect(result.error, false);
  // });
  //
  // test('PUT put Item User test', () async {
  //   final result = await HandleApi.putItemUser(
  //       idUser: 'JUpnMAqoxheLgaIRxQeFQ8hKlHi2',
  //       id: 'zOd34ogZ',
  //       url: 'www.google.com');
  //   // print(result);
  //   print(result.error);
  //
  //   expect(result.error, false);
  // });

  test('Regextext', () {
    final lowerRegex = RegExp(r'[a-z]');
    final upperRegex = RegExp(r'[A-Z]');
    final numberRegex = RegExp(r'[0-9]');
    final symbolRegex = RegExp(r'[^A-Za-z0-9]');

    String test = "tes1234A*";
    int tempScore = 0;
    // Upper = 6,
    // Lower = 4
    // number = 3
    // symbol = 8
    int upper = upperRegex.allMatches(test).length;
    int lower = lowerRegex.allMatches(test).length;
    int number = numberRegex.allMatches(test).length;
    int symbol = symbolRegex.allMatches(test).length;

    tempScore = tempScore + (test.length * 4);
    tempScore = tempScore + ((upper != 0) ? ((test.length - upper) * 2) : 0);
    tempScore = tempScore + ((lower != 0) ? ((test.length - lower) * 2) : 0);
    tempScore = tempScore + (symbol * 6);
    tempScore = (upper != 0 || lower != 0 || symbol != 0)
        ? tempScore + (number * 2)
        : tempScore + (number * 1);

    print(tempScore);

    tempScore = (tempScore > 100) ? 100 : tempScore;

    final data = {
      0: 'minimum length is 6',
      1: 'very weak',
      2: 'weak',
      3: 'good',
      4: 'strong',
      5: 'strong'
    };

    print(data[tempScore ~/ 20]);

    // expect(upper, 6);
    // expect(lower, 4);
    // expect(number, 3);
    // expect(symbol, 8);
  });
  // print('start');
  // print(alphabetRegex.allMatches(test).length);
}
