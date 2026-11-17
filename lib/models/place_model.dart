class PlaceModel {
  String? id;
  final String title;
  final String description;
  final String imagePath;
  final double latitude;
  final double longitude;
  final String category;
  final DateTime date;

  PlaceModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.latitude,
    required this.longitude,
    required this.date,
    this.id,
    required this.category,
  });
}
