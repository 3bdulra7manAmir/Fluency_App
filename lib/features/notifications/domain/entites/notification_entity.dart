class NotificationEntity {
  NotificationEntity({
    required this.title,
    required this.description,
    required this.time,
    required this.image,
  });

  final String title;
  final String description;
  final String time;
  final String image;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) {
    return NotificationEntity(
      title: json['title'],
      description: json['description'],
      time: json['time'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'time': time,
      'image': image,
    };
  }
}
