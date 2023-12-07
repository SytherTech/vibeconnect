class EventCategory {
  final int id;
  final String name;
  final String imageUrl;
  bool isSelected;
  EventCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
  });
}
