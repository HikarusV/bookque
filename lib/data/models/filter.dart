class Filters {
  String name;
  bool isSelected;

  Filters({
    required this.name,
    required this.isSelected,
  });
}

var listFilter = [
  Filters(
    name: 'Terbaru',
    isSelected: false,
  ),
  Filters(
    name: 'Terlama',
    isSelected: false,
  ),
  Filters(
    name: 'Terpopuler',
    isSelected: false,
  ),
];
