class Note {
  final int id;
  final String content;

  Note({
    required this.id,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int,
      content: json['content'] as String,
    );
  }
}
