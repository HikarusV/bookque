// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:bookque/data/datasource/api_handler/api_helper.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   test('Get Items test', () async {
//     final result = await HandleApi.getItems('JUpnMAqoxheLgaIRxQeFQ8hKlHi2');
//     // print(result);
//     // print(result.error);
//
//     expect(result.error, false);
//   });
//
//   test('get User test', () async {
//     final result = await HandleApi.getUser('JUpnMAqoxheLgaIRxQeFQ8hKlHi2');
//     // print(result);
//     // print(result.error);
//
//     expect(result.error, false);
//   });
//
//   test('get Detail item test', () async {
//     final result = await HandleApi.getDetailItems('zOd34ogZ');
//     // print(result);
//     // print(result.error);
//
//     expect(result.error, false);
//   });
//
//   test('get Detail Categories test', () async {
//     final result = await HandleApi.getCategory('Sains');
//     // print(result);
//     // print(result.error);
//
//     expect(result.error, false);
//   });
//
//   test('get Post item test', () async {
//     final result = await HandleApi.postItem(
//         'JUpnMAqoxheLgaIRxQeFQ8hKlHi2',
//         'iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==',
//         'Jurnal',
//         'www.google.com',
//         'Judul buku test',
//         'faras',
//         'Mencoba post buku',
//         'Mencoba post buku untuk testing',
//         'Sains,Teknologi');
//     // print(result);
//     // print(result.);
//
//     expect(result.error, false);
//   });
//
//   test('PUT put Item User test', () async {
//     final result = await HandleApi.putItemUser(
//         idUser: 'JUpnMAqoxheLgaIRxQeFQ8hKlHi2',
//         id: 'zOd34ogZ',
//         url: 'www.google.com');
//     // print(result);
//     print(result.error);
//
//     expect(result.error, false);
//   });
//
//   test('Get Random Recommendation test', () async {
//     final result = await HandleApi.getRecommendationRandomItem();
//     print(result);
//     // print(result.error);
//
//     expect(result['error'], false);
//     expect(result['items'].length, 12);
//   });
//
//   test('Get News Items test', () async {
//     final result =
//         await HandleApi.getNewestItems('JUpnMAqoxheLgaIRxQeFQ8hKlHi2');
//     // print(result);
//     // print(result.error);
//
//     expect(result['error'], false);
//     expect(result['items'].length, 8);
//   });
// }
