class Property {
  final String id;
  final String imageUrl;
  final String title;
  final double pricePerMonth;
  final String location;
  final bool isFavorited;

  const Property({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.pricePerMonth,
    required this.location,
    this.isFavorited = false,
  });
}