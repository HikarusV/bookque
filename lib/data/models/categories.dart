class Categories {
  String name;
  String imageAsset;
  String id;
  bool isSelected;

  Categories({
    required this.name,
    required this.id,
    required this.imageAsset,
    required this.isSelected,
  });
}

final uploadType = ['Makalah', 'E-Book', 'Jurnal', 'Skripsi', 'Artikel'];

final listCategoriesId = [
  'arts',
  'animals',
  'fiction',
  'science_&_mathematics',
  'business_&_finance',
  "children's",
  'history',
  'health_&_wellness',
  'biography',
  'social_sciences',
  'places',
  'textbooks',
  'books_by_language'
];

var listCategory = [
  Categories(
    name: 'Arts',
    id: 'arts',
    imageAsset: 'assets/cat1.png',
    isSelected: false,
  ),
  Categories(
    name: 'Animals',
    id: 'animals',
    imageAsset: 'assets/cat2.png',
    isSelected: false,
  ),
  Categories(
    name: 'Fiction',
    id: 'fiction',
    imageAsset: 'assets/cat3.png',
    isSelected: false,
  ),
  Categories(
    name: 'Science',
    id: 'science_&_mathematics',
    imageAsset: 'assets/cat4.png',
    isSelected: false,
  ),
  Categories(
    name: 'Business',
    id: 'business_&_finance',
    imageAsset: 'assets/cat5.png',
    isSelected: false,
  ),
  Categories(
    name: 'Children',
    id: 'children\'s',
    imageAsset: 'assets/cat6.png',
    isSelected: false,
  ),
  Categories(
    name: 'History',
    id: 'history',
    imageAsset: 'assets/cat7.png',
    isSelected: false,
  ),
  Categories(
    name: 'Health',
    id: 'health_&_wellness',
    imageAsset: 'assets/cat8.png',
    isSelected: false,
  ),
  Categories(
    name: 'Biography',
    id: 'biography',
    imageAsset: 'assets/cat9.png',
    isSelected: false,
  ),
  Categories(
    name: 'Social',
    id: 'social_sciences',
    imageAsset: 'assets/cat10.png',
    isSelected: false,
  ),
  Categories(
    name: 'Places',
    id: 'places',
    imageAsset: 'assets/cat11.png',
    isSelected: false,
  ),
  Categories(
    name: 'Textbooks',
    id: 'textbooks',
    imageAsset: 'assets/cat12.png',
    isSelected: false,
  ),
  Categories(
    name: 'Language',
    id: 'books_by_language',
    imageAsset: 'assets/cat13.png',
    isSelected: false,
  ),
];
