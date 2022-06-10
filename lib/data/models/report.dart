class Report {
  String name;
  bool isSelected;

  Report({
    required this.name,
    required this.isSelected,
  });
}

var listReport = [
  Report(
    name: 'Mengandung pornografi',
    isSelected: false,
  ),
  Report(
    name: 'Link/URL bermasalah',
    isSelected: false,
  ),
  Report(
    name: 'Kategori/deskripsi tidak sesuai',
    isSelected: false,
  ),
  Report(
    name: 'Plagiarisme',
    isSelected: false,
  ),
  Report(
    name: 'Melecehkan suatu kaum',
    isSelected: false,
  ),
];
